(function($) {

	/*日期选择*/
	var btns = $('.date_select');
	var beginDate, enDate;
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			//限制选择的时间不超过当前时间
			//并且前者时间不能大于后者时间，后者时间不能小于前者时间

			var picker = new mui.PopPicker();
			var nowDate = new Date();
			var textDate = isDate(btn.innerText) ? btn.innerText : nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate();

			if(i == 0 && enDate) {
				picker = new $.DtPicker({
					type: "date",
					endDate: new Date(enDate),
					value: textDate
				});
			} else if(i == 1 && beginDate) {
				picker = new $.DtPicker({
					type: "date",
					beginDate: new Date(beginDate),
					endDate: new Date(),
					value: textDate
				});
			} else {
				picker = new $.DtPicker({
					type: "date",
					endDate: new Date(),
					value: textDate
				});
			}
			picker.show(function(rs) {
				if(i == 0) {
					beginDate = rs.text;
				} else if(i == 1) {
					enDate = rs.text;
				}
				//rs.text 拼合后的 text
				btn.innerText = rs.text;
				//释放资源
				picker.dispose();
			});
		}, false);
	});

	//简单验证日期格式
	function isDate(b) {
		var a = /^(\d{4})-(\d{2})-(\d{2})$/
		if(!a.test(b)) {
			return false
		} else
			return true
	}
})(mui);
(function($) {

	/*日期选择*/
	var btns = $('.date_select');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			//限制选择的时间不超过当前时间
			//并且前者时间不能大于后者时间，后者时间不能小于前者时间

			var picker = new mui.PopPicker();
			var nowDate = new Date();
			var textDate = isDate(btn.innerText) ? btn.innerText : nowDate.getFullYear() 
							+ "-" 
							+ (nowDate.getMonth() + 1 > 9 ? (nowDate.getMonth() + 1) : "0" + (nowDate.getMonth() + 1))
							+ "-"
							+ (nowDate.getDate() > 9 ? nowDate.getDate() : "0" + nowDate.getDate());

			var beginDate, endDate;
			if(i % 2 == 0) {
				endDate = btns[i + 1].innerText;
			} else {
				beginDate = btns[i - 1].innerText;
			}

			if(i % 2 == 0 && isDate(endDate)) {
				picker = new $.DtPicker({
					type: "date",
					endDate: new Date(endDate),
					value: isDate(btn.innerText) ? textDate : endDate
				});
			} else if(i % 2 == 1 && isDate(beginDate)) {
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
				//rs.text 拼合后的 text
				btn.value = rs.text;
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
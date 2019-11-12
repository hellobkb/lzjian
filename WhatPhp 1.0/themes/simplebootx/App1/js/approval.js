mui.init({});
//阻尼系数
var deceleration = mui.os.ios ? 0.003 : 0.0009;
mui('.mui-scroll-wrapper').scroll({
	bounce: false,
	indicators: true, //是否显示滚动条
	deceleration: deceleration
});

//列表点击事件
bandList(mui('.reanod-data'));

//上拉请求请求地址、请求参数
var requestUrl1 = localStorage.getItem('keyUrl')+'/index.php?g=App&m=Home&a=getOffer'; //报价审批上拉请求地址
var requestUrl2 = localStorage.getItem('keyUrl')+'/index.php?g=App&m=Home&a=getClient'; //阶段审批上拉请求地址
var requestUrl3 = localStorage.getItem('keyUrl')+'/index.php?g=App&m=Home&a=getContact'; //沟通关注审批上拉请求地址

var pageCount1 = 1; //报价审批上拉请求页数
var pageCount2 = 1; //阶段审批上拉请求页数
var pageCount3 = 1; //沟通关注审批上拉请求页数

var requestPost1 = {};
requestPost1.roleid = localStorage.getItem('role');
requestPost1.uid = localStorage.getItem('uid');


var requestPost2 = {};
requestPost2.roleid = localStorage.getItem('role');
requestPost2.uid = localStorage.getItem('uid');


var requestPost3 = {};
requestPost3.roleid = localStorage.getItem('role');
requestPost3.uid = localStorage.getItem('uid');


mui.ready(function() {
	//初始化业务员和审批状态
	var params = {};
	params.role = localStorage.getItem('role');
	params.uid = localStorage.getItem('uid');
	mui.post(localStorage.getItem('keyUrl')+'/index.php?g=App&m=Home&a=searchData', params ,function (str){

		 if(str.state ==1 ){
		 	var level = "";
//		 	mui.each(str.list3, function(key, value){
//		 		var sale = document.createElement('option');
//		 		var sale1 = document.createElement('option');
//		 		var sale2 = document.createElement('option');
//		 		
//		 		sale.value = value.id;
//		 		sale1.value = value.id;
//		 		sale2.value = value.id;
//		 		
//		 		sale.innerHTML = value.user_login;
//		 		sale1.innerHTML = value.user_login;
//		 		sale2.innerHTML = value.user_login;
//		 		
//		 		document.getElementById("scroll1").querySelector(".select_salesman").appendChild(sale);
//		 		document.getElementById("scroll2").querySelector(".select_salesman").appendChild(sale1);
//		 		document.getElementById("scroll3").querySelector(".select_salesman").appendChild(sale2);
//
//		 	})


		//业务员
		var yewuyuanPicker = new mui.PopPicker();
		yewuyuanPicker.setData(str.list3);
		mui.each(document.querySelectorAll('.select_salesman'), function(index,el) {
			el.addEventListener('tap', function(event) {
			yewuyuanPicker.show(function(items) {
				el.value = items[0].text;
				el.setAttribute("data-val" ,items[0].value);
				//返回 false 可以阻止选择框的关闭
				//return false;
				});
			}, false);
		});
		
		//审批状态（报价审批）
		var shenpizhuangtaiPicker = new mui.PopPicker();
		shenpizhuangtaiPicker.setData([{
				value: '3',
				text: '全部'
			}, {
				value: '0',
				text: '未批准'
			}, {
				value: '1', 
				text: '已批准'
			}, {
				value: '2', 
				text: '已拒绝'
			}]);
		var shenpizhuangtaiInput = document.getElementById('baojia_state');
		shenpizhuangtaiInput.addEventListener('tap', function(event) {
				shenpizhuangtaiPicker.show(function(items) {
					shenpizhuangtaiInput.value = items[0].text;
					shenpizhuangtaiInput.setAttribute("data-val" ,items[0].value);
					
					//返回 false 可以阻止选择框的关闭
					//return false;
				});
			}, false);
		
		//审批状态（沟通关注审批）
		var shenpizhuangtai1Picker = new mui.PopPicker();
		shenpizhuangtai1Picker.setData([{
				value: '2',
				text: '全部'
			}, {
				value: '0',
				text: '未回复'
			}, {
				value: '1', 
				text: '已回复'
			}]);
		var shenpizhuangtai1Input = document.getElementById('goutong_state')
		shenpizhuangtai1Input.addEventListener('tap', function(event) {
				shenpizhuangtai1Picker.show(function(items) {
					shenpizhuangtai1Input.value = items[0].text;
					shenpizhuangtai1Input.setAttribute("data-val" ,items[0].value);
					
					//返回 false 可以阻止选择框的关闭
					//return false;
				});
			}, false);
		
		//阶段
		var yewuyuanPicker = new mui.PopPicker();
		yewuyuanPicker.setData(str.level);
		mui.each(document.querySelectorAll('#jieduan'), function(index,el) {
			el.addEventListener('tap', function(event) {
			yewuyuanPicker.show(function(items) {
				el.value = items[0].text;
				el.setAttribute("data-val" ,items[0].value);
				//返回 false 可以阻止选择框的关闭
				//return false;
				});
			}, false);
		});

		 }else if (str.state == -1 ){
		 	mui.toast('网络链接错误');
		 	return ;
		 }
	},'json');
});

mui.ready(function() {
	//循环初始化所有下拉刷新，上拉加载。
	mui.each(document.querySelectorAll('#slider .mui-scroll'), function(index,pullRefreshEl) {	
		
		var out_self;
		
		mui(pullRefreshEl).pullToRefresh({
			down: {
				callback: function() {
					out_self = this;
					setTimeout(function() {
						downScreen(index,out_self,pullRefreshEl);
						
						out_self.endPullDownToRefresh();
						
						mui.toast("test - down"+index);
					}, 1000);
				}
			},
			up: {
				auto: true, //自动上拉加载一次
				callback: function() {
					out_self = this;
					setTimeout(function() {
						upScreen(index,out_self);
						
						mui.toast("test - up"+index);
					}, 1000);
				}
			}
		});
		
		var item = this;
		
		var submitbtn = item.querySelector(".reanod_confirm");
		var cancelBtn = item.querySelector(".reanod_cancel")
		var screenData = item.querySelector('.reanod-data'); //上拉数据
		var fold = item.querySelector(".mui-table-view-cell");
	
		//确认按钮
		submitbtn.addEventListener('tap', function() {
			fold.classList.remove("mui-active"); //收起折叠
			screenData.innerHTML = ''; //清空数据
	
			//获取所有值
			var startDate = item.querySelector('.startDate').value; //开始时间
			var endDate = item.querySelector('.endDate').value; //结束时间
			var selectSalesman = item.querySelector('.select_salesman').getAttribute("data-val"); //业务员
			var selectState = item.querySelector('.select_state').getAttribute("data-val"); //状态

			if(index !=1){
				var customerName = item.querySelector('.customer_name').value; //客户名称
				customerName && customerName.value;
			}
			
			//更改请求地址或请求参数
			if(index == 0) {
				requestPost1.stime = startDate;
				requestPost1.etime = endDate;
				requestPost1.reqstatus = selectState;
				requestPost1.cname = customerName;
				requestPost1.sale = selectSalesman;
	
				pageCount1 = 1; // 重置刷新次数
			} else if(index == 1) {
				requestPost2.stime = startDate;
				requestPost2.etime = endDate;
				requestPost2.level = selectState;
				requestPost2.sale = selectSalesman;
	
				pageCount2 = 1;// 重置刷新次数
			} else if(index == 2) {
				requestPost3.stime = startDate;
				requestPost3.etime = endDate;
				requestPost3.reqstatus = selectState;
				requestPost3.cname = customerName;
				requestPost3.sale = selectSalesman;
	
				pageCount3 = 1; // 重置刷新次数
			}
			
			upScreen(index,out_self);
		});
		
		//取消按钮
		cancelBtn.addEventListener('tap', function() {
			fold.classList.remove("mui-active"); //收起折叠
		});
	});
});

//下拉加载
function downScreen(index,self,pullRefreshEl){
	self.element.querySelector('.reanod-data').innerHTML = '';
	mui(pullRefreshEl).pullToRefresh().refresh(true);
	
	if(index == 0) {
		pageCount1 = 1;
		upScreen(index,self);
	} else if(index == 1) {
		pageCount2 = 1;
		upScreen(index,self);
	} else if(index == 2) {
		pageCount3 = 1;
		upScreen(index,self);
	}
}

//上拉加载
var upScreen = function(index, self) {
	var requestUrl, requestPost;
	
	if(index == 0) {
		var scroll = document.getElementById('scroll1');
		requestUrl = requestUrl1;
		requestPost = requestPost1;
		requestPost.page = pageCount1;
		
		//获取数据
		mui.post(requestUrl, requestPost , function(str){
			if(str.state == 1){
				data = str.list;
				pageCount1++ ; 

				if(data.length <3){
					self.endPullUpToRefresh(true); 
				}else {
					self.endPullUpToRefresh(false);
				}
				
				var muiLoading = scroll.querySelector('.mui-loading');
				if(muiLoading) muiLoading.innerHTML = '';
				//显示筛选
				scroll.firstElementChild.style.display = "";

				//添加数据
				addData(data, self, index+1);
			}else if (str.state == -1 ){
				self.endPullUpToRefresh(true); //参数为true表示没有更多数据了。
				return;
			}
		},'json');
	} else if(index == 1) {
		var scroll = document.getElementById('scroll2').firstElementChild;
		requestUrl = requestUrl2;
		requestPost = requestPost2;
		requestPost.page = pageCount2;
		
		//获取数据
		mui.post(requestUrl, requestPost , function(str){
			if(str.state == 1){
				data = str.list;
				pageCount2++ ; 

				if(data.length <3){
					self.endPullUpToRefresh(true); 
				}else {
					self.endPullUpToRefresh(false);
				}
				
				var muiLoading = scroll.querySelector('.mui-loading');
				if(muiLoading) muiLoading.innerHTML = '';
				//显示筛选
				scroll.firstElementChild.style.display = "";

				//添加数据
				addData(data, self, index+1);
			}else if (str.state == -1 ){
				self.endPullUpToRefresh(true); //参数为true表示没有更多数据了。
				return;
			}
		},'json');
	} else if(index == 2) {
		var scroll = document.getElementById('scroll3').firstElementChild;
		requestUrl = requestUrl3;
		requestPost = requestPost3;
		requestPost.page = pageCount3;

		mui.post(requestUrl, requestPost, function(str){
			if(str.state == 1 ){
				data = str.list;
				pageCount3 ++;
				if(data.length<3){
					self.endPullUpToRefresh(true); 
				}else {
					self.endPullUpToRefresh(false);
				}
			
				var muiLoading = scroll.querySelector('.mui-loading');
				if(muiLoading) muiLoading.innerHTML = '';
				//显示筛选
				scroll.firstElementChild.style.display = "";
			
				addData(data, self, index+1);
			}else if (str.state == -1 ){
				 
				self.endPullUpToRefresh(true); //参数为true表示没有更多数据了。
				return;
			}
		},'json');
	}
}

//添加数据
function addData(data, self, num) {
	var table = self.element.querySelector('.reanod-data');
	var div = document.createElement('div');
	var divContent = '';

	for(var i in data) {
		var spanContent = '';

		var company = data[i].company; //公司
		var proposer = data[i].proposer; //申请人
		var applyDate = data[i].applyDate; //申请时间

		//不确定值，如：阶段，有时没有用到
		var isDispose = data[i].isDispose; //0 为未回复、未审批，1为已回复、已审批，其它表示为拒绝
		var attachment = data[i].attachment; //附件，0为没有附件，其它表示有附件
		if(!attachment || attachment == '0' || attachment == 0){
			attachment = '无';
		}else{
			attachment ='有';
		}

		var state = data[i].state; //阶段

		//详情地址
		var linkUrl = data[i].detailUrl;

		//报价审批
		if(num == 1) {
			if(isDispose == 0) {
				spanContent = '' +
					'<span style="color:red;">未审批<span class="mui-icon mui-icon-forward"></span></span>';
			} else if(isDispose == 1) {
				spanContent = '' +
					'<span>已审批<span class="mui-icon mui-icon-forward"></span></span>';
			} else {
				spanContent = '' +
					'<span>已拒绝<span class="mui-icon mui-icon-forward"></span></span>';
			}

			divContent += '' +
				'<div class ="reanod-result">' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-title-left"><span>' + company + '</span></div>' +
				'<div class="result-title-right">' + spanContent + '</div>' +
				'</a>' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-content">' + '<div>申请人：<span>' + proposer + '</span></div>' +
				'<div>附件：<span>' + attachment + '</span></div>' +
				'<div>申请时间：<span>' + applyDate + '</span></div>' +
				'</div>' +
				'</a>' +
				'</div>';
		}
		//阶段审批
		else if(num == 2) {
			spanContent = '' +
				'<span style="color:red">审批<span class="mui-icon mui-icon-forward"></span></span>';

			divContent += '' +
				'<div class ="reanod-result">' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-title-left"><span>' + company + '</span></div>' +
				'<div class="result-title-right">' + spanContent + '</div>' +
				'</a>' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-content">' + '<div>申请人：<span>' + proposer + '</span></div>' +
				'<div>申请阶段：<span>' + state + '</span></div>' +
				'<div>申请时间：<span>' + applyDate + '</span></div>' +
				'</div>' +
				'</a>' +
				'</div>';
		}
		//沟通关注审批					
		else if(num == 3) {
			if(isDispose == 0) {
				spanContent = '' +
					'<span style="color:red;">未回复<span class="mui-icon mui-icon-forward"></span></span>';
			} else {
				spanContent = '' +
					'<span>已回复<span class="mui-icon mui-icon-forward"></span></span>';
			}

			divContent += '' +
				'<div class ="reanod-result">' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-title-left"><span>' + company + '</span></div>' +
				'<div class="result-title-right">' + spanContent + '</div>' +
				'</a>' +
				'<a href ="' + linkUrl + '">' +
				'<div class="result-content">' + '<div>申请人：<span>' + proposer + '</span></div>' +
				'<div>所处阶段：<span>' + state + '</span></div>' +
				'<div>申请时间：<span>' + applyDate + '</span></div>' +
				'</div>' +
				'</a>' +
				'</div>';
		}

	}
	div.innerHTML = divContent;
	table.appendChild(div);

	addMaxWidth();
}

//控制公司名称最大宽度
function addMaxWidth() {
	var titleLefts = document.querySelectorAll('.result-title-left');
	for(var i = 0; i < titleLefts.length; i++) {
		var tl = titleLefts[i];
		var maxWidth = tl.nextSibling.offsetWidth + 4;
		tl.style.maxWidth = 'calc(100% - ' + maxWidth + 'px)';
	}
}

//筛选按钮
//默认绑定第一个折叠列表
document.getElementById('reanod_filtrate').addEventListener('tap', function() {
	//遍历筛选
	mui('.mui-slider-item').each(function() {
		if(this.classList.contains('mui-active')) {
			this.querySelector(".mui-table-view-cell").classList.add('mui-active');
		}
	});
});
mui.init({
	pullRefresh: {
		container: '#pullrefresh', //待刷新区域标识
		up: {
			contentrefresh: "正在加载...", //
			contentnomore: '没有更多数据了', //
			contentinit: '上拉显示更多',
			callback: pullupRefresh //必选，刷新函数
		},
		down : {
			callback: pullDownRefresh //必选，刷新函数
		}
	}
});

if(mui.os.plus) {
	mui.plusReady(function() {
		
		setTimeout(function() {
			mui('#pullrefresh').pullRefresh().pullupLoading();
		}, 0);
	});
} else {
	 
	mui.ready(function() {
		mui('#pullrefresh').pullRefresh().pullupLoading();
	});
}


//列表点击事件
bandList(mui('.reanod-data'));

//请求地址、请求参数
var requestUrl =  localStorage.getItem('keyUrl')+'/index.php?g=App&m=Mobile&a=xp_list_pull'; 
var requestPost = {};

var token_input = document.getElementsByName('token')[0];
requestPost.token = token_input.value;

//下拉或者上拉刷新次数
var pullcount =1 ;
//每次刷新加载数目
var pullrow = 3; 


//查询按钮事件
document.getElementById("reanod_select").addEventListener("tap", function(event) {

	mui(".mui-table-view-cell").each(function(){

		this.className = this.className.replace('mui-active' ,'');

	});

	//数据置空
	var table = document.body.querySelector('.reanod-data');
	table.innerHTML = '';

	//搜索数据
	requestPost.start_time = document.getElementById('startDate').value;
	requestPost.end_time = document.getElementById('endDate').value;
	requestPost.from_country = document.getElementById('select_country').value;
	requestPost.salesman = document.getElementById('select_salesman').value;
	requestPost.keyword = document.getElementById('keyword').value;

	pullcount=1;
	
	pullDownRefresh();

	//mui('#pullrefresh').pullRefresh().refresh(true);
	//mui('#pullrefresh').pullRefresh().pullupLoading();

});

//取消按钮事件
document.getElementById("reanod_cancel").addEventListener("tap", function(event) {

	mui(".mui-table-view-cell").each(function(){

		this.className = this.className.replace('mui-active' ,'');

	});

});
 
//上拉加载
function pullupRefresh() {
	/*
		post 接口获取数据
	*/		
	setTimeout(function() {
		
		requestPost.page = pullcount;
		requestPost.listrow = pullrow;

		requestPost.start_time = document.getElementById('startDate').value;
		requestPost.end_time = document.getElementById('endDate').value;
		requestPost.from_country = document.getElementById('select_country').value;
		requestPost.salesman = document.getElementById('select_salesman').value;
		requestPost.keyword = document.getElementById('keyword').value;

		mui.ajax(requestUrl, {
			data:requestPost,
			dataType :'json',
			type :'post',
			timeout:10000,
			success:function(str){
				var state = str.status;
				if(state == 1){
					var data = str.info;

					pullcount ++;
					//不停止上拉刷新
					addData(data);
					
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
				}else if (state == 0){
					//停止上拉刷新
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return ;
				}

			},
			error:function(xhr ,type, errorThrown){
				mui.toast("获取数据失败");
			}

		});

	}, 1500);
}

/*
	下拉刷新
*/
function pullDownRefresh(){
		
	 setTimeout(function() {
	 	pullcount =1 ;

	 	//停止刷新
		mui("#pullrefresh").pullRefresh().endPulldownToRefresh();
		mui('#pullrefresh').pullRefresh().refresh(true);

	 	requestPost.page = pullcount;

	 	mui.ajax(requestUrl ,{
	 		data : requestPost,
	 		dataType :'json',
			type :'post',
			timeout:10000,
			success :function(str){
				var state = str.status;
				if(state == 1){
					var data = str.info;
					
					//添加数据
					addData(data);
					pullcount ++;
					
					if(data.length <3){
						mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
						 
						return ;
					}else {
						mui('#pullrefresh').pullRefresh().endPulldownToRefresh(false);
					}
				}else {

					mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
	 
					return ;
				}
			},
			error :function (xhr ,type, errorThrown){
				mui.toast("获取数据失败");
			}
	 	});
	 	
	 }, 1500);
}

//添加数据
function addData(data) {

	var table = document.body.querySelector('.reanod-data');
	 
	if(pullcount==1){
		table.innerHTML = '';
	}
	var div = document.createElement('div');
	var divContent = '';

	for(var i in data) {
		var spanContent = '';

		var isGive = data[i].shifoufenpei; //分配
		var company = data[i].company; //公司
		var linkUrl = data[i].detailUrl; //url
		var lianxiren = data[i].lianxiren; //联系人
		var country = data[i].country; //国家
		var inquiryType = data[i].inquiryType; //询盘类型
		var email = data[i].email; //邮箱
		var sendDate = data[i].sendDate; //发送时间

		if(isGive == 0) {
			spanContent = '' +
				'<span class="iconfont icon-people" style="color:red;"></span>未分配';
		}  else {
			spanContent = '' +
				'<span class="iconfont icon-people"></span>' + isGive;
		}

		divContent += '' +
			'<div class ="reanod-result">' +
			'<a href ="' + linkUrl + '">' +
			'<div class="result-title-left"><span>' + company + '</span></div>' +
			'<div class="result-title-right">' + spanContent + '</div>' +
			'</a>' +
			'<a href ="' + linkUrl + '">' +
			'<div class="result-content">' + '<div>联系人：<span>' + lianxiren + '</span></div>' +
			'<div>国家：<span>' + country + '</span></div>' +
			'<div>询盘类型：<span>' + inquiryType + '</span></div>' +
			'<div>邮箱：<span>' + email + '</span></div>' +
			'<div>发送时间：<span>' + sendDate + '</span></div>' +
			'</div>' +
			'</a>' +
			'</div>';
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
document.getElementById('reanod_filtrate').addEventListener('tap', function() {
	//遍历筛选
	var fold = document.getElementById('reanod_fold');
	fold.classList.add('mui-active');
	
	$('html, body').animate({
		scrollTop: 0
	}, 'slow');
});
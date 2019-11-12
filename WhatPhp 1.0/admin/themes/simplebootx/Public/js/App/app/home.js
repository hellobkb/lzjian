// 初始化
mui.init({

});

// 所有方法都放到这里
function executeCode() {
};

//文章统计按钮
document.getElementById("article_statistics").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("articleStatistics");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "tab/articleStatistics.html",
			id: "articleStatistics",
			show: {
				aniShow: 'zoom-fade-out',
				duration: '600'
			},
			waiting: {
				autoShow: false
			}
		});
	}
});

//产品统计按钮
document.getElementById("product_statistics").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("productStatistics");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "tab/productStatistics.html",
			id: "productStatistics",
			show: {
				aniShow: 'zoom-fade-out',
				duration: '600'
			},
			waiting: {
				autoShow: false
			}
		});
	}
});

//阶段申请按钮
document.getElementById("stageApply").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("stageApply");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "tab/stageApply.html",
			id: "stageApply",
			show: {
				aniShow: 'zoom-fade-out',
				duration: '600'
			},
			waiting: {
				autoShow: false
			}
		});
	}
});

//询盘查看按钮
document.getElementById("inquiry").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("inquiries");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "tab/inquiries.html",
			id: "inquiries",
			show: {
				aniShow: 'zoom-fade-out',
				duration: '600'
			},
			waiting: {
				autoShow: false
			}
		});
	}
});

//用户管理按钮
document.getElementById("user_manage").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("userManage");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "tab/userManage.html",
			id: "userManage",
			show: {
				aniShow: 'zoom-fade-out',
				duration: '600'
			},
			waiting: {
				autoShow: false
			}
		});
	}
});

if(mui.os.plus) {
	mui.plusReady(function() {
		executeCode();
	});
} else {
	mui.ready(function() {
		document.addEventListener("plusready", executeCode(), false);
	});
}
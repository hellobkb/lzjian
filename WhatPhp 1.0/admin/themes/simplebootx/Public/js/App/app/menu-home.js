// 初始化
mui.init({

});

(function($) {

	//重写返回键
	mui.back = function(event) {
		if(!menuBack()) {
			systemQuit();
		}
	};

	var backButtonPress = 0;
	//点击两次返回键退出
	function systemQuit() {
		backButtonPress++;
		if(backButtonPress > 1) {
			plus.runtime.quit();
		} else {
			mui.toast('再按一次退出应用');
		}
		setTimeout(function() {
			backButtonPress = 0;
		}, 2000);
		return false;
	}

	//监听消息
	window.addEventListener('show', function() {
		plus.webview.currentWebview().show('zoom-fade-out', 600);
	});

})(mui);

//底部菜单返回
function menuBack() {
	if($("#reanod_popover_menu").hasClass("mui-active")) {
		$("#reanod_popover_menu").removeClass("mui-active");
		$("#popover_menu").removeClass("mui-active");
		$("#popover_menu").css('display', 'none');
		return true;
	}
}

//首页按钮
document.getElementById("reanod_popover_home").addEventListener('tap', function() {
	$("#popover_menu").removeClass('mui-active');
	$("#popover_menu").css('display', 'none');
});

//修改域名按钮
document.getElementById("reanod_changeWebsite").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("index");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "./index.html",
			id: "index",
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

//更改账号按钮
document.getElementById("reanod_changeUser").addEventListener('tap', function() {
	var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("login");
	//判断目标是否存在
	if(targetView) {
		//通知他直接显示
		targetView.hide('none', 0);
		//通知目标页面显示
		mui.fire(targetView, 'show');
	} else {
		mui.openWindow({
			url: "./login.html",
			id: "login",
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

//点击输入框时，隐藏底部菜单
document.addEventListener('focusin', function(e) {
	var target = e.target;
	if(target.tagName && target.tagName === 'INPUT' && target.type === 'text') {
		if(target.disabled || target.readOnly) {
			return;
		}
		document.body.classList.add('focusin');
	}
});
document.addEventListener('focusout', function() {
	document.body.classList.remove('focusin');
});

////退出按钮
//document.getElementById("reanod_quit").addEventListener('tap', function() {
//	plus.runtime.quit();
//});
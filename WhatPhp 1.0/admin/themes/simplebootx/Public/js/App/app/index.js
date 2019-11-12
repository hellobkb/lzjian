// 初始化
mui.init({

});

(function($) {

	//监听消息
	window.addEventListener('show', function() {
		plus.webview.currentWebview().show('zoom-fade-out', 600);
	});

})(mui);

// 所有方法都放到这里
function executeCode() {

	//重写返回键
	var backButtonPress = 0;
	mui.back = function(event) {
		backButtonPress++;
		if(backButtonPress > 1) {
			plus.runtime.quit();
		} else {
			plus.nativeUI.toast('再按一次退出应用');
		}
		setTimeout(function() {
			backButtonPress = 0;
		}, 2000);
		return false;
	};

	//绑定事件 
	//添加域名到本地储存，然后跳转到登录页面
	document.getElementById("confirmButton").addEventListener('tap', function(event) {
		var in_url = $.trim($('#in_url').val());
		if(!isURL(in_url)) {
			mui.toast("输入网址的格式错误！");
			return false;
		}
		localStorage.setItem("keyUrl", in_url);

		var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("login");
		//判断目标是否存在
		if(targetView) {
			//通知直接显示
			targetView.hide('none', 0);
			//通知目标页面显示
			mui.fire(targetView, 'show');
		} else {
			mui.openWindow({
				url: 'login.html',
				id: 'login',
				show: {
					aniShow: 'zoom-fade-out',
					duration: '600'
				},
				waiting: {
					autoShow: false
				}
			})
		}
	});

	//给a标签赋值
	var keyUrl = localStorage.getItem("keyUrl");
	if(keyUrl) {
		$('#in_url').val(keyUrl);
	}
};

//验证网站格式
function isURL(str_url) {
	var strRegex = "^[A-Za-z]+://[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&\?\/.=]+$";
	var re = new RegExp(strRegex);
	//re.test() 
	if(re.test(str_url)) {
		return(true);
	} else {
		return(false);
	}
}

if(mui.os.plus) {
	mui.plusReady(function() {
		executeCode();

		//关闭启动图片
		setTimeout(function() {
			//关闭 splash
			plus.navigator.closeSplashscreen();
			//关闭全屏显示
			plus.navigator.setFullscreen(false);
		}, 200);
	});
} else {
	mui.ready(function() {
		document.addEventListener("plusready", executeCode(), false);
	});
}
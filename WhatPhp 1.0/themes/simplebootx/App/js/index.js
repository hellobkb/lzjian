// 初始化
mui.init({});

/*转场动画效果*/
var ANISHOW = 'slide-in-right';
var ANISHOW_BACK = 'slide-in-left';

/*转场动画效果持续时间*/
var DURATION = 500;
// 所有方法都放到这里
function executeCode() {

	//监听消息
	window.addEventListener('show', function(event) {
		plus.nativeUI.closeWaiting();
		plus.webview.currentWebview().show(ANISHOW_BACK, DURATION);
	});

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
		var in_url = document.getElementById('in_url').value;

		if(!isURL(in_url)) {
			mui.toast("输入网址的格式错误！");
			return false;
		}
		localStorage.setItem("keyUrl", in_url);

		if(!mui.os.plus) {

			mui.openWindow(localStorage.getItem('keyUrl')+"/index.php?g=App&m=mobile&a=login");
			return;
		}


/*		var targetView = plus.webview.getWebviewById("login.html");
		//判断目标是否存在
		if(targetView) {
			plus.nativeUI.showWaiting();
			//通知直接显示
			targetView.hide('none', 0);
			mui.fire(targetView, 'show');
		} else {
			var nwaiting = plus.nativeUI.showWaiting();
			webviewContent = plus.webview.create("login.html", "login.html");
			webviewContent.addEventListener("loaded", function() {
				nwaiting.close();
				webviewContent.show(ANISHOW, DURATION);
			}, false);
		}*/

	});

	//给a标签赋值
	 
	var keyUrl = localStorage.getItem("keyUrl");
	if(keyUrl) {
		document.getElementById('in_url').value = keyUrl;
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
		}, 0);
	});
} else {
	mui.ready(function() {
		
		document.addEventListener("plusready", executeCode(), false);
	});
}
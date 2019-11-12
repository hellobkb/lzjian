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
		if(event.detail.back) {
			plus.webview.currentWebview().show(ANISHOW_BACK, DURATION);

			//关闭所有页面
			setTimeout(function() {
				var wvs = plus.webview.all();
				for(var i = 0; i < wvs.length; i++) {
					if(wvs[i] == plus.webview.currentWebview() || wvs[i].id == 'login.html')
						continue;

					wvs[i].close('none', 0)
				}
			}, DURATION);
		} else {
			plus.webview.currentWebview().show(ANISHOW, DURATION);
		}
	});

	//重写返回键事件
	mui.back = function() {
		if(!mui.os.plus) {
			mui.openWindow("api.php");
			return;
		}
		var targetView = plus.webview.getWebviewById("api.php");
		//判断目标是否存在
		if(targetView) {
			plus.nativeUI.showWaiting();
			//通知直接显示
			targetView.hide('none', 0);
			mui.fire(targetView, 'show', {
				back: 'ok'
			});
		} else {
			var nwaiting = plus.nativeUI.showWaiting();
			webviewContent = plus.webview.create("api.php", "api.php"); //后台创建webview并打开show.html
			webviewContent.addEventListener("loaded", function() { //注册新webview的载入完成事件
				nwaiting.close();
				webviewContent.show(ANISHOW_BACK, DURATION);
			}, false);
		}
	}

	//初始化
	var loginButton = document.getElementById('login');
	var accountBox = document.getElementById('account');
	var passwordBox = document.getElementById('password');
	//var autoLoginButton = document.getElementById("autoLogin");

	//登录按钮绑定单击事件
	loginButton.addEventListener('tap', function(event) {

		var loginInfo = {
			account: accountBox.value,
			password: passwordBox.value
		};
		app.login(loginInfo, function(err) {
			if(err) {
				mui.toast(err);
				return;
			}

			//保存用户名到本地 
			if(accountBox.value) {
				//保存当前登录url，供后面跳转到登录页面使用
				localStorage.setItem("keyAccount", accountBox.value);
			}

			//TODO 登录成功后的首页地址

			 

			var URL = localStorage.getItem("keyUrl")+'/index.php?g=App&m=Mobile&a=home&token='+localStorage.getItem('token');
			
			localStorage.setItem("keyLogin", window.location.href);
				 
			mui.openWindow(URL);
			 
		});
	});

	//登录按钮获取焦点时，触发单击事件
	mui.enterfocus('#login-form input', function() {
		$.trigger(loginButton, 'tap');
	});

	//查看是否存储了域名
	keyUrl = localStorage.getItem("keyUrl");
	if(keyUrl) {
		//document.getElementById("keyUrl").innerHTML = keyUrl;
	} else {
		
		mui.openWindow({
			url: "api.php",
			id: "api.php"
		});
	}

	//显示最后登录时的用户名
	keyAccount = localStorage.getItem("keyAccount");
	if(keyAccount) {
		document.getElementById('account').value = keyAccount;
	}
};

if(mui.os.plus) {
	mui.plusReady(function() {

		//锁定屏幕方向
		plus.screen.lockOrientation("portrait-primary");

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
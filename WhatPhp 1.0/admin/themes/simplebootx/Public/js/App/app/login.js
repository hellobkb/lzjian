// 初始化
mui.init({
	statusBarBackground: '#f7f7f7'
});

(function($) {

	//监听消息
	window.addEventListener('show', function() {
		plus.webview.currentWebview().show('zoom-fade-out', 600);
	});

})(mui);

// 所有方法都放到这里
function executeCode() {

	//重写返回键事件
	mui.back = function() {
		var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("index");
		//判断目标是否存在
		if(targetView) {
			//通知直接显示
			targetView.hide('none', 0);
			//通知目标页面显示
			mui.fire(targetView, 'show');
		} else {
			mui.openWindow({
				url: "index.html",
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
	}

	//初始化
	var loginButton = document.getElementById('login');
	var accountBox = document.getElementById('account');
	var passwordBox = document.getElementById('password');
	var autoLoginButton = document.getElementById("autoLogin");

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
			var account = $.trim($('#account').val());
			if(account) {
				localStorage.setItem("keyAccount", account);
			}

			var targetView = !mui.os.plus ? false : plus.webview.getWebviewById("home");
			//判断目标是否存在
			if(targetView) {
				//通知直接显示
				targetView.hide('none', 0);
				//通知目标页面显示
				mui.fire(targetView, 'show');
			} else {
				mui.openWindow({
					url: "home.html",
					id: "home",
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
	});

	//登录按钮获取焦点时，触发单击事件
	mui.enterfocus('#login-form input', function() {
		$.trigger(loginButton, 'tap');
	});

	var settings = app.getSettings();
	//是否自动登录
	//	autoLoginButton.classList[settings.autoLogin ? 'add' : 'remove']('mui-active')
	//	autoLoginButton.addEventListener('toggle', function(event) {
	//		setTimeout(function() {
	//			var isActive = event.detail.isActive;
	//			settings.autoLogin = isActive;
	//			app.setSettings(settings);
	//		}, 50);
	//	}, false);
	//
	//给a标签赋值
	//查看是否存储了域名
	keyUrl = localStorage.getItem("keyUrl");
	if(keyUrl) {
		//document.getElementById("keyUrl").innerHTML = keyUrl;
	} else {
		mui.openWindow({
			url: "index.html",
			id: "index"
		});
	}

	//显示最后登录时的用户名
	keyAccount = localStorage.getItem("keyAccount");
	if(keyAccount) {
		$('#account').val(keyAccount);
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
		}, 200);
	});
} else {
	mui.ready(function() {
		document.addEventListener("plusready", executeCode(), false);
	});
}
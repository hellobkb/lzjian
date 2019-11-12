/**
 * 请注意将相关方法调整成 “基于服务端Service” 的实现。
 **/
(function($, owner) {
	/**
	 * 用户登录
	 **/
	owner.login = function(loginInfo, callback) {
		callback = callback || $.noop;
		loginInfo = loginInfo || {};
		loginInfo.account = loginInfo.account || '';
		loginInfo.password = loginInfo.password || '';
		if(loginInfo.account.length < 5) {
			return callback('账号最短为 5 个字符');
		}
		if(loginInfo.password.length < 6) {
			return callback('密码最短为 6 个字符');
		}

		//没有网络
		if(mui.os.plus && plus.networkinfo.getCurrentType() == plus.networkinfo.CONNECTION_NONE) {
			mui.toast("网络未连接");
			return;
		}

		//等待图标、关闭键盘
		mui.os.plus && plus.nativeUI.showWaiting();
		document.activeElement.blur();

		var website = localStorage.getItem('keyUrl');
		
		//TODO
		//请求服务器
		 
		mui.ajax(website+'/index.php?g=App&m=Login&a=login', {
			data: {
				username: loginInfo.account,
				password: loginInfo.password,
				website:website,
			},
			dataType: 'json', //服务器返回json格式数据
			type: 'post', //HTTP请求类型
			timeout: 10000, //超时时间设置为10秒； 
			 
			success: function(data) {
				mui.os.plus && plus.nativeUI.closeWaiting();
				//服务器返回响应，根据响应结果，分析是否登录成功
				var state = data.state;
				var token = data.signature ;
				if((state == '1' || state == 1) && token) {

					 localStorage.setItem('token' , token);
					return owner.createState(token, callback);
				} else {
					return callback('用户名或密码错误');
				}

			},
			error: function(xhr, type, errorThrown) {
				mui.os.plus && plus.nativeUI.closeWaiting();
				//异常处理
				return callback('网络异常,请稍后重试！');
			}
		});
	};

	owner.createState = function(token, callback) {
		var state = owner.getState();
		state.token = token;
		owner.setState(state);
		return callback();
	};

	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem('$state') || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem('$state', JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};

	var checkEmail = function(email) {
		email = email || '';
		return(email.length > 3 && email.indexOf('@') > -1);
	};

	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		localStorage.setItem('$settings', JSON.stringify(settings));
	}

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
		var settingsText = localStorage.getItem('$settings') || "{}";
		return JSON.parse(settingsText);
	}

}(mui, window.app = {}));
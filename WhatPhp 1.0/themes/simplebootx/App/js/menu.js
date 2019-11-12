// 初始化
mui.init({});

(function(mui) {
	var oldBack = mui.back;
	//重写返回键
	mui.back = function(event) {
		if(!menuBack()) {
			oldBack();
		}
	};
	//底部菜单返回
	function menuBack() {
		if(document.getElementById("reanod_popover_menu").classList.contains('mui-active')) {
			document.getElementById("reanod_popover_menu").classList.remove('mui-active');
			
			mui('.mui-popover').popover('toggle');
			return true;
		}
	}
})(mui);

/*转场动画效果*/
var ANISHOW = 'slide-in-right';
/*转场动画效果持续时间*/
var DURATION = 500;

mui.plusReady(function() {
	var self = plus.webview.currentWebview();

	// 隐藏滚动条
	self.setStyle({
		scrollIndicator: 'none'
	});

	//监听消息
	window.addEventListener("show", function() {
		plus.nativeUI.closeWaiting();
		self.show(ANISHOW, DURATION);
	}, false);

	//监听消息
	//清空区域内容
	window.addEventListener("removeContent", function(event) {
		var href = event.detail.href;
		var content = getElement(href);
		content.innerHTML = '';

		plus.nativeUI.closeWaiting();
		self.show(ANISHOW, DURATION);
	}, false);

	//通过href获取a标签父级元素
	var getElement = function(href) {
		var con = document.getElementsByTagName("A");
		for(var i in con) {
			var text = con[i].getAttribute("href");
			if(text == href) {
				return con[i].parentElement;
			}
		}
	}
});

//打开页面方法
//isRender 为true，表示Webview在任何时候都渲染，提高用户体验，占用内存
function openWebview(targetUrl, target, isRender) {
	if(!mui.os.plus) {
		mui.openWindow(targetUrl, target);
		return;
	}
	var targetView = plus.webview.getWebviewById(target);
	//判断目标是否为当前页面
	if(targetView && targetView == plus.webview.currentWebview()) {
		//mui('#pullrefresh').pullRefresh().scrollTo(0,0,100)
	}
	//判断目标是否存在
	else if(targetView) {
		if(isRender) {
			targetView.show();
		} else {
			var nwaiting = plus.nativeUI.showWaiting();
			//通知直接显示
			targetView.hide('none', 0);
			mui.fire(targetView, 'show', {
				back: true
			});
		}
	} else {
		var nwaiting = plus.nativeUI.showWaiting();
		//没有网络
		if(mui.os.plus && plus.networkinfo.getCurrentType() == plus.networkinfo.CONNECTION_NONE) {
			mui.toast("网络未连接");
			nwaiting.close();
			return;
		}

		webviewContent = plus.webview.create(targetUrl, target, {
			render: isRender ? "always" : "onscreen"
		});
		webviewContent.addEventListener("loaded", function() {
			nwaiting.close();
			webviewContent.show(ANISHOW, DURATION);
		}, false);
	}
}

//绑定radio后面的label事件
var bandRadioLable = function() {
	var radioes = document.getElementsByName('reanod_radio');
	for(var i = 0; i < radioes.length; i++) {
		var lable = radioes[i].nextSibling;
		lable && lable.addEventListener('tap', function() {
			this.previousSibling.checked = true;
		});
	}
}

//列表绑定事件
function bandList(object) {
	object.on('tap', 'a', function() {
		var id = this.getAttribute('href');
		var href = this.href;
		if(id && ~id.indexOf('.html')) {
			if(!mui.os.plus) {
				mui.openWindow(href);
				return;
			}
			var targetView = plus.webview.getWebviewById(id);
			var nwaiting = plus.nativeUI.showWaiting();
			//判断目标是否存在
			if(targetView) {
				//通知直接显示
				targetView.hide('none', 0);
				mui.fire(targetView, 'show');
			} else {
				//没有网络
				if(mui.os.plus && plus.networkinfo.getCurrentType() == plus.networkinfo.CONNECTION_NONE) {
					mui.toast("网络未连接");
					nwaiting.close();
					return;
				}

				webviewContent = plus.webview.create(href, id); //后台创建webview并打开show.html
				webviewContent.addEventListener("loaded", function() { //注册新webview的载入完成事件
					nwaiting.close();
					webviewContent.show(ANISHOW, DURATION);
				}, false);

			}
		}
		else if(id && ~id.indexOf('showvideo')){
			
			mui.openWindow(href);
		}
	});
}

//二级菜单点击事件
mui('#popover_menu').on('tap', 'a', function() {
	mui('.mui-popover').popover('hide');
	document.getElementById("reanod_popover_menu").classList.remove('mui-active');

	var id = this.getAttribute('href');
	var href = this.href;
	var type = this.getAttribute("open-type");

	if(id && ~id.indexOf('.html')) {
		//非手机端，取localStorage中的keyLogin
		if(!mui.os.plus && id == 'login.html') {
			href = localStorage.getItem("keyLogin");
		}

		if(type && type == 'anew')
			openWebview(href, id, true);
		else
			openWebview(href, id);
	}
});

//删除后移除目标模块
var removeTarget = function(targetUrl, target) {
	//不是手机端直接返回上一页
	if(!mui.os.plus) {
		mui.back();
		return;
	}
	var targetView = plus.webview.getWebviewById(target);
	var href = plus.webview.currentWebview().id; //当前页面id

	if(targetView) {
		targetView.hide('none', 0);
		//通知目标页面，移除模块
		mui.fire(targetView, 'removeContent', {
			href: href
		});
	} else {
		openWebview(targetUrl, target);
	}
}

//首页按钮
document.getElementById("reanod_popover_home").addEventListener('tap', function() {
	mui('.mui-popover').popover('hide');

	var id = this.getAttribute('href');
	var href = this.href;
	var type = this.getAttribute("open-type");

	if(id && ~id.indexOf('.html')) {
		if(type && type == 'anew')
			openWebview(href, id, true);
		else
			openWebview(href, id);
	}
});

//点击蒙版事件
mui('body').on('tap', '.mui-backdrop', function(e) {
    if(document.getElementById("reanod_popover_menu").classList.contains('mui-active')) {
		document.getElementById("reanod_popover_menu").classList.remove('mui-active');
	}
});


//显示等待框、关闭键盘
var showLoading = function() {
	mui.os.plus && plus.nativeUI.showWaiting();
	document.activeElement.blur();
}

//点击输入框时，隐藏底部菜单
document.addEventListener('focusin', function(e) {
	var target = e.target;
	if(target.tagName && (target.tagName === 'INPUT' && target.type === 'text') || target.tagName === 'TEXTAREA') {
		if(target.disabled || target.readOnly) {
			return;
		}
		document.body.classList.add('focusin');
	}
});
document.addEventListener('focusout', function() {
	document.body.classList.remove('focusin');
});

//当前连接网络状态
function getNetwork() {
	var networkTypes = {};
	networkTypes[plus.networkinfo.CONNECTION_UNKNOW] = "未知";
	networkTypes[plus.networkinfo.CONNECTION_NONE] = "网络未连接";
	networkTypes[plus.networkinfo.CONNECTION_ETHERNET] = "有线网络";
	networkTypes[plus.networkinfo.CONNECTION_WIFI] = "WiFi网络";
	networkTypes[plus.networkinfo.CONNECTION_CELL2G] = "2G网络";
	networkTypes[plus.networkinfo.CONNECTION_CELL3G] = "3G网络";
	networkTypes[plus.networkinfo.CONNECTION_CELL4G] = "4G网络";
	return networkTypes[plus.networkinfo.getCurrentType()];
}

//下载文件
var downFile = function(linkUrl) {
	if(mui.os.plus) {
		//当前网络
		var nowNet = getNetwork();
		//网络未连接
		if(nowNet == "网络未连接") {
			mui.toast("网络未连接");
			return false;
		}
		//WiFi网络
		else if(nowNet == "WiFi网络") {
			startDown(linkUrl);
		} else {
			var btnArray = ['确定', '取消'];
			mui.confirm("当前网络为：" + nowNet + "，是否继续下载", '提示', btnArray, function(e) {
				if(e.index == 0) {
					startDown(linkUrl);
				}
			})
		}
	} else {
		mui.toast("请登录手机端下载")
	}
}

//开始下载
var startDown = function(linkUrl) {

	//路径，下载到根目录
	var path = "_documents/../../../../附件/";

	plus.nativeUI.showWaiting("下载文件...");
	plus.downloader.createDownload(linkUrl, {
		filename: path,
		timeout: 30, //请求超时时间
		retry: 0 //错误重试次数
	}, function(d, status) {
		if(status == 200) {
			var filename = d.filename.split(path)[1];
			mui.toast("下载成功");
			var btnArray = ['确定', '取消'];
			mui.confirm(filename + " 下载成功，立即打开？", '提示', btnArray, function(e) {
				if(e.index == 0) {
					plus.runtime.openFile(d.filename);
				}
			})
		} else {
			mui.toast("下载失败！错误代码：" + status);
			plus.nativeUI.alert("下载失败！");
		}
		plus.nativeUI.closeWaiting();
	}).start();
}
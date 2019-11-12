/* 
 * 差量资源更新 ，返回为JSON格式数据，如下：

	<?php
	$verlocal = $_GET["verlocal"];//版本号
	$arr = array ('state'=>1,'url'=>"http://192.168.0.6:8020/reanod_service/update/wgtu/test.wgtu");
	print_r(json_encode($arr));// 返回数据
	
 *
 */

// 初始化
mui.init({

});

//资源更新按钮
document.getElementById("reanod_update").addEventListener('tap', function() {
	//没有网络
	if(plus.networkinfo.getCurrentType() == plus.networkinfo.CONNECTION_NONE) {
		mui.toast("网络未连接");
		return;
	}

	plus.runtime.getProperty(plus.runtime.appid, function(info) {
		var verlocal = info.version;
		mui.toast("当前版本:" + verlocal);

		//TODO 请求地址
		mui.ajax('http://192.168.0.6/test/downloadlink/index.php', {
			data: {
				verlocal: verlocal
			},
			dataType: 'json',
			type: 'get',
			timeout: 10000, //超时时间设置为10秒； 
			success: function(data) {
				//服务器返回响应，根据响应结果，分析是否登录成功； 

				console.log("请求返回后的网址：" + data);
				var state = data['state'];
				var url = data['url'];
				if(state == '1' || state == 1) {

					update(url);
				} else {
					mui.toast("当前已经是最新版本");
				}
			},
			error: function(xhr, type, errorThrown) {
				mui.toast("网络异常,请稍后重试！");
				console.log(type);
			}
		});
	});
});

//更新
function update(url) {
	plus.nativeUI.showWaiting("升级中...");
	var dtask = plus.downloader.createDownload(url, {
		method: "GET"
	}, function(d, status) {
		if(status == 200) {
			console.log("Download wgtu success: " + d.filename);
			plus.runtime.install(d.filename, {}, function() {
				plus.nativeUI.closeWaiting();
				plus.nativeUI.alert("更新成功，将要重启!", function() {
					plus.runtime.restart();
				});
			}, function(e) {
				plus.nativeUI.closeWaiting();
				alert("更新失败，原因: " + e.message);
			});
		} else {
			plus.nativeUI.closeWaiting();
			alert("下载资源失败: " + status);
		}
	});
	dtask.addEventListener('statechanged', function(d, status) {
		console.log("statechanged: " + d.state);
	});
	dtask.start();
}
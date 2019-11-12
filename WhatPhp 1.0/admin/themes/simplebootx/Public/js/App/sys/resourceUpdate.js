// 初始化
mui.init({

});

// 所有方法都放到这里
mui.plusReady(function() {

});

//资源更新按钮
document.getElementById("reanod_update").addEventListener('tap', function() {

	var verlocal = plus.runtime.version;
	mui.ajax('http://192.168.0.6/test/downloadlink/index.php', {
		data: {
			verlocal: verlocal
		},
		dataType: 'string',
		type: 'get',
		success: function(data) {
			console.log("请求返回后的网址：" + data);
			update(data);
		},
		error: function(xhr, type, errorThrown) {
			plus.nativeUI.toast("服务器繁忙！001");
			console.log(type);
		}
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
					plus.nativeUI.alert("Update wgtu success, restart now!", function() {
						plus.runtime.restart();
					});
				}, function(e) {
					plus.nativeUI.closeWaiting();
					alert("Update wgtu failed: " + e.message);
				});
			} else {
				plus.nativeUI.closeWaiting();
				alert("Download wgtu failed: " + status);
			}
		});
		dtask.addEventListener('statechanged', function(d, status) {
			console.log("statechanged: " + d.state);
		});
		dtask.start();
	}

});
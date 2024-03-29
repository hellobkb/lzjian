/**
 * 判断应用升级模块，从url地址下载升级描述文件到本地local路径
 * yanyilin@dcloud.io
 * 
 * 升级文件为JSON格式数据，如下：
{
	"appid":"HelloH5",
    "iOS":{
    	"version":"iOS新版本号，如：1.0.0",
    	"note":"iOS新版本描述信息，多行使用\n分割",
    	"url":"Appstore路径，如：itms-apps://itunes.apple.com/cn/app/hello-h5+/id682211190?l=zh&mt=8"
    },
    "Android":{
    	"version":"Android新版本号，如：1.0.1",
    	"note":"Android新版本描述信息，多行使用\n分割",
    	"url":"apk文件下载地址，如：http://www.dcloud.io/helloh5p/HelloH5.apk"
    }
}
 *
 */
(function(w) {

	//TODO 请求地址
	var server = "http://192.168.0.6:8020/reanod_service/update/update.json", //获取升级描述文件服务器地址
		localDir = "update",
		localFile = "update.json", //本地保存升级描述目录和文件名
		keyUpdate = "updateCheck", //取消升级键名
		keyAbort = "updateAbort", //忽略版本键名
		//checkInterval=604800000,//升级检查间隔，单位为ms,7天为7*24*60*60*1000=604800000, 如果每次启动需要检查设置值为0
		checkInterval = 0,
		dir = null;

	/**
	 * 准备升级操作
	 * 创建升级文件保存目录
	 */
	function initUpdate() {

		var self = plus.webview.currentWebview();
		var isFirst = self.isFirst;

		//是否执行过更新,程序启动,只检测一次
		if(!isFirst) {
			return;
		}

		// 在流应用模式下不需要检测升级操作
		if(navigator.userAgent.indexOf('StreamApp') >= 0) {
			return;
		}

		// 打开doc根目录
		plus.io.requestFileSystem(plus.io.PRIVATE_DOC, function(fs) {

			fs.root.getDirectory(localDir, {
				create: true
			}, function(entry) {
				dir = entry;
				//checkUpdate();
				//先获取更新数据
				getUpdateData();
			}, function(e) {
				console.log("准备升级操作，打开update目录失败：" + e.message);
			});
		}, function(e) {
			console.log("准备升级操作，打开doc目录失败：" + e.message);
		});
	}

	/**
	 * 检测程序升级
	 */
	function checkUpdate() {
		// 判断升级检测是否过期
		var lastcheck = plus.storage.getItem(keyUpdate);
		if(lastcheck) {
			var dc = parseInt(lastcheck);
			var dn = (new Date()).getTime();
			if(dn - dc < checkInterval) { // 未超过上次升级检测间隔，不需要进行升级检查
				return;
			}
			// 取消已过期，删除取消标记
			plus.storage.removeItem(keyUpdate);
		}
		// 读取本地升级文件
		dir.getFile(localFile, {
			create: false
		}, function(fentry) {
			fentry.file(function(file) {
				var reader = new plus.io.FileReader();
				reader.onloadend = function(e) {

					fentry.remove();
					var data = null;
					try {

						data = JSON.parse(e.target.result);
					} catch(e) {
						console.log("读取本地升级文件，数据格式错误！");
						return;
					}

					checkUpdateData(data);
				}
				reader.readAsText(file);
			}, function(e) {
				console.log("读取本地升级文件，获取文件对象失败：" + e.message);
				fentry.remove();
			});
		}, function(e) {
			// 失败表示文件不存在，从服务器获取升级数据
			//getUpdateData();
		});
	}

	/**
	 * 检查升级数据
	 */
	function checkUpdateData(j) {
		var curVer = plus.runtime.version,
			inf = j[plus.os.name];
		if(inf) {
			var srvVer = inf.version;
			// 判断是否存在忽略版本号
			var vabort = plus.storage.getItem(keyAbort);
			if(vabort && srvVer == vabort) {
				// 忽略此版本
				return;
			}
			//TODO
			mui.toast('服务器端版本：' + srvVer + '，客户端版本：' + curVer)

			// 判断是否需要升级
			if(compareVersion(curVer, srvVer)) {
				// 提示用户是否升级
				plus.nativeUI.confirm(inf.note, function(i) {
					if(0 == i.index) {
						//plus.runtime.openURL(inf.url);
						//改为直接下载，而非打开浏览器
						downNewApp(inf.url);
					} else if(1 == i.index) {
						//plus.storage.setItem(keyAbort, srvVer);
						//plus.storage.setItem(keyUpdate, (new Date()).getTime().toString());
					} else {
						//plus.storage.setItem(keyUpdate, (new Date()).getTime().toString());
					}
				}, inf.title, ["立即更新", "取消"]);
			}
		}
	}
	/* 
	 *下载新版本 
	 * */
	function downNewApp(url) {
		plus.nativeUI.showWaiting("正在下载新版本...");
		var dtask = plus.downloader.createDownload(url, {}, function(d, status) {
			if(status == 200) { // 下载成功
				var path = d.filename;
				console.log("下载成功：文件名" + d.filename);
				installNewApp(d.filename);
			} else { //下载失败
				alert("Download failed: " + status);
			}
			plus.nativeUI.closeWaiting();
		});
		dtask.start();
	}

	/*
	 * 安装 新版本
	 * */
	function installNewApp(path) {
		plus.nativeUI.showWaiting("安装中...");
		plus.runtime.install(path, {}, function() {
			plus.nativeUI.closeWaiting();
			console.log("安装app文件成功！");
			plus.nativeUI.alert("更新完成！", function() {
				plus.runtime.restart();
			});
		}, function(e) {
			plus.nativeUI.closeWaiting();
			console.log("安装失败[" + e.code + "]：" + e.message);
			plus.nativeUI.alert("安装文件失败[" + e.code + "]：" + e.message);
		});
	}

	/**
	 * 从服务器获取升级数据
	 */
	function getUpdateData() {
		var xhr = new plus.net.XMLHttpRequest();
		xhr.onreadystatechange = function() {
			switch(xhr.readyState) {
				case 4:
					if(xhr.status == 200) {
						// 保存到本地文件中
						dir.getFile(localFile, {
							create: true
						}, function(fentry) {
							fentry.createWriter(function(writer) {
								writer.onerror = function() {
									mui.toast("获取升级数据，保存文件失败");
									console.log("获取升级数据，保存文件失败！");
								}
								writer.write(xhr.responseText);

								//检测程序升级
								checkUpdate();
							}, function(e) {
								mui.toast("获取升级数据，创建写文件对象失败");
								console.log("获取升级数据，创建写文件对象失败：" + e.message);
							});
						}, function(e) {
							mui.toast("获取升级数据，打开保存文件失败");
							console.log("获取升级数据，打开保存文件失败：" + e.message);
						});
					} else {
						mui.toast("获取升级数据失败");
						console.log("获取升级数据失败：" + xhr.status);
					}
					break;
				default:
					break;
			}
		}
		xhr.timeout = 10000; //请求超时时间
		xhr.open("GET", server);
		xhr.send();
	}

	/**
	 * 比较版本大小，如果新版本nv大于旧版本ov则返回true，否则返回false
	 * @param {String} ov
	 * @param {String} nv
	 * @return {Boolean} 
	 */
	function compareVersion(ov, nv) {
		if(!ov || !nv || ov == "" || nv == "") {
			return false;
		}
		var b = false,
			ova = ov.split(".", 4),
			nva = nv.split(".", 4);
		for(var i = 0; i < ova.length && i < nva.length; i++) {
			var so = ova[i],
				no = parseInt(so),
				sn = nva[i],
				nn = parseInt(sn);
			if(nn > no || sn.length > so.length) {
				return true;
			} else if(nn < no) {
				return false;
			}
		}
		if(nva.length > ova.length && 0 == nv.indexOf(ov)) {
			return true;
		}
	}

	if(w.plus) {
		initUpdate();
	} else {
		document.addEventListener("plusready", initUpdate, false);
	}

})(window);
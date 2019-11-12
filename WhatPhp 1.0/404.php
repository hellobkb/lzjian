<?php

$array = array('jpg','jpeg','png','gif','JPG','JPEG','PNG','GIF','bmp');;
$ext = pathinfo($_SERVER['REDIRECT_URL'],PATHINFO_EXTENSION);

if(in_array($ext,$array)){
	header('Content-Type: image/jpeg');
	echo file_get_contents('./404.jpg');
	exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>404</title>
</head>
<body>
我是404页面
</body>
</html>
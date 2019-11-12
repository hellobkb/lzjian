<?php

//urlrule 表，静态规则与动态规则对应.

return array(
	
		"CX_RULE_URL"=>array(
		
				'2'=>'1',      //普通category
				'25'=>'20',    //动态下载(栏目)
				'26'=>'19',    //动态产品(栏目)
				'27'=>'18',    //动态文章(栏目)
				'28'=>'17',    //动态图片(栏目)
				'29'=>'21',    //动态图片(内容)
				'30'=>'22',    //动态文章(内容)
				'31'=>'23',	   //动态产品(内容)
				'32'=>'24',    //动态下载(内容)
				'35'=>'33',    //动态faq(栏目)
				'36'=>'34',    //动态faq(内容)
				
		)

);

/*


html/{$categorydir}{$catdir}/index.html
{$categorydir}{$catdir}/index_{$page}.html

index.php?g=Content&m=Pagedis&a=lists&catid={$catid}
index.php?g=Content&m=Pagedis&a=lists&catid={$catid}&p={page}



{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html
index.php?g=Content&m=Pagedis&a=list_down&catid={$catid}|index.php?g=Content&m=Pagedis&a=list_down&catid={$catid}&p={page}


*/
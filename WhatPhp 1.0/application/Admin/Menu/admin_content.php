<?php
return array (
  'app' => 'Admin',
  'model' => 'Content',
  'action' => 'default',
  'data' => '',
  'type' => '0',
  'status' => '0',
  'name' => '内容管理',
  'icon' => 'th',
  'remark' => '',
  'listorder' => '30',
  'children' => 
  array (
    array (
      'app' => 'Comment',
      'model' => 'Commentadmin',
      'action' => 'index',
      'data' => '',
      'type' => '1',
      'status' => '1',
      'name' => '评论管理',
      'icon' => '',
      'remark' => '',
      'listorder' => '0',
      'children' => 
      array (
        array (
          'app' => 'Comment',
          'model' => 'Commentadmin',
          'action' => 'delete',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '删除评论',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
        array (
          'app' => 'Comment',
          'model' => 'Commentadmin',
          'action' => 'check',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '评论审核',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
      ),
    ),
    array (
      'app' => 'Content',
      'model' => 'Urlrule',
      'action' => 'index',
      'data' => '',
      'type' => '1',
      'status' => '1',
      'name' => 'URL规则管理',
      'icon' => '',
      'remark' => '',
      'listorder' => '0',
      'children' => 
      array (
        array (
          'app' => 'Content',
          'model' => 'Urlrule',
          'action' => 'add',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => 'URL规则添加',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
          'children' => 
          array (
            array (
              'app' => 'Content',
              'model' => 'Urlrule',
              'action' => 'add_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => 'URL规则添加提交',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
        array (
          'app' => 'Content',
          'model' => 'Urlrule',
          'action' => 'edit',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => 'URL规则编辑',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
          'children' => 
          array (
            array (
              'app' => 'Content',
              'model' => 'Urlrule',
              'action' => 'edit_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => 'Url规则编辑提交',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
        array (
          'app' => 'Content',
          'model' => 'Urlrule',
          'action' => 'delete',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => 'URL规则删除',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
      ),
    ),
    array (
      'app' => 'Portal',
      'model' => 'AdminPost',
      'action' => 'index',
      'data' => '',
      'type' => '1',
      'status' => '1',
      'name' => '文章管理',
      'icon' => '',
      'remark' => '',
      'listorder' => '1',
      'children' => 
      array (
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'listorders',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '文章排序',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'top',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '文章置顶',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'recommend',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '文章推荐',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'move',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '批量移动',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'check',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '文章审核',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'delete',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '删除文章',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'edit',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '编辑文章',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
          'children' => 
          array (
            array (
              'app' => 'Portal',
              'model' => 'AdminPost',
              'action' => 'edit_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => '提交编辑',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPost',
          'action' => 'add',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '添加文章',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
          'children' => 
          array (
            array (
              'app' => 'Portal',
              'model' => 'AdminPost',
              'action' => 'add_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => '提交添加',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
      ),
    ),
    array (
      'app' => 'Portal',
      'model' => 'AdminPage',
      'action' => 'index',
      'data' => '',
      'type' => '1',
      'status' => '1',
      'name' => '页面管理',
      'icon' => '',
      'remark' => '',
      'listorder' => '3',
      'children' => 
      array (
        array (
          'app' => 'Portal',
          'model' => 'AdminPage',
          'action' => 'listorders',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '页面排序',
          'icon' => '',
          'remark' => '',
          'listorder' => '0',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPage',
          'action' => 'delete',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '删除页面',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPage',
          'action' => 'edit',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '编辑页面',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
          'children' => 
          array (
            array (
              'app' => 'Portal',
              'model' => 'AdminPage',
              'action' => 'edit_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => '提交编辑',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
        array (
          'app' => 'Portal',
          'model' => 'AdminPage',
          'action' => 'add',
          'data' => '',
          'type' => '1',
          'status' => '0',
          'name' => '添加页面',
          'icon' => '',
          'remark' => '',
          'listorder' => '1000',
          'children' => 
          array (
            array (
              'app' => 'Portal',
              'model' => 'AdminPage',
              'action' => 'add_post',
              'data' => '',
              'type' => '1',
              'status' => '0',
              'name' => '提交添加',
              'icon' => '',
              'remark' => '',
              'listorder' => '0',
            ),
          ),
        ),
      ),
    ),
  ),
);
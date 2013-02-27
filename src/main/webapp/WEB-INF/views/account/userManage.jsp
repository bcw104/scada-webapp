<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx.css">
<script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>    
<script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
<style>
    html, body {
        width: 100%;
        height: 100%;
        margin: 0px;
        overflow: hidden;
        font-size:12px;
    }
    a:link {
		COLOR: #0065ce; TEXT-DECORATION: none
	}
	a:visited {
		COLOR: #0065ce; TEXT-DECORATION: none
	}
	a:hover {
		COLOR: #ff0000; TEXT-DECORATION: underline
	}
</style>
<script>
var dhxLayout,toolbar,mygrid;

function doOnLoad(){
	  creatLayout();
	  creatToolbar();
	  
	  $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/user/findUser',
		  success: function(json){
			var item={rows:[]};
			for(var i=0;i<json.length;i++){
				var it={};
				it.id = json[i].user.id;
				it.data = [];
				it.data.push(json[i].user.username);
				it.data.push(json[i].realName);
				it.data.push(json[i].gender);
				it.data.push(json[i].department);
				it.data.push(json[i].address);
				it.data.push(json[i].telphone);
				it.data.push(json[i].email);
				it.data.push(json[i].user.userRole.name);
				item.rows.push(it);
				
				}
			creatGrid(item);
		  }
	  });
	  
}
function creatToolbar(){
	toolbar=dhxLayout.cells("a").attachToolbar();
  //toolbar.setIconsPath("imgs/dhxtoolbar_dhx_skyblue/");
	toolbar.addButton("add", 1, "添加用户");
  	toolbar.addButton("update", 2, "编辑用户");
  	toolbar.addButton("pass", 3, "修改密码");
	toolbar.addButton("drop", 4, "删除用户");
}
function creatLayout(){
	dhxLayout=new dhtmlXLayoutObject(document.body, "1C");
	dhxLayout.cells("a").hideHeader();
}
function creatGrid(json){
	mygrid=dhxLayout.cells("a").attachGrid(); 
	mygrid.setImagePath("imgs/");
	mygrid.setHeader("用户名,真实姓名,性别,部门,地址,电话,Email,角色");
	mygrid.setInitWidths("100,100,100,100,100,100,*");
	mygrid.setColAlign("left,left,left,left,left,left,left");
	mygrid.setColTypes("txt,txt,txt,txt,txt,txt,txt");
	mygrid.setColSorting("str,str,str,str,str,str,str");
	//mygrid.getCombo(1).put(2, 2);
	//mygrid.setSkin("dhx_skyblue");
	mygrid.init();
	mygrid.parse(json,'json');
}
</script>
</head>

<body onload="doOnLoad()">

</body>
</html>
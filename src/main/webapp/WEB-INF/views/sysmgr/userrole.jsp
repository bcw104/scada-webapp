<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
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
		  url: '${ctx}/admin/role/list',
		  success: function(json){
			var item={rows:[]};
			for(var i=0;i<json.length;i++){
				var it={};
				it.id = json[i].id;
				it.data = [];
				it.data.push(json[i].name);
				it.data.push(json[i].description);
				item.rows.push(it);
				}
			creatGrid(item);
		  }
	  });
	  
}
function creatToolbar(){
	toolbar=dhxLayout.cells("a").attachToolbar();
  //toolbar.setIconsPath("imgs/dhxtoolbar_dhx_skyblue/");
	toolbar.addButton("add", 1, "添加角色");
  	toolbar.addButton("update", 2, "编辑角色");
	toolbar.addButton("drop", 3, "删除角色");
}
function creatLayout(){
	dhxLayout=new dhtmlXLayoutObject(document.body, "1C");
	dhxLayout.cells("a").hideHeader();
}
function creatGrid(json){
	mygrid=dhxLayout.cells("a").attachGrid(); 
	mygrid.setImagePath("imgs/");
	mygrid.setHeader("角色名称,角色说明");
	mygrid.setInitWidths("100,*");
	mygrid.setColAlign("left,left");
	mygrid.setColTypes("txt,txt");
	mygrid.setColSorting("str,str");
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
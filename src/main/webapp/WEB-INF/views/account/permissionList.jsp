<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx.css">
<script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script> 
<script src="${ctx}/static/jquery/jquery.form.js"></script> 
<script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
<style>
    html, body {
        width: 100%;
        height: 100%;
        margin: 0px;
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
    .role_item_cls {
        padding: 0px;
        margin-top: 8px;
        margin-right: 8px;
        margin-bottom: 8px;
        margin-left: 20px;
        display:inline-block;
    }
    .role_title_cls {
        background-color:#e3efff;
        padding: 5px;
        margin: 0px;
    }
</style>
<script>
    var objUrl='${ctx}';
    var userName='${user.name}';
    window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
</script>
<script src="${ctx}/static/userPermissionList.js"></script>
</head>

<body onload="doOnLoad()">
    <input type="hidden" name="userid" id="userid" value="${userid}">
    <div id="treeBox" style="width:200;height:200"></div>
</body>
</html>
<%-- 
    Document   : index
    Created on : 2013-2-28, 11:03:45
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="inputForm" action="${ctx}/test/save" method="post" class="form-horizontal">
		<fieldset>
			<legend><small>用户注册</small></legend>
			<div class="control-group">
				<label for="loginName" class="control-label">用户名:</label>
				<div class="controls">
					<input type="text" id="username" name="username" class="input-large required"/>
				</div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">姓名:</label>
				<div class="controls">
					<input type="text" id="name" name="name" class="input-large required"/>
				</div>
			</div>
            <div class="control-group">
				<label for="rolename" class="control-label">角色:</label>
				<div class="controls">
                    <input type="text" id="rolename" name="rolename" class="input-large required" value="admin"/>
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
    </body>
</html>

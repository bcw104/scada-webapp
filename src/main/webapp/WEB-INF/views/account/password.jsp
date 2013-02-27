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
<title>修改密码</title>
<style>
body {padding: 0; margin: 0;}
body,html{height: 100%;font-size:12px;}
#outer {height: 100%; overflow: hidden; position: relative;width: 100%;}
#outer[id] {display: table; position: static;}
#middle {position: absolute; top: 50%;left: 0;}
#middle[id] {display: table-cell; vertical-align: middle; position: static;}
#inner {position: relative; top: -50%; margin: 0 auto;}
#content{width:400px; height:300px; border:1px solid  #9DC5F0; background:#EEE;margin: 0 auto;vertical-align:middle;
line-height:50px;text-align:center;}
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
<script type="text/javascript">
	function onSubmit(){
		var newPass=document.getElementById("newPass").value;
		var rePass=document.getElementById("rePass").value;
		if(newPass!=rePass){
			document.getElementById("passmessage").innerHTML="新设密码与原始密码不相符，请重新输入！";
			document.getElementById("rePass").focus;
			return false;
		}
		return true;
	}
</script>
<body>
<div id="outer">
    <div id="middle">
        <div id="inner">
             <div id="content">
             <form id="ff" method="post" action="${ctx}/admin/user/updatePassWord" autocomplete=off onSubmit="return onSubmit()">
             	<div style="margin:5px;">
						<span style="color:red;" id="passmessage"></span>
				</div>
             	<%
					String error = (String) request.getAttribute("message");
					if(error != null){
				%>
					<div style="margin:5px;">
						<span style="color:red;">${message}</span>
					</div>
				<%
					}
				%>
                <div style=" margin: 5px;">
                    <label for="oldpass"></label>
                </div>
                <div style=" margin: 5px;">
                    <label for="oldpass">原始密码:</label>
                    <input type="text" name="oldpass" ></input>
                </div>
                <div style=" margin: 5px;">
                    <label for="newPass">新设密码:</label>
                    <input type="text" name="newPass" id="newPass"></input>
                </div>
                <div style=" margin: 5px;">
                    <label for="rePass">确认密码:</label>
                    <input  type="text" name="rePass" id="rePass"></input>
                </div>
                <div style=" margin: 10px; text-align: center">
                    <input id="submit_btn"  type="submit" value="提交"/>
                </div>
            </form>
             </div>
        </div>
    </div>
</div>
</body>
</html>

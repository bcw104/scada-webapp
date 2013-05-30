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
    <script src="${ctx}/static/jquery/jquery.form.js"></script> 
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
        var objUrl='${ctx}';
        window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
    </script>
    <script src="${ctx}/static/userManage.js"></script>
</head>

<body onload="doOnLoad()">
<div id="addUser" style=" display:none;line-height:10px">
    <form id="addForm" name="addForm" action="${ctx}/admin/user/addUser" method="post" autocomplete=off >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="text" name="user.username" id="userName"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="realName" id="relName"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">性别：</td>
                <td>
                    <input name="gender" type="radio" value="1" checked />男
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="gender" type="radio" value="0" />女
                </td>
           </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="department" id="department"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="address" id="address"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="email" id="email"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="telphone" id="telphone"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">角色：</td>
                <td valign="middle" style="padding-top:3px">
                    <input type="hidden" name="role_id" id="description" value=""></input>
                    <div id="combo_zone4" style="width:100px; height:25px;"></div>
                </td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">密码：</td>
                <td><input type="password" name="user.shaPassword" id="newPassword"></input></td>
            </tr>
            <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">确认密码：</td>
                <td><input type="password" name="relPass" id="relPassword"></input></td>
            </tr>
            <tr>
                  <td colspan="2" height="30" align="center"> 
                      <input id="submit_btn"  type="button" onclick="addUserFormSubmit()"  value="提交"/>
                  </td>
            </tr>
        </table>
	</form>
</div>
<div id="updateUser" style="display:none;padding-top:40px;">
     <form id="updateForm" action="${ctx}/admin/user/updateUserExtInfo" method="post" autocomplete=off>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="hidden" name="user_id" id="update_userid" value="" />
                    <input type="text" name="user.username" id="update_uName" readonly="true"></input>
                </td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="realName" id="update_rName"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">性别：</td>
                <td><input name="gender" type="radio" value="1" checked />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="gender" type="radio" value="0" />女</td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="department" id="update_department"></input></td>
              </tr>
              <tr >
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="address" id="update_address"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="email" id="update_email"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="telphone" id="update_telphone"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">角色：</td>
                <td valign="middle" style="padding-top:3px"><input type="hidden" name="role_id" id="update_description" value=""></input><div id="combo_zone5" style="width:100px; height:25px;"></div></td>
              </tr>
              <tr>
                  <td colspan="2" height="30" align="center"> <input id="update_btn"  type="button" onclick="updateUserFormSubmit()"  value="提交"/></td>
              </tr>
            </table>
	</form>
</div>
<div id="passUser" style=" display:none;text-align:center;padding:50px;line-height:50px">
    <form id="passForm">
            <div style=" margin: 5px;">
                <label for="newPass">新设密码:</label>
                <input type="hidden" name="userID" id="userid_pass" value="">
                <input type="password" name="newPass" id="newPass"></input>
            </div>
            <div style=" margin: 5px;">
                <label for="rePass">确认密码:</label>
                <input  type="password" name="rePass" id="rePass"></input>
            </div>
            <div style=" margin: 10px; text-align: center">
                <input id="submit_btn"  type="button" onclick="updatePass()" value="提交"/><input id="btn"  type="button" onclick="winClose();" value="取消"/>
            </div>
    </form>
</div>
</body>
</html>
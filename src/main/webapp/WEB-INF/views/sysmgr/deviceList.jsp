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
    <title>设备管理</title>
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
    <script src="${ctx}/static/deviceManage.js"></script>
</head>


<body onload="doOnLoad()">

<div id="pointfrm" style="display:none;padding-top:40px;">
     <form id="updateForm" action="${ctx}/admin/device/save" method="post" autocomplete=off>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%" height="30" align="right"valign="middle" style="padding-right:10px;">名称：</td>
                <td><input type="hidden" name="id" id="id" value="" />
                    <input type="text" name="deviceName" id="deviceName" style="width: 135px"></input>
                </td>
              </tr>
              <tr>
                <td height="30" align="right"valign="middle" style="padding-right:10px;">类型：</td>
                <td>
                    <input name="deviceType" type="radio" value="SJZX"  />数据中心&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="deviceType" type="radio" value="JHJ" />交换机&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="deviceType" type="radio" value="RTU" checked/>RTU
                </td>
              </tr>
              <tr>
                <td height="30" align="right"valign="middle" style="padding-right:10px;">X坐标：</td>
                <td><input type="text" name="x" id="x" style="width: 135px"></input></td>
              </tr>
              <tr>
                <td height="30" align="right"valign="middle" style="padding-right:10px;">Y坐标：</td>
                <td><input type="text" name="y" id="y" style="width: 135px"></input></td>
              </tr>
              <tr >
                <td height="30" align="right"valign="middle" style="padding-right:10px;">井号：</td>
                <td><input type="text" name="endTagCode" id="endTagCode" style="width: 135px"></input></td>
              </tr>
              <tr>
                <td height="30" align="right"valign="middle" style="padding-right:10px;">上级ID：</td>
                <td><input type="text" name="parent" id="parent" style="width: 135px"></input></td>
              </tr>
              <tr>
                  <td colspan="2" height="30" align="center"> <input id="update_btn"  type="button" onclick="saveFormSubmit()"  value="提交"/></td>
              </tr>
            </table>
	</form>
</div>

</body>
</html>

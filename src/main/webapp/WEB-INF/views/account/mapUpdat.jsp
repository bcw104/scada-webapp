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
    <title>地图坐标</title>
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
        //window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
    </script>
    <script src="${ctx}/static/mapPermissionList.js"></script>
</head>

<body onload="dooOnLoad()">
    <div id="addMap" style="line-height:10px; margin-top: 20px; margin-left: 20px; text-align: center;">
            <form id="addForm" name="addForm" action="${ctx}/admin/map/addMapwi" method="post" autocomplete=off >
                <input id="endtagid" name="endtagid" type="hidden" value="0"/>
                <input id="pointid" name="pointid" type="hidden" value="0"/>
                <div style="width:200px">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="50px" height="30" align="center" valign="middle" >x坐标：</td>
                        <td><input type="text" name="user.username" id="pointx" style="width: 135px"></input></td>
                    </tr>
                    <tr>
                        <td height="50px" align="center" valign="middle" >y坐标：</td>
                        <td><input type="text" name="realName" id="pointy" style="width: 135px"></input></td>
                    </tr>
                    <tr>
                          <td colspan="2" height="30" style="padding-right:10px;"> 
                              <input id="submit_btn"  type="button" onclick="addMapFormSubmit()"  value="保存"/>
                          </td>
                    </tr>
                </table>
                    </div>
                </form>
                
        </div>    
</body>
</html>
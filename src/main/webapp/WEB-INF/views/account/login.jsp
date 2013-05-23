<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>登录</title>
        <link href="${ctx}/static/style/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body><br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
            <div class="pda">
                <div class="zitic"></div>
            </div>
            <div style="width:100%;" class="bgcolora gaoa">
                <div class="fl" style="position: absolute; z-index:1">
                    <img src="${ctx}/static/img/bjpica.jpg" width="846" height="240" />
                </div>
                <div class="fr bgcolora gaoa" style="position: absolute; left:730px; z-index:3;">
                    <br />
                    <br />
                    <div class="kda mta">
                        <div class="fl"><img src="${ctx}/static/img/pica.jpg" width="40" height="39" /></div>
                        <div class="fl zitib tar" style="width:68px; padding:10px;">用户名：</div>
                        <div class="fl pdb" ><input type="text" id="username" name="username"  value="${username}" class="inputa required"/></div>
                        <br class="ld"/>
                    </div>

                    <div class="kda mta">
                        <div class="fl"><img src="${ctx}/static/img/picb.jpg" width="40" height="39" /></div>
                        <div class="fl zitib tar" style="width:68px;padding:10px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</div>
                        <div class="fl pdb"><input type="password" id="password" name="password"  value="${password}"  class="inputa required"/></div>
                        <br class="ld"/>
                    </div>

                    <div class="kda pdc">
                        <div class="fr zitib" style="width:155px;">记住密码</div>
                        <div class="fr">
                            <input type="checkbox" id="rememberMe" name="rememberMe"/> 
                        </div>
                        <br class="ld"/>
                    </div>



                    <div class="kda">
                        <div class="fr pdd"><input  type="reset" class="new-btm" value="" />
                        </div>
                        <div class="fr pde"><input type="submit" class="new-btn" value=""/></div>
                    </div>



                </div>
                <br class="ld"/>
            </div>
        </form>
    </body>
</html>

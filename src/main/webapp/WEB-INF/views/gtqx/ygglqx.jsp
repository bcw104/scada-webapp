<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>有功功率曲线</title>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/static/js/highcharts.src.js"></script>
        <script src="${ctx}/static/js/chart1.js"></script>
        <style type="text/css">
	    html, body {
            width: 100%;
            height: 100%;
            margin: 0px;
            }
	</style>
        <script type="text/javascript">
            var objUrl='${ctx}';
            function ygglqxt(){
                // 示功图
                createYggl('1#油井','2013/6/27 11:40');
            }
        </script>
    </head>
    <body onload="ygglqxt();">
        <div id="ygglqx" style="width:100%; height:100%">
            <div id="containerr3" style="height:100%;width:100%; "></div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script>
            var majorlist;
            var cldata = [];
            $(function(){
                pageinit();
            });
            function pageinit(){
                $.getJSON("${ctx}/realtime/majortag",majortag_res);
            }
            function majortag_res(data){
                majorlist = data;
                //alert(JSON.toString(data));
                aaa = process(0);
            }
            function process(pid){
                var rtn = [];
                var myobj;
                for (x in majorlist){
                    if(item.pid == pid){
                        myobj.id = item.id;
                        myobj.name = item.name;
                                
                    }
                }

                
            }
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

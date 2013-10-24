 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${endTag.name}变频器输出曲线</title>
        
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/static/js/highcharts.src.js"></script>
        <script src="${ctx}/static/js/chart1.js"></script>
        <style> 
             #powerFactorContainer {
            	width: 400px; 
            	height: 400px;
                margin-top: 30px;
                margin-left: 248px;
             	float:left;
             }
             #dgtContainer {
             	width: 400px; 
            	height: 400px;
                margin-top: 30px;
             	float:left;
             }
        
        </style>
        <script>
        function onLoadCreateDl(p_code,p_data) {
        	
            // 载荷，示功图横坐标
            var str_xAxis = [];
            // 位移，示功图纵坐标
            var str_yAxis = [];
            
            var power_yAxis = [];

            $.ajax({
                type: 'POST',
                url: '${ctx}/realtime/welldgtdata',
                data:{code:p_code,data:p_data},
                dateType:'json',
                success: function(json){
                    var series = { 
                        data: []            
                    };            
                    
                    $.each(json, function(key, value) {   
                        
                        if(key == 'power_factor'){                    
                            str_yAxis = value;
                            
                        }else if(key == 'weiyi'){ 
                            str_xAxis = value;
                        }           
                    });   
                    
                    	options.series = [];
                    // 提示框中文字
                    series.name = '变频器输出功率曲线';
                    series.unit = '';
                    for (var i=0; i<str_xAxis.length; i++){
                        series.data.push([str_xAxis[i],str_yAxis[i]]);
                    }
                    options.chart.renderTo = 'powerFactorContainer';
                    options.yAxis.title.text = '变频器输出功率曲线';
                    options.series.push(series);
                    new Highcharts.Chart(options);
                    
                }
            });
            
            $.ajax({
                type: 'POST',
                url: '${ctx}/realtime/welldgtdata',
                data:{code:p_code,data:p_data},
                dateType:'json',
                success: function(json){
                    var series = { 
                        data: []            
                    };            
                    
                    $.each(json, function(key, value) {   
                        
                       if (key == "dgt"){
                        	power_yAxis = value;
                        }
                        else if(key == 'weiyi'){ 
                            str_xAxis = value;
                        }           
                    });   
                    
                    options.series = [];
                    // 提示框中文字
                    series.name = '变频器输出转矩曲线';
                    series.unit = '';
                    for (var i=0; i<str_xAxis.length; i++){
                        series.data.push([str_xAxis[i],power_yAxis[i]]);
                    }
                    options.chart.renderTo = 'dgtContainer';
                    options.yAxis.title.text = '变频器输出转矩曲线';
                    options.series.push(series);
                    new Highcharts.Chart(options);
                }
            });
        }
        </script>
    </head>
    <body onload="onLoadCreateDl('${code}');">
             <div id="powerFactorContainer"> </div>
             <div id="dgtContainer"> </div>
    </body>
</html>
   
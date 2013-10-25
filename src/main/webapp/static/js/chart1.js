// 示功图
var options = {
    chart: {
        renderTo: '',
        type: 'spline',
        //borderWidth:1,
        plotBorderWidth:1,
        reflow:'true'
    },
    title: {
        text: ''
    },
    xAxis: {
        categories: [],
        gridLineWidth:1,
        title:{
            text:'',
            style:{font:'normal 11px Verdana,sans-serif'}
        },
        max:0
    },
    yAxis: {
        title: {},
        min:0				
    },
    tooltip: {
        formatter: function() {
        return '<b>'+ this.series.name +'</b><br/>'+
        this.x +': '+ this.y +this.series.options.unit;//取得数据源中的值
        }
    },
    legend: {
        layout: 'horizontal',
        align: 'center',
        enabled:false,
        verticalAlign: 'top',
        x: -10,
        y: -10,
		borderWidth: 0
    },
    plotOptions: {
        spline: {
            marker: {
                enabled: false,
                states: {
                    hover: {
                        enabled: true,
                        symbol: 'circle',
						radius: 5,
						lineWidth: 1
					}
				}	
			}
		}
	},
    series: []
}

/**
 * 创建示功图
 * @param {type} p_code
 * @returns {undefined}
 */
function createSg(p_code,p_data) {
    
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];

    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){

            var series = { 
                data: []            
            };            
            
            $.each(json, function(key, value) {   
                
                if(key == 'zaihe'){                    
                    str_yAxis = value;
                }else if(key == 'weiyi'){
                    str_xAxis = value;                    
                }else if($("#" + key).length > 0){
                    
                    $("#" + key).html(value);
                    
                    if($("#" + key + "_fu").length > 0){                    
                        $("#" + key + "_fu").html(value);
                    }     
                }          
            });   
            
            if (typeof(flag_sel)!="undefined"){
                initTab1();
            }
            
            var weiyiTmp = 0;
            options.series = [];
            series.name = '示功图';
            series.unit = 'm';
            for (var i=0; i<str_xAxis.length; i++){

                if((Number(str_xAxis[i])) > weiyiTmp){
                    weiyiTmp = str_xAxis[i];
                }

                series.data.push([str_xAxis[i], str_yAxis[i]]);
            }
            options.chart.renderTo = 'containerr';
            options.xAxis.max = Math.ceil(weiyiTmp);
            options.yAxis.title.text = '示功图';
            options.series.push(series);//alert(series.data);
//            options.series = series;
            new Highcharts.Chart(options);
        }
    });
}

/**
 * 创建电流曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createDl(p_code,p_data) {
    
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];

    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){

            var series = { 
                data: []            
            };            
            
            $.each(json, function(key, value) {   
                
                if(key == 'ib'){                    
                    str_yAxis = value;
                }else if(key == 'weiyi'){ 
                    str_xAxis = value;
                }           
            });   
            
            options.series = [];
            series.name = '电流曲线';
            series.unit = 'm';
            for (var i=0; i<str_xAxis.length; i++){
                
                series.data.push([str_xAxis[i],str_yAxis[i]]);
            }
            options.chart.renderTo = 'containerr1';
            options.yAxis.title.text = '电流曲线';
            options.series.push(series);
            new Highcharts.Chart(options);
        }
    });
}

/**
 * 创建电功图
 * @param {type} p_code
 * @returns {undefined}
 */
function createDg(p_code,p_data) {
    
    // 载荷，电功图纵坐标
    var str_xAxis = [];
    // 位移，电功图横坐标
    var str_yAxis = [];

    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){

            var series = { 
                data: []            
            };            
            
            $.each(json, function(key, value) {   
                
                if(key == 'power'){
                    str_yAxis = value;
                }else if(key == 'weiyi'){
                    str_xAxis = value;
                }           
            });   
            
            options.series = [];
            series.name = '功率曲线';
            series.unit = 'm';
            for (var i=0; i<str_xAxis.length; i++){
                
                series.data.push([str_xAxis[i],str_yAxis[i]]);
            }
            options.chart.renderTo = 'containerr2';
            options.yAxis.title.text = '功率曲线';
            options.series.push(series);
            new Highcharts.Chart(options);
        }
    });
}

/**
 * 创建有功功率曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createYggl(p_code,p_data) {
    
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];

    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
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
            series.name = '功率因数曲线';
            series.unit = 'm';
            for (var i=0; i<str_xAxis.length; i++){
                
                series.data.push([str_xAxis[i],str_yAxis[i]]);
            }
            options.chart.renderTo = 'containerr3';
            options.yAxis.title.text = '功率因数曲线';
            options.series.push(series);
            new Highcharts.Chart(options);
        }
    });
}

/**
 * 创建示功图
 * @param {type} p_code
 * @returns {undefined}
 */
function createSgForShow(p_code,p_data) {
    
    var graph;
    var data_qx = [];
    // 示功图时间
    var date_sgt;
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];
    
    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){        
            $.each(json, function(key, value) {   

                if(key == 'zaihe'){                    
                    str_yAxis = value;
                }else if(key == 'weiyi'){
                    str_xAxis = value;                    
                }else if(key == 'time'){
                    date_sgt = new Date(value);
                }       
            }); 
            
            var maxTmp_x = 0;
            var maxTmp_y = 0;
            for (var i=0; i<str_xAxis.length; i++){
                if((Number(str_xAxis[i])) > maxTmp_x){                            
                    maxTmp_x = str_xAxis[i];
                }
                if((Number(str_yAxis[i])) > maxTmp_y){
                    maxTmp_y = str_yAxis[i];
                }
                data_qx.push([str_xAxis[i],str_yAxis[i]]);
             }
//alert(minTmp_x);
             var dd = {data:data_qx, lines : { show : true }}
             // Draw Graph
             var containerr = document.getElementById('containerr_sgt')
             graph = Flotr.draw(containerr, [ dd ],{
                title:date_sgt.getFullYear() + "-" + (date_sgt.getMonth() + 1) + "-" 
                    + date_sgt.getDate() + " " + date_sgt.getHours() + ":" + date_sgt.getMinutes(),
                xaxis : {
                    min : null,
                    max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                },
                yaxis : {
                    min : null,
                    max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                },
                mouse : {
                    track : true,
                    trackAll: false,
                    trackY: false,
                    trackFormatter: function(obj){
                        return '位移(横):<font color=green;>'+ obj.x +'</font>m</br>载荷(纵):<font color=green;>'+ obj.y + '</font>KN';//取得数据源中的值
                    }
                }
            });
        },
        complete: function (XHR, TS) { 
            XHR = null;
            CollectGarbage();
        } 
    });
}

/**
 * 创建电流曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createDlForShow(p_code,p_data) {
    
    var graph;
    var data_qx = [];
    // 曲线时间
    var date_qx;
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];
    
    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){        
            $.each(json, function(key, value) {   

                if(key == 'ib'){                    
                    str_yAxis = value;
                }else if(key == 'weiyi'){ 
                    str_xAxis = value;
                }else if(key == 'time'){
                    date_qx = new Date(value);
                }           
            });   

            var maxTmp_x = 0;
            var maxTmp_y = 0;
            for (var i=0; i<str_xAxis.length; i++){
                if((Number(str_xAxis[i])) > maxTmp_x){                            
                    maxTmp_x = str_xAxis[i];
                }
                if((Number(str_yAxis[i])) > maxTmp_y){
                    maxTmp_y = str_yAxis[i];
                }
                data_qx.push([str_xAxis[i],str_yAxis[i]]);
             }
//alert(minTmp_x);
             var dd = {data:data_qx, lines : { show : true }}
             // Draw Graph
             var containerr = document.getElementById('containerr_dl');
             graph = Flotr.draw(containerr, [ dd ],{
                title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                    + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                xaxis : {
                    min : null,
                    max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                },
                yaxis : {
                    min : null,
                    max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                },
                mouse : {
                    track : true,
                    trackAll: false,
                    trackY: false,
                    trackFormatter: function(obj){
                        return '位移(横):<font color=green;>'+ obj.x +'</font>m</br>电流(纵):<font color=green;>'+ obj.y + '</font>A';//取得数据源中的值
                    }
                }
            });
        },
        complete: function (XHR, TS) { 
            XHR = null;
            CollectGarbage();
        } 
    });
}

/**
 * 创建电功图
 * @param {type} p_code
 * @returns {undefined}
 */
function createDgForShow(p_code,p_data) {
    
    var graph;
    var data_qx = [];
    // 曲线时间
    var date_qx;
    // 载荷，电功图纵坐标
    var str_xAxis = [];
    // 位移，电功图横坐标
    var str_yAxis = [];
    
    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){   
            $.each(json, function(key, value) {   

                if(key == 'power'){
                    str_yAxis = value;
                }else if(key == 'weiyi'){
                    str_xAxis = value;
                }else if(key == 'time'){
                    date_qx = new Date(value);
                }
            });   

            var maxTmp_x = 0;
            var maxTmp_y = 0;
            for (var i=0; i<str_xAxis.length; i++){
                if((Number(str_xAxis[i])) > maxTmp_x){                            
                    maxTmp_x = str_xAxis[i];
                }
                if((Number(str_yAxis[i])) > maxTmp_y){
                    maxTmp_y = str_yAxis[i];
                }
                data_qx.push([str_xAxis[i],str_yAxis[i]]);
             }
//alert(minTmp_x);
             var dd = {data:data_qx, lines : { show : true }}
             // Draw Graph
             var containerr = document.getElementById('containerr_gl');
             graph = Flotr.draw(containerr, [ dd ],{
                title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                    + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                xaxis : {
                    min : null,
                    max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                },
                yaxis : {
                    min : null,
                    max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                },
                mouse : {
                    track : true,
                    trackAll: false,
                    trackY: false,
                    trackFormatter: function(obj){
                        return '位移(横):<font color=green;>'+ obj.x +'</font>m</br>功率(纵):<font color=green;>'+ obj.y + '</font>KW';//取得数据源中的值
                    }
                }
            });
        },
        complete: function (XHR, TS) { 
            XHR = null;
            CollectGarbage();
        } 
    });
}

/**
 * 创建有功功率曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createYgglForShow(p_code,p_data) {
        
    var graph;
    var data_qx = [];
    // 曲线时间
    var date_qx;
    // 载荷，示功图纵坐标
    var str_xAxis = [];
    // 位移，示功图横坐标
    var str_yAxis = [];
            
    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldgtdata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){   
            $.each(json, function(key, value) {   

                if(key == 'power_factor'){
                    str_yAxis = value; 
                }else if(key == 'weiyi'){
                    str_xAxis = value;
                }else if(key == 'time'){
                    date_qx = new Date(value);
                }
            });   

            var maxTmp_x = 0;
            var maxTmp_y = 0;
            for (var i=0; i<str_xAxis.length; i++){
                if((Number(str_xAxis[i])) > maxTmp_x){                            
                    maxTmp_x = str_xAxis[i];
                }
                if((Number(str_yAxis[i])) > maxTmp_y){
                    maxTmp_y = str_yAxis[i];
                }
                data_qx.push([str_xAxis[i],str_yAxis[i]]);
             }
//alert(minTmp_x);
             var dd = {data:data_qx, lines : { show : true }}
             // Draw Graph
             var containerr = document.getElementById('containerr_ys');
             graph = Flotr.draw(containerr, [ dd ],{
                title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                    + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                xaxis : {
                    min : null,
                    max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                },
                yaxis : {
                    min : null,
                    max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                },
                mouse : {
                    track : true,
                    trackAll: false,
                    trackY: false,
                    trackFormatter: function(obj){
                        return '位移(横):<font color=green;>'+ obj.x +'</font>m</br>功率(纵):<font color=green;>'+ obj.y + '</font>KW';//取得数据源中的值
                    }
                }
            });
        },
        complete: function (XHR, TS) { 
            XHR = null;
            CollectGarbage();
        } 
    });
}

/**
 * 创建全部曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createAllQx(p_code,p_data) {
//    alert(p_code);

    // 示功图时间
    var date_sgt;
    // 曲线时间
    var date_qx;
    // 载荷，示功图横坐标
    var str_yAxis_sg = [];
    // 载荷，电流曲线横坐标
    var str_yAxis_dl = [];
    // 载荷，功率曲线横坐标
    var str_yAxis_dg = [];
    // 载荷，有功功率曲线横坐标
    var str_yAxis_yg = [];
    // 位移，纵坐标
    var str_xAxis_qt = [];
    var str_xAxis_sg = [];

    var graph;
    var data_qx = [];

    $.ajax({
        type: 'POST',
        url: objUrl + '/realtime/welldata',
        data:{code:p_code,data:p_data},
        dateType:'json',
        success: function(json){

//            sgJson = json;
            var series = { 
                data: []            
            };            
            
            $.each(json, function(key, value) {   
                
                if(key == 'zaihe'){                    
                    str_yAxis_sg = value;
                }else if(key == 'weiyi'){
                    str_xAxis_sg = value;                    
                }else if(key == 'time'){
                    date_sgt = new Date(value);
                }else if($("#" + key).length > 0){
                    
                    $("#" + key).html(formatNumber(value, 2));
                    
                    if($("#" + key + "_fu").length > 0){                    
                        $("#" + key + "_fu").html(formatNumber(value, 2));
                    }     
                }          
            });  
            
            $.ajax({
                type: 'POST',
                url: objUrl + '/realtime/welldgtdata',
                data:{code:p_code,data:p_data},
                dateType:'json',
                success: function(json){
                    
//                    qxJson = json;
                    $.each(json, function(key, value) { 
                        if(key == 'power_factor'){
                            str_yAxis_yg = value; 
                        }else if(key == 'power'){
                            str_yAxis_dg = value;
                        }else if(key == 'ib'){                    
                            str_yAxis_dl = value;
                        }else if(key == 'weiyi'){
                            str_xAxis_qt = value;                    
                        }else if(key == 'time'){
                            date_qx = new Date(value);
                        }
                    });

                    var maxTmp_x = 0;
                    var maxTmp_y = 0;
                    for (var i=0; i<str_xAxis_sg.length; i++){
                        if((Number(str_xAxis_sg[i])) > maxTmp_x){                            
                            maxTmp_x = str_xAxis_sg[i];
                        }
                        if((Number(str_yAxis_sg[i])) > maxTmp_y){
                            maxTmp_y = str_yAxis_sg[i];
                        }
                        data_qx.push([str_xAxis_sg[i],str_yAxis_sg[i]]);
                    }
//alert(minTmp_x);
                    var dd = {data:data_qx, lines : { show : true }}
                    // Draw Graph
                    var containerr = document.getElementById('containerr')
                    graph = Flotr.draw(containerr, [ dd ],{
                        title:date_sgt.getFullYear() + "-" + (date_sgt.getMonth() + 1) + "-" 
                            + date_sgt.getDate() + " " + date_sgt.getHours() + ":" + date_sgt.getMinutes(),
                        xaxis : {
                          min : null,
                          max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                        },
                        yaxis : {
                          min : null,
                          max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                        },
                        mouse : {
                            track : true,
                            trackAll: false,
                            trackY: false,
                            relative : false,
                            radius:0.1,
                            trackFormatter: function(obj){                                
                                return '<b>示功图</b><br/>'+ obj.x +': '+ obj.y + 'm';//取得数据源中的值
                            }
                        }
                    });
                    
                    if(graph != null){
                        graph.destroy();
                        graph = null;
                    }
                    
                    data_qx = [];
                    maxTmp_x = 0;
                    maxTmp_y = 0;
                    for (var i=0; i<str_xAxis_qt.length; i++){
                        if((Number(str_xAxis_qt[i])) > maxTmp_x){                            
                            maxTmp_x = str_xAxis_qt[i];
                        }
                        if((Number(str_yAxis_dl[i])) > maxTmp_y){
                            maxTmp_y = str_yAxis_dl[i];
                        }
                        data_qx.push([str_xAxis_qt[i],str_yAxis_dl[i]]);
                    }
                    dd = {data:data_qx, lines : { show : true }}
                    // Draw Graph
                    var containerr1 = document.getElementById('containerr1')
                    graph = Flotr.draw(containerr1, [ dd ],{
                        title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                            + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                        xaxis : {
                          min : null,
                          max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                        },
                        yaxis : {
                          min : null,
                          max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                        },
                        mouse : {
                            track : true,
                            trackAll: false,
                            trackY: false,
                            relative : false,
                            radius:0.1,
                            trackFormatter: function(obj){
                                return '<b>电流曲线</b><br/>'+ obj.x +': '+ obj.y + 'm';//取得数据源中的值
                            }
                        }
                    });
                    
                    if(graph != null){
                        graph.destroy();
                        graph = null;
                    }
                    
                    data_qx = [];
                    maxTmp_x = 0;
                    maxTmp_y = 0;
                    for (var i=0; i<str_xAxis_qt.length; i++){
                        if((Number(str_xAxis_qt[i])) > maxTmp_x){                            
                            maxTmp_x = str_xAxis_qt[i];
                        }
                        if((Number(str_yAxis_dg[i])) > maxTmp_y){
                            maxTmp_y = str_yAxis_dg[i];
                        }
                        data_qx.push([str_xAxis_qt[i],str_yAxis_dg[i]]);
                    }
                    dd = {data:data_qx, lines : { show : true }}
                    // Draw Graph
                    var containerr2 = document.getElementById('containerr2')
                    graph = Flotr.draw(containerr2, [ dd ],{
                        title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                            + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                        xaxis : {
                          min : null,
                          max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                        },
                        yaxis : {
                          min : null,
                          max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                        },
                        mouse : {
                            track : true,
                            trackAll: false,
                            trackY: false,
                            relative : false,
                            radius:0.1,
                            trackFormatter: function(obj){
                                return '<b>功率曲线</b><br/>'+ obj.x +': '+ obj.y + 'm';//取得数据源中的值
                            }
                        }
                    });
                    
                    if(graph != null){
                        graph.destroy();
                        graph = null;
                    }
                    
                    data_qx = [];
                    maxTmp_x = 0;
                    maxTmp_y = 0;
                    for (var i=0; i<str_xAxis_qt.length; i++){
                        if((Number(str_xAxis_qt[i])) > maxTmp_x){                            
                            maxTmp_x = str_xAxis_qt[i];
                        }
                        if((Number(str_yAxis_yg[i])) > maxTmp_y){
                            maxTmp_y = str_yAxis_yg[i];
                        }
                        data_qx.push([str_xAxis_qt[i],str_yAxis_yg[i]]);
                    }
                    dd = {data:data_qx, lines : { show : true }}
                    // Draw Graph
                    var containerr3 = document.getElementById('containerr3');
                    graph = Flotr.draw(containerr3, [ dd ],{
                        title:date_qx.getFullYear() + "-" + (date_qx.getMonth() + 1) + "-" 
                            + date_qx.getDate() + " " + date_qx.getHours() + ":" + date_qx.getMinutes(),
                        xaxis : {
                          min : null,
                          max : accAdd(maxTmp_x, accMul(maxTmp_x, 0.1))
                        },
                        yaxis : {
                          min : null,
                          max : accAdd(maxTmp_y, accMul(maxTmp_y, 0.1))
                        },
                        mouse : {
                            track : true,
                            trackAll: false,
                            trackY: false,
                            relative : false,
                            radius:0.1,
                            trackFormatter: function(obj){
                                return '<b>功率因数曲线</b><br/>'+ obj.x +': '+ obj.y + 'm';//取得数据源中的值
                            }
                        }
                    });
                    data_qx = [];
                    if(graph != null){
                        graph.destroy();
                        graph = null;
                    }
                },
                complete: function (XHR, TS) { 
                    XHR = null;
                    CollectGarbage();
                } 
            }); 
        },
        complete: function (XHR, TS) { 
            XHR = null;
            CollectGarbage();
        } 
    });
}

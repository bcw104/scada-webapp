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
            options.chart.renderTo = 'containerr_sgt';
            options.xAxis.max = Math.ceil(weiyiTmp);
            options.yAxis.title.text = '示功图';
            options.series.push(series);
            new Highcharts.Chart(options);
        }
    });
}

/**
 * 创建电流曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createDlForShow(p_code,p_data) {
    
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
            options.chart.renderTo = 'containerr_dl';
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
function createDgForShow(p_code,p_data) {
    
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
            options.chart.renderTo = 'containerr_gl';
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
function createYgglForShow(p_code,p_data) {
    
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
            options.chart.renderTo = 'containerr_ys';
            options.yAxis.title.text = '功率因数曲线';
            options.series.push(series);
            new Highcharts.Chart(options);
        }
    });
}


/**
 * 创建全部曲线
 * @param {type} p_code
 * @returns {undefined}
 */
function createAllQx(p_code,p_data) {
    
    // 载荷，示功图横坐标
    var str_yAxis_sg = [];
    // 载荷，电流曲线横坐标
    var str_yAxis_dl = [];
    // 载荷，功率曲线横坐标
    var str_yAxis_dg = [];
    // 载荷，有功功率曲线横坐标
    var str_yAxis_yg = [];
    // 位移，纵坐标
    var str_xAxis = [];

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
                    str_yAxis_sg = value;
                }else if(key == 'weiyi'){
                    str_xAxis = value;                    
                }else if($("#" + key).length > 0){
                    
                    $("#" + key).html(formatNumber(value, 2));
                    
                    if($("#" + key + "_fu").length > 0){                    
                        $("#" + key + "_fu").html(formatNumber(value, 2));
                    }     
                }          
            });   
            
            if (typeof(flag_sel)!="undefined"){
                initTab1();
            }
            
            $.ajax({
                type: 'POST',
                url: objUrl + '/realtime/welldgtdata',
                data:{code:p_code,data:p_data},
                dateType:'json',
                success: function(json){
                    
                    $.each(json, function(key, value) { 
                        if(key == 'power_factor'){
                            str_yAxis_yg = value; 
                        }else if(key == 'power'){
                            str_yAxis_dg = value;
                        }else if(key == 'ib'){                    
                            str_yAxis_dl = value;
                        }else if(key == 'weiyi'){
                            str_xAxis = value;                    
                        }
                    });
                    
                    var weiyiTmp = 0;
                    series.name = '示功图';
                    series.unit = 'm';
                    series.data = [];
                    for (var i=0; i<str_xAxis.length; i++){

                        if((Number(str_xAxis[i])) > weiyiTmp){
                            weiyiTmp = str_xAxis[i];
                        }

                        series.data.push([str_xAxis[i], str_yAxis_sg[i]]);
                    }
                    // 页面显示用
                    options.series = [];
                    options.chart.renderTo = 'containerr';
                    options.xAxis.max = Math.ceil(weiyiTmp);
                    options.yAxis.title.text = '示功图';
                    options.series.push(series);
                    new Highcharts.Chart(options);

                    series.name = '电流曲线';
                    series.unit = 'm';
                    series.data = [];
                    for (var i=0; i<str_xAxis.length; i++){
                        series.data.push([str_xAxis[i], str_yAxis_dl[i]]);
                    }
                    // 页面显示用
                    options.series = [];
                    options.chart.renderTo = 'containerr1';
                    options.xAxis.max = Math.ceil(weiyiTmp);
                    options.yAxis.title.text = '电流曲线';
                    options.series.push(series);
                    new Highcharts.Chart(options);

                    series.name = '功率曲线';
                    series.unit = 'm';
                    series.data = [];
                    for (var i=0; i<str_xAxis.length; i++){
                        series.data.push([str_xAxis[i], str_yAxis_dg[i]]);
                    }
                    // 页面显示用
                    options.series = [];
                    options.chart.renderTo = 'containerr2';
                    options.xAxis.max = Math.ceil(weiyiTmp);
                    options.yAxis.title.text = '功率曲线';
                    options.series.push(series);
                    new Highcharts.Chart(options);
                    
                    series.name = '功率因数曲线';
                    series.unit = 'm';
                    series.data = [];
                    for (var i=0; i<str_xAxis.length; i++){
                        series.data.push([str_xAxis[i], str_yAxis_yg[i]]);
                    }
                    // 页面显示用
                    options.series = [];
                    options.chart.renderTo = 'containerr3';
                    options.xAxis.max = Math.ceil(weiyiTmp);
                    options.yAxis.title.text = '功率因数曲线';
                    options.series.push(series);
                    new Highcharts.Chart(options);
                }
            }); 
        }
    });
}

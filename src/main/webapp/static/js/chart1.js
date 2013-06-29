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
            
            options.series = [];
            series.name = '示功图';
            series.unit = 'm';
            for (var i=0; i<str_xAxis.length; i++){
                
                series.data.push([str_xAxis[i],str_yAxis[i]]);
            }
            options.chart.renderTo = 'containerr';
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

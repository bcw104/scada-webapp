//开井数
$(function(){
window.chart= new Highcharts.Chart({
			            chart: {
			                renderTo: 'container',
			                type: 'line'
			            },
			            title: {
			                text: ''
			            },
			            xAxis: {
			                categories: [
			                    '1月1日', '2月1日', '3月1日', '4月1日', '5月1日'
			                ]
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: '开&nbsp;&nbsp;&nbsp;&nbsp;井&nbsp;&nbsp;&nbsp;&nbsp;数' 
			                }
			            },
			            legend: {
			                		enabled:false
			                	       
			                	    },
			            tooltip: {
			            	shared: true,
							
			            },
			            plotOptions: {
			                column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			          	series: [ {name: '开井数(个)',
							unit:'个',
					      	data: [1000,1200,1100,1400,1200]}
							]
			        });
});
//产油量
$(function(){
window.chart1= new Highcharts.Chart({
			            chart: {
			                renderTo: 'container1',
			                type: 'line'
			            },
			            title: {
			                text: ''
			            },
			            xAxis: {
			                categories: [
			                    '1月1日', '2月1日', '3月1日', '4月1日', '5月1日'
			                ]
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: '产&nbsp;&nbsp;&nbsp;&nbsp;油&nbsp;&nbsp;&nbsp;&nbsp;量' 
			                }
			            },
			            legend: {
			                		enabled:false
			                	       
			                	    },
			            tooltip: {
			            	shared: true,
							
			            },
			            plotOptions: {
			                column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			          	series: [ {
					        name: '油井耗电量(kw·h)',
							unit:'(kw·h)',
					      	data: [10000,13000,14000,12000,12000]					      
					   		}
							]
			        });
});
//产汽量
$(function(){
window.chart3= new Highcharts.Chart({
			            chart: {
			                renderTo: 'container2',
			                type: 'line'
			            },
			            title: {
			                text: ''
			            },
			            xAxis: {
			                categories: [
			                    '1月1日', '2月1日', '3月1日', '4月1日', '5月1日'
			                ]
			            },
			            yAxis: {
			                min: 0,
			                title: {
			                    text: '产&nbsp;&nbsp;&nbsp;&nbsp;汽&nbsp;&nbsp;&nbsp;&nbsp;量' 
			                }
			            },
			            legend: {
			                		enabled:false
			                	       
			                	    },
			            tooltip: {
			            	shared: true,
							
			            },
			            plotOptions: {
			                	column: {
			                    pointPadding: 0.2,
			                    borderWidth: 0
			                }
			            },
			          	series: [ {
					        	name: '油井注气量(m3/s)',
								unit:'(m3/s)',
						      	data: [51000,62000,43000,91000,54000]				      
					   		}
							]
			        });
});

//创建产油量曲线
 function te(cy){
	var charid=chart1;
	for(var i=0;i<charid.series.length;i++){
		charid.series[i].remove();
	}
	charid.redraw();
	charid.addSeries(
						{
							data: cy,
							color:'red'
						}
				    );
				 		
}	














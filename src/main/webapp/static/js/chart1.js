//闭合曲线
$(function () {
    var chart3;
        chart3 = new Highcharts.Chart({
            chart: {
                renderTo: 'containerr',
                type: 'spline',
				//borderWidth:1,
				plotBorderWidth:1,
				reflow:'true',
            },
            title: {
                text: ''
            },
            xAxis: {
                 categories: ['0', '1','2','3','4','5','6','7','8','9'],
				 gridLineWidth:1,
            },
            yAxis: {
                title: {
                    text: '&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;流&nbsp;(m)'
                },
				minPadding:0.5,
				min:0,
				
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
            series: [{
				name:'示工图',
				unit:'m',
                data: [
				[1,5],[2,4],[3,5],[4,4],[5,2],[6,4],[7,3],[8,5],[ 9,2],[1,1],[2,2],[1,5]
				]
            }]
        });
    
});
//闭合曲线
$(function () {
    var chart3;
        chart3 = new Highcharts.Chart({
            chart: {
                renderTo: 'containerr1',
                type: 'spline',
				//borderWidth:1,
				plotBorderWidth:1,
				reflow:'true',
            },
            title: {
                text: ''
            },
            xAxis: {
                 categories: ['0', '1','2','3','4','5','6','7','8','9'],
				 gridLineWidth:1,
            },
            yAxis: {
                title: {
                    text: '&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;流&nbsp;(m)'
                },
				minPadding:0.5,
				min:0,
				
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
            series: [{
				name:'示工图',
				unit:'m',
                data: [
				[1,5],[2,4],[3,5],[4,4],[5,2],[6,4],[7,3],[8,5],[ 9,2],[1,1],[2,2],[1,5]
				]
            }]
        });
    
});

//闭合曲线
$(function () {
    var chart3;
        chart3 = new Highcharts.Chart({
            chart: {
                renderTo: 'containerr2',
                type: 'spline',
				//borderWidth:1,
				plotBorderWidth:1,
				reflow:'true',
            },
            title: {
                text: ''
            },
            xAxis: {
                 categories: ['0', '1','2','3','4','5','6','7','8','9'],
				 gridLineWidth:1,
            },
            yAxis: {
                title: {
                    text: '&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;流&nbsp;(m)'
                },
				minPadding:0.5,
				min:0,
				
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
            series: [{
				name:'示工图',
				unit:'m',
                data: [
				[1,5],[2,4],[3,5],[4,4],[5,2],[6,4],[7,3],[8,5],[ 9,2],[1,1],[2,2],[1,5]
				]
            }]
        });
    
});
//闭合曲线
$(function () {
    var chart3;
        chart3 = new Highcharts.Chart({
            chart: {
                renderTo: 'containerr3',
                type: 'spline',
				//borderWidth:1,
				plotBorderWidth:1,
				reflow:'true',
            },
            title: {
                text: ''
            },
            xAxis: {
                 categories: ['0', '1','2','3','4','5','6','7','8','9'],
				 gridLineWidth:1,
            },
            yAxis: {
                title: {
                    text: '&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;流&nbsp;(m)'
                },
				minPadding:0.5,
				min:0,
				
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
            series: [{
				name:'示工图',
				unit:'m',
                data: [
				[1,5],[2,4],[3,5],[4,4],[5,2],[6,4],[7,3],[8,5],[ 9,2],[1,1],[2,2],[1,5]
				]
            }]
        });
    
});




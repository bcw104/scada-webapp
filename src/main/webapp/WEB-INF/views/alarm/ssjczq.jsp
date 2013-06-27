<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生产监控</title>        
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-zz.css">
        <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/static/js/highcharts.src.js"></script>
        <script src="${ctx}/static/js/chart.js"></script>
        <script src="${ctx}/static/js/math.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.messager.js"></script>
        <script src="${ctx}/static/application.js"></script>
        <style type="text/css">
            html, body {
                width: 100%;
                height: 100%;
                margin: 0px;
            }
            #yin {
                position:absolute;
                left:1600px;
                top:146px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin1 {
                position:absolute;
                left:2000px;
                top:350px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin2 {
                position:absolute;
                left:1900px;
                top:320px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin3{
                position:absolute;
                left:1520px;
                top:500px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin4 {
                position:absolute;
                left:1756px;
                top:280px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin5 {
                position:absolute;
                left:2000px;
                top:400px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin6 {
                position:absolute;
                left:1800px;
                top:550px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #yin12 {
                position:absolute;
                left:1500px;
                top:300px;
                width:1075px;
                height:27px;
                z-index:1;
            }
        </style>
        <script>
            var dhxWins,Grid,dhxWins,dhxWins1,dhxd,dhxd1,dhxd2,dhxd3,gr,zqdq,zqdq1,zqdq2;
            var dtu ='<div id="dt" style="width:100%; height:100%; background-color:#C3F"><img src="images/djgyt22.jpg"  style="width:100%; height:100%"></img></div>';
            var xb='<div id="gtc"  style="width:100%;height:100%;border-style:groove; border-width:1px;float:left" ><table><tr><td  style="width:250px" align="center">B相电压5次谐波:0.1</td><td  style="width:250px" align="center">B相电压7次谐波:0.2</td></tr><tr><td  style=" width:250px" align="center">B相电压11次谐波:0.3</td><td  style="width:250px" align="center">B相电压13次谐波:0.4</td></tr><tr><td  style="width:250px" align="center">B相电压17次谐波:0.5</td><td  style="width:250px" align="center">B相电压19次谐波:0.6</td></tr></table></div>';
            var ew='<div id="y" style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="摄像头"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx();">取消</button><td></tr></table></div>';
            var anniu='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="kj();">开井</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">停井</button><td></tr></table></div>';
            var sd='<div id="y"style="width:180px;height:30px;float:left;"><table><tr><td style="width:250px" align="center">油井状态:开井</td></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qdd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qxx();">取消</button><td></tr></table></div>';
            var yt='<div id="y"style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="参数改变"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd1();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx1();">取消</button><td></tr></table></div>';
            var yc='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tc();">调参</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">取消</button><td></tr></table></div>';
            var ytc='<div id="y"style="width:380px;height:60px;float:left"><table border="0" width="100%"><tr><td style="width:150px; " align="left">上行冲程(m)：<input name="" type="text" value="4" style="width:20px;"/></td><td style="width:150px; " align="left">上行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2.1" style="width:20px;"/></td></tr><tr><td style="width:150px; ba" align="left">下行冲程(m)：<input name="" type="text" value="3.9" style="width:20px;"/></td><td style="width:150px; " align="left">下行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2" style="width:20px;"/></td></tr></table></div><div id="k" style="width:100%;height:60px;float:left"><table width="100%"><tr><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qd2();">确定</button><td><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qx2();">取消</button><td></tr></table></div>';             
             
             var objUrl='${ctx}';
            var username='${username}';
            
             // 报警时间
             var dateAction = new Date(${actionTime});   
             var datePar = dateAction.getFullYear() + '/' + (dateAction.getMonth() + 1) + '/' 
                + dateAction.getDate() + ' ' + dateAction.getHours() + ':' + dateAction.getMinutes();
    
            /* 页面初始化
             * @returns {undefined}
             */
            function zp(){
                createGrid();
                createWindows();
                createWindows1();
                createwind();
                createwind1();
                createwind2();
                createwi();
                //工况信息
                createzqGr();
                //电气参数
                createzqdqGr();
                createzqdqGr1();
                createzqdqGr2();
            }
            
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doZqGrClick(gr_rId, gr_cInd){    

                    var tmpVarName;
                    var tmpVarTtitle;
                    switch(gr_cInd){
                        case 0:
                            tmpVarName = 'zc_zqll_sh';
                            tmpVarTtitle = '蒸汽流量瞬时值';
                            break;
                        case 1:
                            tmpVarName = 'zc_zqll_lj';
                            tmpVarTtitle = '蒸汽流量累计值';
                            break;
                        case 2:
                            tmpVarName = 'zc_zqyl';
                            tmpVarTtitle = '蒸汽压力';
                            break;
                        case 3:
                            tmpVarName = 'zc_zqwd';
                            tmpVarTtitle = '蒸汽温度';
                            break;
                        case 4:
                            tmpVarName = 'zc_zqgd';
                            tmpVarTtitle = '蒸汽干度';
                            break;
                    }
                    
                    $("#ssqxTitle").html('&nbsp&nbsp&nbsp（' + tmpVarTtitle + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:'ZHU_CAI',varName:tmpVarName,date:datePar},
                        dateType:'json',
                        success: function(json){

                            var xAxisData = [];
                            var yAxisData = [];
                            $.each(json,function(key, value){

                                xAxisData.push(value.value);
                                
                                var dateTmp = new Date(value.date)
                                yAxisData.push(dateTmp.getHours() + ':' + dateTmp.getMinutes());
                            });

                            var ys;
                            if(j > 2){
                                j = 0;
                            }
                            ys = yse[j];	
                            te(xAxisData, tmpVarTtitle, '', ys, yAxisData, 'container');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
                }  
                
            /**
             * 获得注气参数
             * @returns {undefined}
             */
            function createGrid(){
                Grid= new dhtmlXGridObject('dqcs');
                Grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs");
                Grid.setHeader(["注采蒸汽流量瞬时值(m³/s)","注采蒸汽流量累计值（m³）","注采压力（MPa）","注采温度（℃）","注采干度（%）"]);
                Grid.setInitWidths("182,182,179,179,*");
                Grid.setColAlign("center,center,center,center,center");
                Grid.setColTypes("ro,ro,ro,ro,ro");
                Grid.init();
                
                // 获得注气参数信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupbydate',
                    data:{code:'${info.code}',group:'ZHU_CAI',date:datePar},
                    dateType:'json',
                    success: function(json){

                        var youjingData = new Object();
                        youjingData.rows = [];

                        var youjingItem = new Object();
                        youjingItem.id = 1;
                        youjingItem.data = new Array(5);
                        
                        $.each(json,function(key, value){

                            switch(value.key){
                            
                                case 'zc_zqll_sh':
                                    youjingItem.data[0] = value.value;
                                    break;
                                case 'zc_zqll_lj':
                                    youjingItem.data[1] = value.value;
                                    break;
                                case 'zc_zqyl':
                                    youjingItem.data[2] = value.value;
                                    break;
                                case 'zc_zqwd':
                                    youjingItem.data[3] = value.value;
                                    break;
                                case 'zc_zqgd':
                                    youjingItem.data[4] = value.value;
                                    break;
                            }                        
                        });
//                        alert(youjingItem.data);
                        youjingData.rows.push(youjingItem);
                        Grid.parse(youjingData,'json');
                    }
                }); 
                
                // 事件绑定
                Grid.attachEvent('onRowSelect', doZqGrClick); 
            }
            
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doGrClick(gr_rId, gr_cInd){                    
                    var tmpName = gr_rId.split('||');
                    $("#ssqxTitle").html('&nbsp&nbsp&nbsp（' + tmpName[1] + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:tmpName[2],varName:tmpName[0],date:datePar},
                        dateType:'json',
                        success: function(json){

                            var xAxisData = [];
                            var yAxisData = [];
                            $.each(json,function(key, value){

                                xAxisData.push(value.value);
                                
                                var dateTmp = new Date(value.date)
                                yAxisData.push(dateTmp.getHours() + ':' + dateTmp.getMinutes());
                            });

                            var ys;
                            if(j > 2){
                                j = 0;
                            }
                            ys = yse[j];	
                            te(xAxisData, tmpName[1], '', ys, yAxisData, 'container');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
                }  
                
            /**
             * 页面布局设置
             * @returns {undefined}
             */
            var yse=['black','blue'];
            var j=0;
            var dyDate= [0.57,0.52,0.56,0.59,0.55,0.6,0.57,0.5,0.57,0.55,0.6,0.52,0.57,0.5,0.5,0.56,0.59,0.53,0.58,0.56,0.54,0.6,0.51,0.59,0.55,0.51,0.59,0.52,0.58,0.54,0.59,0.52,0.51,0.57,0.53,0.54,0.58,0.5,0.53,0.53,0.59,0.57,0.56,0.51,0.54,0.6,0.51,0.6,0.52,0.53,0.58,0.53,0.51,0.59,0.59,0.6,0.54,0.57,0.51,0.51,0.58,0.55,0.6,0.6,0.6,0.58,0.59,0.55,0.52,0.56,0.52,0.53,0.59,0.54,0.55,0.58,0.55,0.5,0.6,0.55,0.57,0.57,0.51,0.51,0.51,0.59,0.59,0.53,0.54,0.54,0.54,0.6,0.6,0.5,0.59,0.53,0.58,0.5,0.53,0.55,0.59,0.59,0.53,0.54,0.56,0.51,0.53,0.59,0.56,0.5,0.51,0.57,0.6,0.55,0.57,0.5,0.53,0.54,0.54,0.57,0.54,0.58,0.58,0.59,0.54,0.57,0.52,0.6,0.55,0.5,0.56,0.55,0.52,0.55,0.57,0.55,0.59,0.52,0.56,0.6,0.51,0.6,0.54,0.6,0.59,0.53,0.52,0.51,0.54,0.52,0.52,0.57,0.58,0.54,0.58,0.59,0.51,0.52,0.53,0.53,0.54,0.5,0.58,0.59,0.58,0.54,0.54,0.53,0.59,0.55,0.6,0.58,0.51,0.51,0.56,0.57,0.55,0.57,0.6,0.51,0.51,0.55,0.5,0.55,0.54,0.52,0.6,0.53,0.59,0.6,0.59,0.58,0.54,0.6,0.55,0.56,0.5,0.52,0.57,0.57,0.51,0.55,0.51,0.53,0.57,0.56,0.6,0.54,0.56,0.55,0.51,0.51,0.51,0.52,0.51,0.52,0.59,0.54,0.54,0.57,0.51,0.59,0.6,0.58,0.53,0.56,0.53,0.5,0.53,0.53,0.58,0.51,0.54,0.53,0.51,0.6,0.58,0.5,0.52,0.56,0.52,0.5,0.56,0.52,0.52,0.53,0.53,0.55,0.56,0.5,0.54,0.52,0.6,0.56,0.57,0.56,0.53,0.53,0.55,0.51,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null];
            /**
             * 设置工况信息
             * @returns {undefined}
             */
            function createzqGr(){
                gr=new dhtmlXGridObject('zq');
                gr.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                gr.setNoHeader(true);//隐藏表头
                gr.setHeader(["序号"]);
                gr.setInitWidths("100");
                gr.setColAlign("left");
                gr.setColTypes("ro");
                gr.init();
                 // 获得工况信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupbydate',
                    data:{code:'${info.code}',group:'YOU_JING',date:datePar},
                    dateType:'json',
                    success: function(json){

                        var youjingData = new Object();
                        youjingData.rows = [];

                        $.each(json,function(key, value){

                            if(value.key == 'qi_ting_zhuang_tai'){
                                if(value.value == 'false'){
                                    $("#youjingState").attr("src","${ctx}/static/img/hongse.png");
                                }else{
                                    $("#youjingState").attr("src","${ctx}/static/img/lse.png");
                                }
                            }else{

                                var youjingItem = new Object();
                                youjingItem.id = value.key + '||' + value.name + '||YOU_JING';
                                youjingItem.data = [];
                                youjingItem.data.push(value.name + '：' + value.value);
                                youjingData.rows.push(youjingItem);
                            }
                        });

                        gr.parse(youjingData,'json');
                        
                        if(gr.getRowsNum() > 0){
                            
                            doGrClick(gr.getRowId(0), 0);
                        }
                    }
                });    
                
                // 事件绑定
                gr.attachEvent('onRowSelect', doGrClick);
                }
             function createzqdqGr(){
                zqdq=new dhtmlXGridObject('zqdq');
				zqdq.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				zqdq.setHeader(["电力"]);
				zqdq.setInitWidths("*");
				zqdq.setColAlign("left");
				zqdq.setColTypes("ro");
				zqdq.init();
				// 获得电力信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupbydate',
                    data:{code:'${info.code}',group:'DIAN_YC',date:datePar},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            var dataItem = new Object();
                                dataItem.id = value.key + '||' + value.name + '||DIAN_YC';
                                dataItem.data = [];
                                dataItem.data.push(value.name + '：' + value.value);

                                dataInfo.rows.push(dataItem);
                        });

                        zqdq.parse(dataInfo,'json');
                    }
                }); 
                
                // 事件绑定
                zqdq.attachEvent('onRowSelect', doGrClick); 
            }
            function createzqdqGr1(){
                zqdq1=new dhtmlXGridObject('zqdq1');
				zqdq1.setImagePath("js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				zqdq1.setHeader(["电量"]);
				zqdq1.setInitWidths("*");
				zqdq1.setColAlign("left");
				zqdq1.setColTypes("ro");
				zqdq1.init();
				// 获得电量信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupbydate',
                    data:{code:'${info.code}',group:'DIAN_YM',date:datePar},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            var dataItem = new Object();
                                dataItem.id = value.key + '||' + value.name + '||DIAN_YC';
                                dataItem.data = [];
                                dataItem.data.push(value.name + '：' + value.value);

                                dataInfo.rows.push(dataItem);
                        });

                        zqdq1.parse(dataInfo,'json');
                    }
                }); 
                
                // 事件绑定
                zqdq1.attachEvent('onRowSelect', doGrClick); 
            }
            
                /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doFzZzGrClick(gr_rId, gr_cInd){
                    
                    var tmpName = gr_rId.split('||');
                    $("#dqqxTitle").html('&nbsp&nbsp&nbsp（' + tmpName[1] + '）');
                    
                    var xAxisData = [];
                    var yAxisData = [];
                    
                    var colors = Highcharts.getOptions().colors;
                    
                    $.each(xbJson, function(key, value){

                        if(value.key == (tmpName[0] + '_array')){
                        
                            var valueTmp = value.value.split(',');// alert(valueTmp);
                            for(var loopTmp = 0; loopTmp < valueTmp.length; loopTmp++){
                                
                                xAxisData.push(loopTmp + 1); 
                                
                                var dataTmp = new Object();
                                dataTmp.y = accDiv(Math.round(accMul(valueTmp[loopTmp], 1000)), 1000);
                                dataTmp.color = colors[loopTmp % 9];

                                yAxisData.push(dataTmp);
                            }
                            
                            return false;
                        }                        
                    });

                    te1(xAxisData, tmpName[1], '', '', yAxisData, 'container');//alert(xAxisData + '----' + yAxisData);
                } 
              
            var xbJson;
            function createzqdqGr2(){
                zqdq2=new dhtmlXGridObject('zqdq2');
				zqdq2.setImagePath("js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				zqdq2.setHeader(["谐波"]);
				zqdq2.setInitWidths("*");
				zqdq2.setColAlign("left");
				zqdq2.setColTypes("ro");
				zqdq2.init();
				// 获得电量信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupbydate',
                    data:{code:'${info.code}',group:'DIAN_XB',date:datePar},
                    dateType:'json',
                    success: function(json){

                        xbJson = json;
                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            if(value.key.indexOf("_array") < 0){
                                
                            
                            var dataItem = new Object();
                                dataItem.id = value.key + '||' + value.name + '||DIAN_XB';
                                dataItem.data = [];
                                dataItem.data.push(value.name + '：' + value.value);

                                dataInfo.rows.push(dataItem);
                                }
                        });

                        zqdq2.parse(dataInfo,'json');
                    }
                });
                
                // 事件绑定
                zqdq2.attachEvent('onRowSelect', doFzZzGrClick); 
            }
           function createwind(){
                        dhxd = new dhtmlXWindows();
                        dhxd.attachViewportTo(document.body);
                        dhxd.createWindow("wi",1000,200,200,180);
                        dhxd.window("wi").button('minmax2').hide();
                        dhxd.window("wi").button('minmax1').hide();
                        dhxd.window("wi").button('park').hide();
                        dhxd.window("wi").hide();
                }
            function createwind1(){
                    dhxd1 = new dhtmlXWindows();
                    dhxd1.attachViewportTo(document.body);
                    dhxd1.createWindow("wi1",1000,200,180,70);
                    dhxd1.window("wi1").button('minmax2').hide();
                    dhxd1.window("wi1").button('minmax1').hide();
                    dhxd1.window("wi1").button('park').hide();
                    dhxd1.window("wi1").hide();
                    }
            function createwind2(){
                    dhxd2= new dhtmlXWindows();
                    dhxd2.attachViewportTo(document.body);
                    dhxd2.createWindow("wi2",1000,200,180,100);
                    dhxd2.window("wi2").button('minmax2').hide();
                    dhxd2.window("wi2").button('minmax1').hide();
                    dhxd2.window("wi2").button('park').hide();
                    dhxd2.window("wi2").hide();
                    }
            function createwi(){
                    dhxd3= new dhtmlXWindows();
                    dhxd3.attachViewportTo(document.body);
                    dhxd3.createWindow("wi3",872,173,400,130);
                    dhxd3.window("wi3").button('minmax2').hide();
                    dhxd3.window("wi3").button('minmax1').hide();
                    dhxd3.window("wi3").button('park').hide();
                    dhxd3.window("wi3").hide();
                    }
            function yckz(){
                     dhxd.window("wi").show();
                     dhxd.window("wi").setText("远程控制");
                     dhxd.attachEvent("onClose", function(win){
                     dhxd.window("wi").hide(); 
                                             });
                     dhxd.window("wi").attachHTMLString(ew);
                    }
            function yctc(){
                     dhxd.window("wi").show();
                     dhxd.window("wi").setText("远程调参");
                     dhxd.attachEvent("onClose", function(win){
                     dhxd.window("wi").hide(); 
                                             });
                     dhxd.window("wi").attachHTMLString(yt);
                    }
            function qd(){
                     dhxd.window("wi").hide();
                     dhxd1.window("wi1").show();
                     dhxd1.window("wi1").setText("远程控制");
                     dhxd1.attachEvent("onClose", function(win){
                     dhxd1.window("wi1").hide(); 
                                             });
                     dhxd1.window("wi1").attachHTMLString(anniu);
                    }
            function qx(){
                    dhxd.window("wi").hide();
                    }
            function qd1(){
                     dhxd.window("wi").hide();
                     dhxd1.window("wi1").show();
                     dhxd1.window("wi1").setText("远程调参");
                     dhxd1.attachEvent("onClose", function(win){
                     dhxd1.window("wi1").hide(); 
                                             });
                     dhxd1.window("wi1").attachHTMLString(yc);
                    }
            function qx1(){
                    dhxd.window("wi").hide();
                    }
            function kj(){
                    dhxd1.window("wi1").hide();
                    dhxd2.window("wi2").show();
                    dhxd2.window("wi2").setText("远程控制");
                    dhxd2.attachEvent("onClose", function(win){
                    dhxd2.window("wi2").hide(); 
                                             });
                    dhxd2.window("wi2").attachHTMLString(sd);
                    }
            function tc(){
                    dhxd1.window("wi1").hide();
                    dhxd3.window("wi3").show();
                    dhxd3.window("wi3").setText("远程调参");
                    dhxd3.attachEvent("onClose", function(win){
                    dhxd3.window("wi3").hide(); 
                                             });
                    dhxd3.window("wi3").attachHTMLString(ytc);
                    }
            function tj(){
                    dhxd1.window("wi1").hide();
                    }
            function qdd(){
                    dhxd2.window("wi2").hide();
                    }
            function qxx(){
                    dhxd2.window("wi2").hide();
                    }
            function qd2(){
                    dhxd3.window("wi3").hide();
                    }
            function qx2(){
                    dhxd3.window("wi3").hide();
                    }
            function createWindows(){
                    dhxWins = new dhtmlXWindows();
                    dhxWins.attachViewportTo(document.body);
                    dhxWins.createWindow("win",200,100,1000,500);
                    dhxWins.window("win").button('minmax2').hide();
                    dhxWins.window("win").button('minmax1').hide();
                    dhxWins.window("win").button('park').hide();
                    dhxWins.window("win").hide();	
                    }
            function createWindows1(){
                    dhxWins1 = new dhtmlXWindows();
                    dhxWins1.attachViewportTo(document.body);
                    dhxWins1.createWindow("win1",600,150,400,130);
                    dhxWins1.window("win1").button('minmax2').hide();
                    dhxWins1.window("win1").button('minmax1').hide();
                    dhxWins1.window("win1").button('park').hide();
                    dhxWins1.window("win1").hide();	
                    }
            function ztwin(){
                     dhxWins.window("win").show();
                     dhxWins.window("win").setText("工况");
                     dhxWins.attachEvent("onClose", function(win){
                     dhxWins.window("win").hide(); 
                                             });
                     dhxWins.window("win").attachHTMLString(dtu);
                    }
            function cbb(){
                     dhxWins1.window("win1").show();
                     dhxWins1.window("win1").setText("B相电压0～31次谐波");
                                        dhxWins1.attachEvent("onClose", function(win){
                                            dhxWins1.window("win1").hide(); 
                                             });
                     dhxWins1.window("win1").attachHTMLString(xb);
                    }
        </script>
        <STYLE type=text/css>
            div.objbox { 
                SCROLLBAR-FACE-COLOR: #FFFFFF ; 
                SCROLLBAR-HIGHLIGHT-COLOR: #FFDFFF; 
                SCROLLBAR-SHADOW-COLOR: #FFDFFF; 
                SCROLLBAR-3DLIGHT-COLOR: #FFDFFF; 
                SCROLLBAR-ARROW-COLOR: #FFDFFF; 
                SCROLLBAR-TRACK-COLOR: #FFFFFF;
                SCROLLBAR-DARKSHADOW-COLOR: #FFDFFF
            }
            a:hover{
                color:#09F
            }
            .cssdiv:hover{
                color:#09F
            }
        </STYLE>
    </head>
    <body onload="zp();">
        <!--主界面-->
        <div id="zz" style="width:3845px; height:717px;border:solid; border-color:#000; border-width:1px">
        <!--数据-->
        <div id="ssjcm" style="width:1280px; height:69px;  float:left; font-size: 0 " >
                <%@ include file="ssjcCommon.jsp"%> 
                <!--浮上-->
                <div id="apDiv1" style=" background-color: black;">
                    <div id="ad" style="width:70px; height:10; float:left; font-size:14px; background-color:#cde7ff; font-weight:bold; line-height:25px">
                         &nbsp;&nbsp;&nbsp;井标识
                    </div>
                    <div id="ad2" style="width:350px; height:10;float:left;  background-color:#cde7ff; font-size:14px;line-height:25px">
                            运行 &nbsp;&nbsp;<img src="${ctx}/static/img/lse.png" />&nbsp;&nbsp;故障停井&nbsp;&nbsp;<img src="${ctx}/static/img/hongse.png" />&nbsp;&nbsp;非正常停井&nbsp;&nbsp;<img src="${ctx}/static/img/zise.png" />&nbsp;&nbsp;计划停井&nbsp;&nbsp;<img src="${ctx}/static/img/juse.png" />
                    </div>
                     <div id="ads" style="width:80px; height:10; float:left; background-color:#cde7ff;  font-size:14px; font-weight:bold; line-height:25px">
                            &nbsp;&nbsp;&nbsp;RTU标识
                    </div>
                     <div id="adr" style="width:600px; height:10;float:left;  background-color:#cde7ff; font-size:14px;line-height:25px">
                            运行 &nbsp;&nbsp;<img src="${ctx}/static/img/lse.png" />&nbsp;&nbsp;故障&nbsp;&nbsp;<img src="${ctx}/static/img/hongse.png" />&nbsp;&nbsp;校验&nbsp;&nbsp;<img src="${ctx}/static/img/lansee.png" />
                    </div>
                    <div id="adw" style="width:20px; height:22px; float:left;  background-color:#cde7ff; font-size:14px; font-weight:bold;padding-top:3px">
                            <img src="${ctx}/static/img/yck.png"/>
                    </div>
                    <div id="adq" style="width:80px; height:25px; float:left; background-color:#cde7ff;  font-size:14px; font-weight:bold; line-height:23px">
                            <a style="cursor:hand"onclick="yckz();">远程控制</a>
                    </div>
                     <div id="adt" style="width:20px; height:22px; float:left; font-size:14px;  background-color:#cde7ff; font-weight:bold;padding-top:3px">
                           <img src="${ctx}/static/img/yct.png"/>
                    </div>
                    <div id="ady" style="width:60px; height:25px; float:left; font-size:14px; background-color:#cde7ff;  font-weight:bold; line-height:23px">
                           <a style="cursor:hand"onclick="yctc();"> 远程调参</a>
                    </div>
                </div>
    <!--标签页 监测信息-->
      <div id="ba" style="width:1280px; height:5px;float:left" ></div>
    <div id="ba1" style="width:4px; height:22px;float:left" ></div>
     <div id="gk1" style="width:366px; height:174px;font-size:14px;line-height:25px;border:solid; border-color:#FFBC6C; border-width:1px;  float:left">
        <div id="gk1" style="width:366px; height:22px;font-size:14px;line-height:25px; font-weight:bold; background-color:#FFE0BB; float:left">
         &nbsp工&nbsp;&nbsp;&nbsp况
        </div>
        <div id="gkk" style="width:248px; height:152px; float:left ">
           <a  ondblclick="ztwin();" style="cursor:hand;text-decoration:none"><img src="${ctx}/static/img/djgyt22.jpg"  style="width:100%; height:151px" /></a>
        </div>
        <div id="gkk1" style="width:110px;height:153px;  float:left">
      		<div id="tb" style="width:118px; height:35px;float:left; font-size:14px; line-height:40px">
              &nbsp;&nbsp;&nbsp;油井启停：<img src="${ctx}/static/img/hongse.png" style="height:15px"/>
            </div>
            <div id="zq" style="width:118px; height:107px; float:left">
            </div>
     	 </div>
     </div>
     <div id="b" style="width:5px; height:176px;float:left"></div>
     <div id="gk2" style="width:895px;font-size:14px;line-height:25px;border:solid; border-width:1px; border-color:#e6d5ff; font-weight:bold; height:174px;float:left">
         <div id="gk2" style="width:895px;font-size:14px;line-height:25px;border:solid; border-width:1px; border-color:#e6d5ff; font-weight:bold; height:22px; background-color:#e6d5ff; float:left">
         &nbsp注&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
        </div>
        <div id="dqcs" style="width:895px; height:150px;border:solid; border-width:1px; border-color:#e6d5ff;float:left">
         </div>
    </div>
    <div id="s" style="width:5px; height:177px;float:left"></div>
    <div id="xia" style="width:1280px; height:5px; float:left"></div>
    <div id="xi" style="width:5px; height:21px; float:left"></div>
    <div id="jdm1" style="width:1269px; height:10;top: 10; background-color:#fdb4fd; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#fdb4fd; float:left">
          &nbsp电&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
    </div>
    <div id="xi" style="width:5px; height:140px;float:left"></div>
            <div id="cs" style="width:1268px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">
           	 <div id="zqdq" style="width:420px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">        		 </div>
                 <div id="zqdq1" style="width:420px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">         		 </div>
                 <div id="zqdq2" style="width:422px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">
                 </div>
            </div>
            <div id="xi1" style="width:5px; height:140px;float:left"></div>
            <div id="xi2" style="width:1280px; height:5px;float:left"></div>
            <div id="xi3" style="width:5px; height:190px;float:left"></div>
            <div id="dqcsqx1" style=" width:1269px; height:185px;float:left;; border:solid; border-width:1px; border-color:#cced94;">
            <div id="dqcsqx" style=" width:1269px; height:20px; font-size:14px; background-color:#9fdfae; font-weight:bold;float:left">
            &nbsp;实&nbsp;&nbsp;&nbsp时&nbsp;&nbsp;&nbsp曲&nbsp;&nbsp;&nbsp线
            <span id="ssqxTitle"></span>
            </div>
            <div id="dqcsqxt" style=" width:1268px; height:165px; border-style:solid; border-color:#9fdfae; border-width:1px;  float:left" >
    			<div id="div1" style="width:100%;height:100%;">
                    <div id="container" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                </div>
                <div id="div2" style="width:100%;height:100%; display:none ">
                    <div id="container1" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                </div>
                <div id="div4" style="width:100%;height:100%; display:none ">
                    <div id="container1122" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                </div>
                <div id="container2" style="display:none;"></div>
    		</div>
            </div>
</div>
<!--地图-->
<div id="dt" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;" >
	<img src="${ctx}/static/img/ditu.jpg"  style="width:1280px;height:716px;"/>
</div>
<!--视频-->
<div id="sp" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;" >
<img src="${ctx}/static/img/sp.png"  style="width:1280px;height:716px;"/>
</div>
</div>
<div id="yin" >
<img border="0"  src="imagess/1.png" />
</div>
<div id="yin1" >
 <a href="ssjczq.html" ><img border="0"  src="${ctx}/static/img/3.png" /></a>
</div>
<div id="yin2" >
 <a href="ssjczp.html"><img border="0" src="${ctx}/static/img/3.png" /></a>
</div>
<div id="yin3" >
 <a href="ssjcyg.html"><img border="0" src="${ctx}/static/img/9.png" /></a>
</div>
<div id="yin4" >
 <a href="ssjclxg.html"><img border="0" src="${ctx}/static/img/5.png" /></a>
</div>
<div id="yin5" >
 <a href="ssjcmj.html"><img border="0" src="${ctx}/static/img/3.png" /></a>
</div>
<div id="yin6" >
 <a href="ssjcdqb.html"><img border="0" src="${ctx}/static/img/4.png" /></a>
</div>
<div id="yin12" >
 <a href="ssjcmain.html"><img border="0" src="${ctx}/static/img/3.png" /></a>
</div>
    </body>
</html>

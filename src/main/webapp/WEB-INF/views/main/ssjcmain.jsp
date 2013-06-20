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
        <script src="${ctx}/static/js/chart1.js"></script>
        <script src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
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
            #apDiv1 {
                position:absolute;
                left:207px;
                top:146px;
                width:1075px;
                height:27px;
                z-index:1;
            }
        </style>
        <script>
            var dhxWins,dhxWins1,dhxWins2,dhxd,dhxd1,dhxd2,dhxd3,dhxd4,dhxTabbar,dhLayout,lo,lc,ld,lh,Grid,Grid2,Grid3,gr,Gr,Grxn,dqgr,dqgr1,dqgr2;
            var dtu ='<div id="dt" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/djgyt22.jpg"  style="width:100%; height:100%"></img></div>';
            var dtu1='<div id="dt1" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/sgt.png"  style="width:100%; height:100%" /></div>';
            var dtu2='<div id="dt2" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/dlt.png"  style="width:100%; height:100%" /></div>';
            var dtu3='<div id="dt3" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/dgt.png"  style="width:100%; height:100%" /></div>';
            var dtu4='<div id="dt4" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/yggl.png"  style="width:100%; height:100%" /></div>';
            var xb='<div id="gtc"  style="width:100%;height:100%;border-style:groove; border-width:1px;float:left" ><table><tr><td  style="width:250px" align="center">B相电压5次谐波:0.1</td><td  style="width:250px" align="center">B相电压7次谐波:0.2</td></tr><tr><td  style=" width:250px" align="center">B相电压11次谐波:0.3</td><td  style="width:250px" align="center">B相电压13次谐波:0.4</td></tr><tr><td  style="width:250px" align="center">B相电压17次谐波:0.5</td><td  style="width:250px" align="center">B相电压19次谐波:0.6</td></tr></table></div>';

            var ew='<div id="y" style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="摄像头"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx();">取消</button><td></tr></table></div>';
            var anniu='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="kj();">开井</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">停井</button><td></tr></table></div>';
            var sd='<div id="y"style="width:180px;height:30px;float:left;"><table><tr><td style="width:250px" align="center">油井状态:开井</td></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qdd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qxx();">取消</button><td></tr></table></div>';
            var yt='<div id="y"style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="参数改变"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd1();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx1();">取消</button><td></tr></table></div>';
            var yc='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tc();">调参</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">取消</button><td></tr></table></div>';
            var ytc='<div id="y"style="width:380px;height:60px;float:left"><table border="0" width="100%"><tr><td style="width:150px; " align="left">上行冲程(m)：<input name="" type="text" value="4" style="width:20px;"/></td><td style="width:150px; " align="left">上行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2.1" style="width:20px;"/></td></tr><tr><td style="width:150px; ba" align="left">下行冲程(m)：<input name="" type="text" value="3.9" style="width:20px;"/></td><td style="width:150px; " align="left">下行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2" style="width:20px;"/></td></tr></table></div><div id="k" style="width:100%;height:60px;float:left"><table width="100%"><tr><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qd2();">确定</button><td><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qx2();">取消</button><td></tr></table></div>';

            var gtdb='<div id="y"style="width:500px;height:30px;float:left;font-size:14px;"><table><tr><td  style="width:350px" align="left">&nbsp;&nbsp;&nbsp;日期:&nbsp;<input id="gtStart" type="text" onClick="WdatePicker({readOnly:true,dateFmt:\'yyyy/MM/dd HH时\'})" style="width:100px;"/>～<input id="gtEnd" type="text" onClick="WdatePicker({readOnly:true,dateFmt:\'yyyy/MM/dd HH时\'})" style="width:100px;"/>&nbsp;<button type="button" style="background:#81d4ff" onclick="run2();">查询</button></td></tr></table></div>';
            
            var objUrl='${ctx}';
            var username='${username}';
             
            /**
             * 页面初始化
             * @returns {undefined}
             */
            function ss(){
                
                // 页面布局设置
                createTabble();
                // 设置工况信息
                createGr();
                // 设置RTU状态
                createGt();
                // 设置电气参数
                createDq();
                // 设置传感器运行信息
                createGrid();
                // 设置传感器设备信息
                createCgqGrid();
                // 设置井基本信息
                createXinxi();
                
                // 示功图
                createSg('${info.code}');
                // 电流曲线
                createDl('${info.code}');
                // 电功图
                createDg('${info.code}');
                // 有功功率曲线
                createYggl('${info.code}');
                // 功图对比查询框生成
                createWin();
                // 电气参数（电力）
                createdqGr();
                // 电气参数（电量）
                createdqGr2();
                // 电气参数（谐波）
                createdqGr3();
                // 抽油杆信息窗体
                createWindow();
                
//                createWindows1();
//                createWindows();
//                createwind();
//                createwind1();
//                createwind2();
//                createwi();                
            }
            
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doFzGrClick(gr_rId, gr_cInd){
                    
                    var tmpName = gr_rId.split('||');
                    $("#dqqxTitle").html('&nbsp&nbsp&nbsp（' + tmpName[1] + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:'YOU_JING',varName:tmpName[0]},
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
                            te(xAxisData, tmpName[1], '', ys, yAxisData, 'container2');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
                }  
                
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doFzGrClick(gr_rId, gr_cInd){
                    
                    var tmpName = gr_rId.split('||');
                    $("#dqqxTitle").html('&nbsp&nbsp&nbsp（' + tmpName[1] + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:'YOU_JING',varName:tmpName[0]},
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
                            te(xAxisData, tmpName[1], '', ys, yAxisData, 'container2');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
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
                                dataTmp.y = Number(valueTmp[loopTmp]);
                                dataTmp.color = colors[loopTmp];

                                yAxisData.push(dataTmp);
                            }
                            
                            return false;
                        }                        
                    });

                    var ys;
                    if(j > 2){
                        j = 0;
                    }
                    ys = yse[j];	
                    te1(xAxisData, tmpName[1], '', ys, yAxisData, 'container2');//alert(xAxisData + '----' + yAxisData);
                    j += 1;
                }  
            /**
             * 电气参数（谐波）
             * @returns {undefined}
             */
            function createdqGr(){
                dqgr=new dhtmlXGridObject('cs1');
				dqgr.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				dqgr.setHeader(["电力"]);
				dqgr.setInitWidths("*");
				dqgr.setColAlign("left");
				dqgr.setColTypes("ro");
				dqgr.init();
				// 获得电力信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'DIAN_YC'},
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

                        dqgr.parse(dataInfo,'json');                        
                        
                        if(dqgr.getRowsNum() > 0){
                            
                            doFzGrClick(dqgr.getRowId(0), 0);
                        }
                    }
                });                        
                 
                // 事件绑定
                dqgr.attachEvent('onRowSelect', doFzGrClick); 
            }
            
            /**
            * 电气参数（电量）
             */
            function createdqGr2(){
                dqgr1=new dhtmlXGridObject('cs2');
				dqgr1.setImagePath("js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				dqgr1.setHeader(["电量"]);
				dqgr1.setInitWidths("*");
				dqgr1.setColAlign("left");
				dqgr1.setColTypes("ro");
				dqgr1.init();
				// 获得电量信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'DIAN_YM'},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            var dataItem = new Object();
                                dataItem.id = value.key + '||' + value.name + '||DIAN_YM';
                                dataItem.data = [];
                                dataItem.data.push(value.name + '：' + value.value);

                                dataInfo.rows.push(dataItem);
                        });

                        dqgr1.parse(dataInfo,'json');
                    }
                });                        
                 
                // 事件绑定
                dqgr1.attachEvent('onRowSelect', doFzGrClick); 
            }
            
            var xbJson;
            /**
            * 电气参数（谐波）
            * @returns {undefined}             
            * */
            function createdqGr3(){
                dqgr2=new dhtmlXGridObject('cs3');
				dqgr2.setImagePath("js/gridcodebase/imgs/");
				//dqgr.setNoHeader(true);//隐藏表头
				dqgr2.setHeader(["谐波"]);
				dqgr2.setInitWidths("*");
				dqgr2.setColAlign("left");
				dqgr2.setColTypes("ro");
				dqgr2.init();
				// 获得电量信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'DIAN_XB'},
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

                        dqgr2.parse(dataInfo,'json');
                    }
                });
                
                // 事件绑定
                dqgr2.attachEvent('onRowSelect', doFzZzGrClick); 
            }
            /**
             * 页面布局设置
             * @returns {undefined}
             */
            function createTabble(){
                dhxTabbar=new dhtmlXTabBar('tabbl');
                dhxTabbar.setImagePath("${ctx}/static/dhtmlx/imgs/");
                dhxTabbar.addTab("tab1", "监测信息", "100px");
                dhxTabbar.addTab("tab2", "辅助信息", "100px");
                dhxTabbar.setTabActive("tab1");
                dhxTabbar.cells("tab1").attachObject("gk");
                dhxTabbar.cells("tab2").attachObject("fz");
            }
            var yse=['black','blue'];
            var j=0;
            var dyDate= [0.57,0.52,0.56,0.59,0.55,0.6,0.57,0.5,0.57,0.55,0.6,0.52,0.57,0.5,0.5,0.56,0.59,0.53,0.58,0.56,0.54,0.6,0.51,0.59,0.55,0.51,0.59,0.52,0.58,0.54,0.59,0.52,0.51,0.57,0.53,0.54,0.58,0.5,0.53,0.53,0.59,0.57,0.56,0.51,0.54,0.6,0.51,0.6,0.52,0.53,0.58,0.53,0.51,0.59,0.59,0.6,0.54,0.57,0.51,0.51,0.58,0.55,0.6,0.6,0.6,0.58,0.59,0.55,0.52,0.56,0.52,0.53,0.59,0.54,0.55,0.58,0.55,0.5,0.6,0.55,0.57,0.57,0.51,0.51,0.51,0.59,0.59,0.53,0.54,0.54,0.54,0.6,0.6,0.5,0.59,0.53,0.58,0.5,0.53,0.55,0.59,0.59,0.53,0.54,0.56,0.51,0.53,0.59,0.56,0.5,0.51,0.57,0.6,0.55,0.57,0.5,0.53,0.54,0.54,0.57,0.54,0.58,0.58,0.59,0.54,0.57,0.52,0.6,0.55,0.5,0.56,0.55,0.52,0.55,0.57,0.55,0.59,0.52,0.56,0.6,0.51,0.6,0.54,0.6,0.59,0.53,0.52,0.51,0.54,0.52,0.52,0.57,0.58,0.54,0.58,0.59,0.51,0.52,0.53,0.53,0.54,0.5,0.58,0.59,0.58,0.54,0.54,0.53,0.59,0.55,0.6,0.58,0.51,0.51,0.56,0.57,0.55,0.57,0.6,0.51,0.51,0.55,0.5,0.55,0.54,0.52,0.6,0.53,0.59,0.6,0.59,0.58,0.54,0.6,0.55,0.56,0.5,0.52,0.57,0.57,0.51,0.55,0.51,0.53,0.57,0.56,0.6,0.54,0.56,0.55,0.51,0.51,0.51,0.52,0.51,0.52,0.59,0.54,0.54,0.57,0.51,0.59,0.6,0.58,0.53,0.56,0.53,0.5,0.53,0.53,0.58,0.51,0.54,0.53,0.51,0.6,0.58,0.5,0.52,0.56,0.52,0.5,0.56,0.52,0.52,0.53,0.53,0.55,0.56,0.5,0.54,0.52,0.6,0.56,0.57,0.56,0.53,0.53,0.55,0.51,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null];
            
             /**
              * 电气参数信息点击
              * @param {type} dy_code
              * @param {type} dy_title
              * @returns {undefined}
              */
            function showDyqx(dy_code, dy_title){
                            
                    $("#ssqx4").css("display","block");
                    $("#gtdb").css("display","none");
//                    $("#container").html('');
                    $("#ssqxTitle").html('&nbsp&nbsp&nbsp（' + dy_title + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:'DIAN_YC',varName:dy_code},
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
                            te(xAxisData, dy_title, '', ys, yAxisData, 'container');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
                }
                
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doGrClick(gr_rId, gr_cInd){
                    $("#ssqx4").css("display","block");
					$("#gtdb").css("display","none");
                    
                    var tmpName = gr_rId.split('||');
                    $("#ssqxTitle").html('&nbsp&nbsp&nbsp（' + tmpName[1] + '曲线）');
                    // 获得工况信息
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}/realtime/linedata',
                        data:{code:'${info.code}',group:tmpName[2],varName:tmpName[0]},
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
             * 设置工况信息
             * @returns {undefined}
             */
            function createGr(){
                
                gr=new dhtmlXGridObject('yk');
                gr.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                gr.setNoHeader(true);               // 隐藏表头
                gr.setHeader(["序号"]);
                gr.setInitWidths("100");
                gr.setColAlign("left");
                gr.setColTypes("ro");
                gr.init();                        
                        
                // 获得工况信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'YOU_JING'},
                    dateType:'json',
                    success: function(json){

                        var youjingData = new Object();
                        youjingData.rows = [];

                        $.each(json,function(key, value){

                            if(value.key == 'qi_ting_zhuang_tai'){
                                if(value.value == '0'){
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
                
            /**
             * 设置RTU状态
             * @returns {undefined}
             */
            function createGt(){
                
                Gr=new dhtmlXGridObject('rtu');
                Gr.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Gr.setNoHeader(true);                   // 隐藏表头
                Gr.setHeader(["序号","名称"]);
                Gr.setInitWidths("129,*");
                Gr.setColAlign("left,center");
                Gr.setColTypes("ro,img");
                Gr.init();
                
                // 获得RTU状态信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'RTU_ZHUANG_TAI'},
                    dateType:'json',
                    success: function(json){

                        var youjingData = new Object();
                        youjingData.rows = [];

                        $.each(json,function(key, value){

                            var youjingItem = new Object();
                            youjingItem.id = value.key + '||' + value.name + '||RTU_ZHUANG_TAI';
                            youjingItem.data = [];
                            youjingItem.data.push(value.name);
                            
                            if(value.value == '0'){
                                youjingItem.data.push('${ctx}/static/img/hongse.png');
                            }else{
                                youjingItem.data.push('${ctx}/static/img/lse.png');
                            }

                                youjingData.rows.push(youjingItem);
                        });

                        Gr.parse(youjingData,'json');
                    }
                });  
                   
                // 事件绑定
                Gr.attachEvent('onRowSelect', doGrClick);
            }
            
            // 电气参数标题项目
            var strDqTitle = ',u_a,u_b,u_c,i_a,i_b,i_c,gl_ys,';
            /**
             * 设置电气参数
             * @returns {undefined}
             */
            function createDq(){

                // 获得电气参数信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/groupinfo',
                    data:{code:'${info.code}',group:'DIAN_YC'},
                    dateType:'json',
                    success: function(json){

                        $.each(json,function(key, value){

                            if(strDqTitle.indexOf(',' + value.key + ',') >= 0){
                                        
                                $("#dq_" + value.key).html(value.value);
                            }
                        });
                    }
                });
            }
            
            /**
            * 设置传感器运行信息
            * @returns {undefined}             
            * */
            function createGrid(){
                Grid= new dhtmlXGridObject('cgqyx2');
                Grid.setImagePath("js/gridcodebase/imgs/");
                Grid.setHeader(["传感器名","通讯状态","运行时间","剩余工作时间","剩余电量","标定"]);
                Grid.setInitWidths("158,158,158,120,120,120");
                Grid.setColAlign("center,center,center,center,center,center");
                Grid.setColTypes("ro,ro,ro,ro,ro,img");
                Grid.init();
            
                // 获得传感器运行信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/sensor',
                    data:{code:'${info.code}'},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            var dataItem = new Object();
                            dataItem.id = value.nickname;
                            dataItem.data = [];
                            dataItem.data.push(value.sensorname);
                            dataItem.data.push(value.cgq_rtu_status);                                    
                            dataItem.data.push(value.cgq_rtu_time);
                            dataItem.data.push(value.cgq_remained_time);
                            dataItem.data.push(value.cgq_remained_dianliang);                                    
                                    
                            if(value.cgq_rtu_status == '0'){
                                dataItem.data.push('${ctx}/static/img/hongse.png');
                            }else{
                                dataItem.data.push('${ctx}/static/img/lse.png');
                            }

                            dataInfo.rows.push(dataItem);
                        });

                        Grid.parse(dataInfo,'json');
                    }
                });
            }
            
            /**
            * 设置传感器设备信息
            * @returns {undefined}             
            * */
            function createCgqGrid(){
            
                Grid2= new dhtmlXGridObject('gr');
                Grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid2.setHeader(["设备名称","出厂厂家","型号","序号","设备地址"]);
                Grid2.setInitWidths("120,150,120,120,*");
                Grid2.setColAlign("center,center,center,center,center");
                Grid2.setColTypes("ro,ro,ro,ro,ro");
                Grid2.init();
            
                // 获得传感器设备信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/sensordevice',
                    data:{code:'${info.code}'},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];

                        $.each(json,function(key, value){

                            var dataItem = new Object();
                            dataItem.id = value.id;
                            dataItem.data = [];
                            dataItem.data.push(value.name);
                            dataItem.data.push(value.manufacture);                                    
                            dataItem.data.push(value.type);
                            dataItem.data.push(value.number);
                            dataItem.data.push(value.address); 

                            dataInfo.rows.push(dataItem);
                        });

                        Grid2.parse(dataInfo,'json');
                    }
                });
            }
            
            /**
            * 设置井基本信息
            * @returns {undefined}             
            * */
            function createXinxi(){
                Grxn=new dhtmlXGridObject('jjb');
                Grxn.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grxn.setNoHeader(true);//隐藏表头
                Grxn.setHeader(["序号","名称"]);
                Grxn.setInitWidths("315,*");
                Grxn.setColAlign("left,left");
                Grxn.setColTypes("ro,ro");
                Grxn.init();
                
                // 获得井基本信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/etinfo',
                    data:{code:'${info.code}'},
                    dateType:'json',
                    success: function(json){

                        var loopId = 0;
                        var dataInfo = new Object();
                        dataInfo.rows = [];
                        
                        var dataItem;
                        
                        $.each(json,function(key, value){

                            loopId += 1;
                            if((loopId + 1) % 2 == 0){
                                
                                dataItem = new Object();
                                dataItem.id = loopId;
                                dataItem.data = [];
                            }
                            dataItem.data.push(key + ":" + value);  
                            
                            if(loopId % 2 == 0){
                                dataInfo.rows.push(dataItem);
                            }
                        });
                        
                        if((loopId + 1) % 2 == 0){
                            dataInfo.rows.push(dataItem);
                        }
                        
                        Grxn.parse(dataInfo,'json');
                    }
                });
            }
            
            /**
            * 即时功能读取
            * @returns {undefined}             
            * */
            function run1(){
                // 示功图
                createSg('${info.code}');
                // 电流曲线
                createDl('${info.code}');
                // 电功图
                createDg('${info.code}');
                // 有功功率曲线
                createYggl('${info.code}');
            }
            
            /**
             * 功图对比查询框生成
             * @returns {undefined}
             */
            function createWin(){
                dhxd4 = new dhtmlXWindows();
                dhxd4.attachViewportTo(document.body);
                dhxd4.createWindow("wa",800,200,350,65);
                dhxd4.window("wa").button('minmax2').hide();
                dhxd4.window("wa").button('minmax1').hide();
                dhxd4.window("wa").button('park').hide();
                dhxd4.window("wa").hide();
            }
            
            /**
             * 功图对比查询显示
             * @returns {undefined}
             */
            function sj(){
                dhxd4.window("wa").show();
                dhxd4.window("wa").setText("功图对比");
                dhxd4.attachEvent("onClose", function(win){
                    dhxd4.window("wa").hide(); 
                });
                dhxd4.window("wa").attachHTMLString(gtdb);
            }
      
            // 示功图
            var options1 = {
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
             * 功图对比查询
             * @returns {undefined}
             */
            function run2(){
                
                if($("#gtStart").val() == ''){
                    alert('请选择查询开始日期！');
                    return;
                }else if($("#gtEnd").val() == ''){
                    alert('请选择查询截至日期！');
                    return;
                }
                
                
                var startDate = new Date($("#gtStart").val().replace("时", "") + ':00:00');
                var endDate = new Date($("#gtEnd").val().replace("时", "") + ':00:00');
                
                if(endDate < startDate){
                    alert('截至查询日期不能小于开始查询日期，请重新选择！');
                    return;
                }else if(parseInt(Math.abs(endDate - startDate)/1000/60/60) > 24){
                    alert('查询日期相差不能大于24小时，请重新选择！');
                    return;
                }
                
                // 获得井基本信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/arraywelldata',
                    data:{code:'${info.code}', startDate:$("#gtStart").val().replace("时", "") + ':00', endDate:$("#gtEnd").val().replace("时", "") + ':00'},
                    dateType:'json',
                    success: function(json){
                        // 载荷，示功图纵坐标
                        var str_xAxis = [];
                        // 位移，示功图横坐标
                        var str_yAxis = [];
                        
                        $("#gtdb").html('');                        
                        $("#ssqxTitle").html('&nbsp&nbsp&nbsp（功图对比）');
                        $.each(json, function(key, value) {   
                            
                            $("#gtdb").append("<div id='container_gtdb_" + key + "' style='width: 155px; height: 100%; margin: 0 auto; float:left;'></div>");

                            var series = { 
                                data: []            
                            };  
                            
                            str_xAxis = value.zaihe;
                            str_yAxis = value.weiyi;
                            
                            options1.series = [];
                            series.name = '示功图';
                            series.unit = 'm';
                            for (var i=0; i<str_xAxis.length; i++){

                                series.data.push([str_xAxis[i],str_yAxis[i]]);
                            }
                            options1.chart.renderTo = 'container_gtdb_' + key;
                            options1.yAxis.title.text = '示&nbsp;&nbsp;功&nbsp;&nbsp;图';
                            options1.series.push(series);
                            new Highcharts.Chart(options1);                              
                        }); 
                    }
                });
                
                $("#ssqx4").css("display","none");
                $("#gtdb").css("display","block");
                dhxd4.window("wa").hide(); 
            }

            /**
             * 功图曲线显示
             * @returns {undefined}
             */
            function showGtqx(p_gtParKey, p_gtParTitle){
                
                var dateNow = new Date();
                var dateBefore =  new Date(dateNow.getTime() - 1000 * 60 * 60);
                
                var startDate = dateBefore.getFullYear() + '/' + (dateBefore.getMonth() + 1) + '/' + dateBefore.getDate() + ' ' 
                        + dateBefore.getHours() + ':' + dateBefore.getMinutes();
                var endDate = dateNow.getFullYear() + '/' + (dateNow.getMonth() + 1) + '/' + dateNow.getDate() + ' ' 
                        + dateNow.getHours() + ':' + dateNow.getMinutes();
                
                // 获得井基本信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/arraywelldata',
                    data:{code:'${info.code}', startDate:startDate, endDate:endDate},
                    dateType:'json',
                    success: function(json){
                        // 横坐标
                        var str_xAxis = [];
                        // 纵坐标
                        var str_yAxis = [];
                        
                        $.each(json, function(key, value) {   
                            
                            str_xAxis.push(value[p_gtParKey]);
                                
                            var dateTmp = new Date(value.time)
                            str_yAxis.push(dateTmp.getHours() + ':' + dateTmp.getMinutes());
                        }); 
                        
                        var ys;
                        if(j > 2){
                            j = 0;
                        }
                        ys = yse[j];	//alert(str_xAxis + '----' + str_yAxis);
                        te(str_xAxis, p_gtParTitle, '', ys, str_yAxis, 'container');
                        j += 1;                           
                    }
                });
                      
                $("#ssqxTitle").html('&nbsp&nbsp&nbsp（' + p_gtParTitle + '）');
                $("#ssqx4").css("display","block");
                $("#gtdb").css("display","none");
            }
            
            /**
            * 抽油杆信息窗体

             * @returns {undefined}             */
            function createWindow(){
                dhxWins2 = new dhtmlXWindows();
                dhxWins2.attachViewportTo(document.body);
                dhxWins2.createWindow("win2",600,200,400,150);
                dhxWins2.window("win2").button('minmax2').hide();
                dhxWins2.window("win2").button('minmax1').hide();
                dhxWins2.window("win2").button('park').hide();
                dhxWins2.window("win2").hide();	
            }
            
            /**
             * 抽油杆受力分析
             * @returns {undefined}
             */
            function cyfslfx(){
                dhxWins2.window("win2").show();
                dhxWins2.window("win2").setText("抽油杆受力分析");
                dhxWins2.attachEvent("onClose", function(win){
                dhxWins2.window("win2").hide(); 
                             });
                Grid3=dhxWins2.window("win2").attachGrid();;
                Grid3.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid3.setHeader(["序号","杆级","最大载荷","最小载荷"]);
                Grid3.setInitWidths("70,100,100,*");
                Grid3.setColAlign("center,center,center,center");
                Grid3.setColTypes("ed,ed,ed,ed");
                Grid3.init();
                
                // 获得井基本信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/cygshouli',
                    data:{code:'${info.code}'},
                    dateType:'json',
                    success: function(json){

                        var dataInfo = new Object();
                        dataInfo.rows = [];
                        
                        var dataItem;
                        
                        $.each(json,function(key, value){

                            dataItem = new Object();
                            dataItem.id = key + 1;
                            dataItem.data = [];
                                
                            dataItem.data.push(key + 1);
                            dataItem.data.push(value.index);
                            dataItem.data.push(value.minZaihe);
                            dataItem.data.push(value.maxZaiHe);
                            
                            dataInfo.rows.push(dataItem);
                        });
                        
                        Grid3.parse(dataInfo,'json');
                    }
                });
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
            
            function wins(){
                dhxWins.window("win").show();
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

            function cbb(){
                dhxWins1.window("win1").show();
                dhxWins1.window("win1").setText("B相电压0～31次谐波");
                           dhxWins1.attachEvent("onClose", function(win){
                           dhxWins1.window("win1").hide(); 
                            });
                dhxWins1.window("win1").attachHTMLString(xb);
            }
            function ztwin(){
                 dhxWins.window("win").show();
                 dhxWins.window("win").setText("工况");
                 dhxWins.attachEvent("onClose", function(win){
                 dhxWins.window("win").hide(); 
                             });
                 dhxWins.window("win").attachHTMLString(dtu);
            }
            function qxa(i){
                $("#ssqx4").css("display","block");
                $("#gtdb").css("display","none");
                var dqcs= document.all("dq"+i).innerHTML; 
                var qname=dqcs.split('：');
                var dqname=qname[0];
                if(j>2){
                    j=0;
                    }
                var ys=yse[j];
                te(dyDate,dqname,"V",ys);
                j+=1;
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
    <body onload="ss();">
        <!--主界面-->
            <div id="zz" style="width:3845px; height:717px;border:solid; border-color:#000; border-width:1px">
                <!--数据-->
                <div id="ssjcm" style="width:1280px; height:69px;  float:left; font-size: 0 " >
                    <%@ include file="ssjcCommon.jsp"%> 
                    <!--标签页 监测信息-->
                    <div id="tabbl" style="width:1280px; height:570px; float:left" ></div>
                    <div id="gk" style="width:1280px; height:560px" >
                    <div id="ba" style="width:1280px; height:5px;  float:left" ></div>
                    <div id="baa" style="width:5px; height:22px;  float:left" ></div>
                    <div id="gk1" style="width:366px; height:22px;font-size:14px;line-height:25px; font-weight:bold; background-color:#FFE0BB; float:left">
                        &nbsp工&nbsp;&nbsp;&nbsp况
                    </div>
                    <div id="ba1" style="width:5px; height:22px; background-color:#FFF; float:left"></div>
                    <div id="gk2" style="width:260px;font-size:14px;line-height:25px; font-weight:bold; height:22px; background-color:#C6CEFD; float:left">
                        &nbspRTU&nbsp;&nbsp;&nbsp状&nbsp;&nbsp;&nbsp态
                    </div>
                    <div id="ba2" style="width:7px; height:22px; background-color:#FFF; float:left"></div>
                    <div id="gk3" style="width:632px;font-size:14px;line-height:25px; font-weight:bold; height:22px; background-color:#a9d3ff;float:left">
                        &nbsp功&nbsp;&nbsp;&nbsp图
                    </div>
                    <div id="bas" style="width:5px; height:22px;  float:left"></div>
                    <div id="wai" style="width:636px; height:365px; float:left">
                        <div id="ba4" style="width:5px; height:154px;  float:left"></div>
                            <div id="gk4" style="width:364px; height:152px; background-color:#FFF8EF;border:solid; border-color:#FFBC6C; border-width:1px; float:left">
                                <div id="gkk" style="width:245px; height:152px; float:left ">
                                    <a  ondblclick="ztwin();" style="cursor:hand;text-decoration:none"><img src="${ctx}/static/img/djgyt22.jpg"  style="width:100%; height:151px" /></a>
                                </div>          
                                <div id="gkk1" style="width:118px;height:153px; float:left">
                                    <div id="tb" style="width:118px; height:35px;float:left; font-size:14px; line-height:40px">
                                        &nbsp;&nbsp;&nbsp;油井启停：<img id="youjingState" src="${ctx}/static/img/hongse.png" style="height:15px"/>
                                    </div>
                                    <div id="yk" style="width:118px; height:107px; float:left"></div>
                                </div>
                            </div>
                            <!--RTU状态-->
                            <div id="ba5" style="width:5px; height:154px;  float:left"></div>
                            <div id="rtu" style="width:258px; height:152px; background-color:#000;border:solid; border-width:1px; border-color:#BAC3FD;float:left">
                            </div>
                            <div id="ba8" style="width:636px; height:5px;  float:left"></div>
                            <div id="ba8" style="width:5px; height:80px;  float:left"></div>
                            <!--电气参数-->
                            <div id="dqcs" style="width:629px; height:79px; float:right; border:solid; border-width:1px; float:left; border-color:#b4da72; background-color:#fbfff3">
                                <div id="dqcs1" style=" width:629px; height:10; float:left;font-size:14px;line-height:25px; font-weight:bold; background-color:#d2e8ab">
                                    &nbsp电&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
                                </div>
                                <div id="dq0" class="cssdiv" style="cursor:hand; width:160px; height:23px;font-size:14px ;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('u_a', 'A相电压');">
                                    A相电压：<span id="dq_u_a">0</span>
                                </div>
                                <div id="dq1" class="cssdiv" style="cursor:hand; width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('u_b', 'B相电压');">
                                    B相电压：<span id="dq_u_b">0</span>
                                </div>
                                <div id="dq2" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('u_c', 'C相电压');">
                                    C相电压：<span id="dq_u_c">0</span>
                                </div>
                                <div id="dq6" class="cssdiv" style="cursor:hand; width:140px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('gl_ys', '平均功率因数');">
                                    平均功率因数：<span id="dq_gl_ys">0</span>
                                </div>
                                <div id="dq3" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('u_a', 'A相电流');">
                                    A相电流：<span id="dq_i_a">0</span>
                                </div>
                                <div id="dq4" class="cssdiv" style="cursor:hand; width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('i_b', 'B相电流');">
                                    B相电流：<span id="dq_i_b">0</span>
                                </div>
                                <div id="dq5" class="cssdiv" style="cursor:hand; width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="showDyqx('i_c', 'C相电流');">
                                    C相电流：<span id="dq_i_c">0</span>
                                </div>                
                            </div>
                            <div id="baq" style="width:636px; height:5px;  float:left"></div>
                            <div id="ba9" style="width:5px; height:90px; float:left"></div>
                            <!--传感器运行-->
                            <div id="cgqyx" style="width:629px; height:115px; float:right; border:solid; border-width:1px; border-color:#fdbbfd; float:left">
                                <div id="cgqyx1" style="width:629px; height:10; float:left;font-size:14px;line-height:25px; font-weight:bold; background-color:#fde7fd" >
                                    &nbsp传&nbsp;&nbsp;&nbsp感&nbsp;&nbsp;&nbsp器&nbsp;&nbsp;&nbsp运&nbsp;&nbsp;&nbsp行
                                </div>
                                <div id="cgqyx2" style=" width:628px; height:95px; float:left"></div>
                            </div>              
                        </div>
                        <!--功图-->
                        <div id="ba6" style="width:7px; height:154px; float:left"></div>
                        <div id="gt" style="width:630px; height:365px; border:solid; border-width:1px; border-color:#96c2ff; float:left">
                            <div style="width:629px;height:20px; background-color:#eef7ff;padding-top:10px;padding-left:20px;">
                                <div id="gt3" style="width:125px; float:left;padding-left:20px;background-repeat:no-repeat;  background-image: url(${ctx}/static/img/jsgt.png);">
          
                                    <a onclick="run1();" style="cursor: hand;font-size:14px;">&nbsp;&nbsp;即时功能读取</a>
                                </div>
                                <div id="gt4" style="width:105px; height:10; float:left;padding-left:20px;background-repeat:no-repeat;  background-image: url(${ctx}/static/img/gtdb.png);">
                                    <a  onclick="sj();" style="cursor: hand;font-size:14px">&nbsp;功图对比</a>
                                </div>
                                <div id="gt5" style="width:131px; height:10; float:left;padding-left:20px;background-repeat:no-repeat;  background-image: url(${ctx}/static/img/cygsl.png);">
                                    <a onclick="cyfslfx()" style=" cursor: hand;font-size:14px">&nbsp;抽油杆受力分析</a>
                                </div>
                                <div id="gt6" style="width:265px; height:10; float:left">              
                                </div>
                            </div>
                            <div id="gt7" style="width:160px; height:30px; font-size:14px;float:left; line-height:30px;background-color:#deeeff" align="center" >
                                &nbsp示&nbsp功&nbsp图
                            </div>
                            <div id="gt8" style="width:160px; height:30px;font-size:14px; float:left;line-height:30px; background-color:#deeeff" align="center" >
                                &nbsp电&nbsp流&nbsp曲&nbsp线
                            </div>
                            <div id="gt9" style="width:160px; height:30px; font-size:14px;float:left; line-height:30px;background-color:#deeeff" align="center" >
                                &nbsp电&nbsp功&nbsp图
                            </div>
                            <div id="gt10" style="width:150px; height:30px;font-size:14px; float:left;line-height:30px; background-color:#deeeff" align="center" >
                                &nbsp有&nbsp功&nbsp功&nbsp率&nbsp曲&nbsp线
                            </div>
                            <div id="gtt" style="width:158px; height:150px; line-height:30px;float:left">
                            <div id="containerr" style="height:158px;width:150px; "></div>
                             </div>
                             <div id="gtt1" style="width:158px; height:10; float:left">
                                <div id="containerr1" style="height:158px;width:150px; "></div>
                               </div>
                               <div id="gtt2" style="width:158px; height:10; float:left ">
                                <div id="containerr2" style="height:158px;width:150px; "></div>
                               </div>
                               <div id="gtt3" style="width:120px; height:10; float:left " >
                               <div id="containerr3" style="height:158px;width:150px; "></div>
                               </div>
                            <div id="gtcs" style="width:630px; height:25px; float:left;line-height:30px;font-size:14px; background-color:#deeeff">
                                <table>
                                    <tr style="height:10px">
                                        &nbsp功&nbsp;&nbsp;&nbsp图&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
                                    </tr>
                                </table>
                            </div>
                           <div id="gtc1" onclick="showGtqx('maxZaihe', '最大载荷');" style="cursor:hand; width:210px;line-height:25px; height:25px; font-size:14px;float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp最大载荷(KN)：<span id="maxZaihe"></span>
                            </div>
                            <div id="gtc2" onclick="showGtqx('minZaihe', '最小载荷');" style="cursor:hand; width:210px; line-height:25px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp最小载荷(KN)：<span id="minZaihe"></span>
                            </div>
                            <div id="gtc3" style="width:208px; line-height:25px;height:25px;font-size:14px; float:left">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp诊断：<span id="falutDiagnoseInfo"></span>
                            </div>
                            <div id="gtc4" onclick="showGtqx('shangChongChengTime', '上冲程时间');" style="cursor:hand; width:210px; line-height:25px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px; background-color:#deeeff ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp上冲程时间(s)：<span id="shangChongChengTime"></span>
                            </div>
                            <div id="gtc5" onclick="showGtqx('xiaChongChengTime', '下冲程时间');" style="cursor:hand; width:210px; height:25px; line-height:25px;float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px; background-color:#deeeff " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp下冲程时间(s)：<span id="xiaChongChengTime"></span>
                            </div>
                            <div id="gtc6" onclick="showGtqx('chongCi', '冲次');" style="cursor:hand; width:208px;line-height:25px; font-size:14px;height:25px; float:left; background-color:#deeeff" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp冲次(min<SUP>-1</SUP>)：<span id="chongCi"></span>
                            </div>
                            <div id="gtc7" onclick="showGtqx('nenghaoShang', '上冲程能耗');" style="cursor:hand; width:210px; line-height:25px;height:25px;font-size:14px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp上冲程能耗(kWh)：<span id="nenghaoShang"></span>
                            </div>
                            <div id="gtc8" onclick="showGtqx('nenghaoXia', '下冲程能耗');" style="cursor:hand; width:210px;line-height:25px;font-size:14px; height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp下冲程能耗(kWh)：<span id="nenghaoXia"></span>
                            </div>
                            <div id="gtc9" onclick="showGtqx('pingHengDu', '平衡度');" style="cursor:hand; width:208px;line-height:25px; font-size:14px;height:25px; float:left" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp平衡度：<span id="pingHengDu"></span>
                            </div>
                            <div id="gtc10" onclick="showGtqx('riHaoDian', '单井日耗电量');" style="cursor:hand; width:210px;line-height:25px;font-size:14px; height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ; background-color:#deeeff">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp单井日耗电量(kWh)：<span id="riHaoDian"></span>
                            </div>
                            <div id="gtc11" onclick="showGtqx('dianBiaoNum', '当前电表数');" style="cursor:hand; width:210px;line-height:25px; font-size:14px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px; background-color:#deeeff " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp当前电表数：<span id="dianBiaoNum"></span>
                            </div>
                            <div id="gtc12" onclick="showGtqx('chanYeLiang', '产液量');" style="cursor:hand; width:208px; font-size:14px;line-height:25px;height:25px; float:left; background-color:#deeeff" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp产液量(t/d)：<span id="chanYeLiang"></span>
                            </div>
                            <div id="gtc13" onclick="showGtqx('bengXiao', '泵效');" style="cursor:hand; width:210px; font-size:14px;line-height:25px;height:30px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp泵效：<span id="bengXiao"></span>
                            </div>
                            <div id="gtc13" style="width:210px;line-height:25px; height:30px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                            </div>
                        </div>
                        <div id="bia13" style="width:1280px;  height:5px;float:left; "></div>
                        <div id="bia2" style="width:5px;  height:22px; float:left "></div>
                        <div id="ssqx2" style="width:1268px; height:135px;border:solid; border-width:1px; border-color:#9fdfae; float:left" class="ss1">
                            <div id="ssqx3" style="width:1268px; font-size:14px; font-weight:bold;height:10; float:left; background-color:#9fdfae" align="left" class="ss2">
                                &nbsp实&nbsp;&nbsp;&nbsp时&nbsp;&nbsp;&nbsp数&nbsp;&nbsp;&nbsp据
                                <span id="ssqxTitle"></span>
                            </div>	
                            <div id="ssqx4" style="width:1268px; height:120px; float:left">
                                <div id="div1" style="width:100%;height:100%;">
                                    <div id="container" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                                </div>
                                <div id="div2" style="width:100%;height:100%; ">
                                    <div id="container1" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                                </div>
                                <div id="div4" style="width:100%;height:100%; ">
                                    <div id="container1122" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                                </div>
                            </div>
                            <!--功图对比-->
                            <div id="gtdb" style="width:1268px; height:120px; float:left; display:none;overflow: auto">
                           </div>            
                        </div>
                    </div>
                    <!--辅助信息-->
                    <div id="fz" style="width:1280px; height:530px;">
                        <div id="fzx1" style="width:1280px; height:5px; float:left; "></div>
                        <div id="fzx" style="width:5px; height:22px; float:left; "></div>
                        <!--基本信息-->
                        <div id="jbxx" style="width:630px;font-size:14px; height:20px; float:left; background-color:#d2e8ab;border:solid;font-weight:bold; border-width:1px; border-color:#d2e8ab">
                            &nbsp井&nbsp;&nbsp;&nbsp基&nbsp;&nbsp;&nbsp本&nbsp;&nbsp;&nbsp信&nbsp;&nbsp;&nbsp息
                        </div>
                        <div id="fzx2" style="width:5px; height:22px; float:left;"></div>
                        <!--控制参数-->
                        <div id="kzcs" style="width:627px;font-size:14px; height:20px; float:left; background-color:#fcc8a0;border:solid;font-weight:bold; border-width:1px; border-color:#fcc8a0">
                            &nbsp控&nbsp;&nbsp;&nbsp制&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
                        </div>
                        <div id="kzc" style="width:5px; height:22px;  float:left; "></div>
                        <div id="baa" style="width:5px; height:220px;  float:left;"></div>
                        <div id="jjb" style="width:630px; height:217px; float:left; background-color:#ffffff;border:solid; border-width:1px; border-color:#d2e8ab">
                        </div>
                        <div id="bia" style="width:5px; height:217px; float:left; "></div>
                        <!--电气参数数据-->
                        <div id="dqsj" style="width:627px; height:50px; background-color:#ffffff; float:left; font-size:14px;border-color:#FFE0BB;border-style:solid; border-width:1px" >
                            <table>
                                  <tr style="height:10px"></tr>
                                  <tr>
                                     <td  style="width:200px; font-size:14px;" align="center">上冲程时间(s)：<span id="shangChongChengTime_fu"></span></td>
                                     <td  style="width:250px; font-size:14px;" align="center">下冲程时间(s)：<span id="xiaChongChengTime_fu"></span></td>
                                     <td  style="width:150px; font-size:14px;" align="center">冲次(min<SUP>-1</SUP>)：<span id="chongCi_fu"></span></td>
                                  </tr>
                             </table>
                        </div>
                        <div id="sy" style="width:629px;height:6px; float:left; " align="left"></div>
                        <div id="cgqs" style="width:627px; font-size:14px;height:10; font-weight:bold;background-color:#e6d5ff; float:left; border-style:solid;border-color:#e6d5ff; border-width:1px" >&nbsp;传&nbsp;&nbsp;&nbsp感&nbsp;&nbsp;&nbsp器&nbsp;&nbsp;&nbsp设&nbsp;&nbsp;&nbsp备
                        </div>
                        <div id="gr" style="width:627px; height:140px; border-style:solid; border-color:#e6d5ff;border-width:1px; background-color:#FFE0BB; float:left">
                        </div>
                        <div id="bia2" style="width:1279px;height:5px; ; float:left; "></div>
                        <div id="bia23" style="width:5px; height:20px; ; float:left; "></div>
                        <!--电气参数-->
                        <div id="dqcss" style="width:1265px;font-size:14px; height:20px; float:left; background-color:#fdb4fd;border:solid; font-weight:bold;border-width:1px; border-color:#fdb4fd">&nbsp电&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
                        </div> 
                        <div id="bia4" style="width:5px; height:22px;  float:left; "></div>
                        <div id="bias" style="width:5px; height:140px;  float:left; "></div>
                        <div id="cs" style="width:1265px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">
                            <div id="cs1" style="width:420px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">                            
                            </div>
                            <div id="cs2" style="width:420px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">                            
                            </div>
                            <div id="cs3" style="width:418px; height:138px; border-color:#fdb4fd;border-style:solid; border-width:1px;  float:left">
                            </div>
                        </div>
                        <div id="bia13" style="width:1340px; height:5px;float:left; "></div>
                        <div id="bia2" style="width:5px; height:22px; float:left "></div>
                        <div id="dqcsqx" style=" width:1268px; height:20px; font-size:14px;border-width:1px; background-color:#9fdfae; font-weight:bold;float:left">
                           
                            <span id="dqqxTitle"></span>
                        </div>
                        <div id="bia2" style="width:5px; height:20px; float:left;" ></div>
                        <div id="dqcsqxt" style=" width:1266px; height:95px; border-style:solid; border-color:#9fdfae; border-width:1px;  float:left" >
                            <div id="div3" style="width:100%;height:100%;">
                                <div id="container2" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                            </div>
                            <div id="div4" style="width:100%; height:100%">
                                <div id="container5" style=" min-width:90%; height:100%;margin:0 auto"></div>
                            </div>
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
            <!--浮上-->
            <div id="apDiv1">
                <div id="ad" style="width:70px; height:10; float:left; font-size:14px; font-weight:bold; line-height:25px">
                    &nbsp;&nbsp;&nbsp;井标识
                </div>
                <div id="ad2" style="width:350px; height:10;float:left; font-size:14px;line-height:25px">
                    运行 &nbsp;&nbsp;<img src="${ctx}/static/img/lse.png" />&nbsp;&nbsp;故障停井&nbsp;&nbsp;<img src="${ctx}/static/img/hongse.png" />&nbsp;&nbsp;非正常停井&nbsp;&nbsp;<img src="${ctx}/static/img/zise.png" />&nbsp;&nbsp;计划停井&nbsp;&nbsp;<img src="${ctx}/static/img/juse.png" />
                </div>
                <div id="ads" style="width:80px; height:10; float:left; font-size:14px; font-weight:bold; line-height:25px">
                    &nbsp;&nbsp;&nbsp;RTU标识
                </div>
                <div id="adr" style="width:390px; height:10;float:left; font-size:14px;line-height:25px">
                    运行 &nbsp;&nbsp;<img src="${ctx}/static/img/lse.png" />&nbsp;&nbsp;故障&nbsp;&nbsp;<img src="${ctx}/static/img/hongse.png" />&nbsp;&nbsp;校验&nbsp;&nbsp;<img src="${ctx}/static/img/lansee.png" />
                </div>
                <div id="adw" style="width:20px; height:20px; float:left; font-size:14px; font-weight:bold;padding-top:3px">
                    <img src="${ctx}/static/img/yck.png"/>
                </div>
                <div id="adq" style="width:80px; height:20px; float:left; font-size:14px; font-weight:bold; line-height:23px">
                    <a style="cursor:hand"onclick="yckz();">远程控制</a>
                </div>
                <div id="adt" style="width:20px; height:20px; float:left; font-size:14px; font-weight:bold;padding-top:3px">
                    <img src="${ctx}/static/img/yct.png"/>
                </div>
                <div id="ady" style="width:60px; height:20px; float:left; font-size:14px; font-weight:bold; line-height:23px">
                    <a style="cursor:hand"onclick="yctc();">远程调参</a>
                </div>   
            </div>
            <div id="yin" >
                <img border="0"  src="${ctx}/static/img/1.png" />
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

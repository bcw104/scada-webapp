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
            var Grid,dhxWins,dhxd,dhxd1,dhxd2,dhxd3,gr,gr1;
            var dtu ='<div id="dt" style="width:100%; height:100%; background-color:#C3F"><img src="images/djgyt22.jpg"  style="width:100%; height:100%"></img></div>';
            var ew='<div id="y" style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="摄像头"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx();">取消</button><td></tr></table></div>';
            var anniu='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="kj();">开井</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">停井</button><td></tr></table></div>';
            var sd='<div id="y"style="width:180px;height:30px;float:left;"><table><tr><td style="width:250px" align="center">油井状态:开井</td></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qdd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qxx();">取消</button><td></tr></table></div>';
            var yt='<div id="y"style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input name="" type="text" value="admin" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="" type="password" value="admin"  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input name="" type="text" value="参数改变"  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd1();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx1();">取消</button><td></tr></table></div>';
            var yc='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tc();">调参</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tj();">取消</button><td></tr></table></div>';
            var ytc='<div id="y"style="width:380px;height:60px;float:left"><table border="0" width="100%"><tr><td style="width:150px; " align="left">上行冲程(m)：<input name="" type="text" value="4" style="width:20px;"/></td><td style="width:150px; " align="left">上行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2.1" style="width:20px;"/></td></tr><tr><td style="width:150px; ba" align="left">下行冲程(m)：<input name="" type="text" value="3.9" style="width:20px;"/></td><td style="width:150px; " align="left">下行冲次(min<SUP>-1</SUP>)：<input name="" type="text" value="2" style="width:20px;"/></td></tr></table></div><div id="k" style="width:100%;height:60px;float:left"><table width="100%"><tr><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qd2();">确定</button><td><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qx2();">取消</button><td></tr></table></div>';            
            /**
             * 页面初始化
             * @returns {undefined}
             */
            function dqb(){
                //工况信息
                creategkGr();
                //RTU状态
                creatertuGr();
                //传感器运行
                createGrid();
                createWindows();
                createwind();
                createwind1();
                createwind2();
                createwi();
                //工况信息
                creategkGr();
                //RTU状态
                creatertuGr();
                // 设置电气参数
                createDq();
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
            function creategkGr(){
                gr=new dhtmlXGridObject('gk');
                gr.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                gr.setNoHeader(true);//隐藏表头
                gr.setHeader(["序号"]);
                gr.setInitWidths("100");
                gr.setColAlign("left");
                gr.setColTypes("ro");
                gr.init();
                //gr.attachEvent('onRowDblClicked', function(rId, cInd){});
                        
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
                        //单击事件
                        if(gr.getRowsNum() > 0){
                            
                            doGrClick(gr.getRowId(0), 0);
                        }
                    }
                }); 
                // 事件绑定
                gr.attachEvent('onRowSelect', doGrClick);
            }
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doGrClick(gr_rId, gr_cInd){
                    var tmpName = gr_rId.split('||');
                    $("#ssqxTitle").html( tmpName[1] + '曲线');
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

                             var colors = Highcharts.getOptions().colors;
                            var ys;
                            ys = colors[j];		
                            te(xAxisData, tmpName[1], '', ys, yAxisData, 'container');//alert(xAxisData + '----' + yAxisData);
                            j += 1;
                        }
                    });                    
                }               
            /**
             * 设置RTU状态
             * @returns {undefined}
             */
            function creatertuGr(){
                gr1=new dhtmlXGridObject('rtu');
                gr1.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                gr1.setNoHeader(true);//隐藏表头
                gr1.setHeader(["序号","名称"]);
                gr1.setInitWidths("129,*");
                gr1.setColAlign("left,center");
                gr1.setColTypes("ro,img");
                gr1.init();
                
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

                        gr1.parse(youjingData,'json');
                    }
                });  
                   
                // 事件绑定
                gr1.attachEvent('onRowSelect', doGrClick);
            }
             /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doGrClick(gr_rId, gr_cInd){
            
                    var tmpName = gr_rId.split('||');
                    $("#ssqxTitle").html(tmpName[1] + '曲线');
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
              * 电气参数信息点击
              * @param {type} dy_code
              * @param {type} dy_title
              * @returns {undefined}
              */
            function showDyqx(dy_code, dy_title){

//                    $("#container").html('');
                    $("#ssqxTitle").html( dy_title + '曲线');
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
            * 设置传感器运行信息
            * @returns {undefined}             
            * */
            function createGrid(){
                Grid= new dhtmlXGridObject('cg');
                Grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
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
    <body onload="dqb();">
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
                <div id="gk1" style="width:366px; height:22px;font-size:14px;line-height:25px; font-weight:bold; background-color:#FFE0BB; float:left">
                     &nbsp工&nbsp;&nbsp;&nbsp况
                     </div>
                <div id="ba4" style="width:5px; height:22px;  float:left" ></div>
                <div id="gk2" style="width:230px;font-size:14px;line-height:25px; font-weight:bold; height:22px; background-color:#C6CEFD; float:left">
                     &nbspRTU&nbsp;&nbsp;&nbsp状&nbsp;&nbsp;&nbsp态
                </div>
                <div id="ba5" style="width:5px; height:22px;   float:left" ></div>
                <div id="dqcs1" style=" width:230px; height:22px; float:left;font-size:14px;line-height:25px; font-weight:bold; background-color:#d2e8ab">
                               &nbsp电&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数
                </div>
                <div id="ba6" style="width:5px; height:22px; float:left" ></div>
                <div id="cgqyx1" style="width:430px; height:22px; float:left;font-size:14px;line-height:25px; font-weight:bold; background-color:#fde7fd" >
                        &nbsp传&nbsp;&nbsp;&nbsp感&nbsp;&nbsp;&nbsp器&nbsp;&nbsp;&nbsp运&nbsp;&nbsp;&nbsp行
                </div>
                <div id="ba7" style="width:5px; height:22px; float:left" ></div>
                <div id="ba4" style="width:4px; height:154px;  float:left"></div>
                <div id="gk4" style="width:364px; height:152px; background-color:#FFF8EF;border:solid; border-color:#FFBC6C; border-width:1px; float:left">
                <div id="gkk" style="width:245px; height:152px; float:left ">
                    <a  ondblclick="ztwin();" style="cursor:hand;text-decoration:none"><img src="${ctx}/static/img/djgyt22.jpg"  style="width:100%; height:151px" /></a>
                </div>
                <div id="gkk1" style="width:118px;height:153px; float:left">
                    <div id="tb" style="width:118px; height:35px;float:left; font-size:14px; line-height:40px">
                        &nbsp;&nbsp;&nbsp;油井启停：<img id="youjingState" src="${ctx}/static/img/hongse.png" style="height:15px"/>
                    </div>
                    <div id="gk" style="width:118px; height:118px; float:left;">
                    </div>
                </div>
         </div>
       <!--RTU状态-->
          <div id="ba5" style="width:5px; height:154px;  float:left"></div>
          <div id="rtu" style="width:228px; height:152px;border:solid; border-width:1px; border-color:#BAC3FD;float:left">
           		
          </div>
          <div id="ba8" style="width:5px; height:154px;float:left" ></div>
            <div id="dqcs" style="width:228px; height:154px; float:right; border:solid; border-width:1px; float:left; border-color:#b4da72; background-color:#fbfff3">
                   <div id="dq0"  class="cssdiv"   onclick="showDyqx('u_a', 'A相电压');" style="width:114px; height:38px;cursor:pointer;font-size:14px ;line-height:40px;float:left;border-right-style:solid; border-right-color:#cced94; border-right-width:1px; ">
                        A相电压：<span id="dq_u_a">0</span>
                   </div>
                   <div id="dq1" class="cssdiv"  onclick="showDyqx('u_a', 'A相电流');"  style="width:113px; height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left">
                       A相电流：<span id="dq_i_a">0</span>
                   </div>
                   <div id="dq2"  class="cssdiv" onclick="showDyqx('u_b', 'B相电压');" style="width:114px;height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left;border-right-color:#cced94;background-color:#f5ffdc; border-right-style:solid; border-right-width:1px">
                       B相电压：<span id="dq_u_b">0</span>
                   </div>
                   <div id="dq3" class="cssdiv" onclick="showDyqx('i_b', 'B相电流');"  style="width:113px;height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left;background-color:#f5ffdc">
                       B相电流：<span id="dq_i_b">0</span>
                   </div>
                   <div id="dq4" class="cssdiv"  onclick="showDyqx('u_c', 'C相电压');"  style="width:114px; height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left; border-right-color:#cced94;border-right-style:solid; border-right-width:1px">
                       C相电压：<span id="dq_u_c">0</span>
                   </div>
                   <div id="dq5" class="cssdiv" onclick="showDyqx('i_c', 'C相电流');" style="width:113px;height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left">
                       C相电流：<span id="dq_i_c">0</span>
                   </div>
                   <div id="dq6" class="cssdiv" onclick="showDyqx('gl_ys', '平均功率因数');" style="width:227px;height:38px;cursor:pointer;font-size:14px;line-height:40px;float:left;border-right-color:#cced94;background-color:#f5ffdc;border-right-style:solid; border-right-width:1px">
                       平均功率因数：<span id="dq_gl_ys">0</span>
                   </div>
            </div>
            <div id="ba9" style="width:5px; height:154px;float:left" ></div>
            <div id="cg" style="width:428px; height:154px; border:solid; border-width:1px; border-color:#fde7fd; float:left;background-color:#fde7fd" >
            </div>
            <div id="ba13" style="width:5px; height:130px;  float:left" ></div>
            <div id="ba14" style="width:1280px; height:5px; float:left" ></div>
            <div id="ba15" style="width:5px; height:22px;  float:left" ></div>
            <div id="ssqx3" style="width:1270px; font-size:14px; font-weight:bold; line-height:25px;height:22px; float:left; background-color:#9fdfae" align="left" class="ss2">
                <span id="ssqxTitle"></span>
            </div>	
            <div id="ba16" style="width:5px; height:22px;   float:left" ></div>
            <div id="ba17" style="width:5px; height:110px; float:left" ></div>
            <div id="ssqx4" style="width:1268px; height:330px;border:solid; border-width:1px; border-color:#9fdfae;  float:left">
                    <div id="div1" style="width:100%;height:100%;">
                             <div id="container" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
                    </div>    
                     <div id="div3" style="width:100%;height:100%; display:none">
                             <div id="container2" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
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

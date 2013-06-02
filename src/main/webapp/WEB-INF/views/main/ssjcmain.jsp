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
            var dhxWins,dhxWins1,dhxWins2,dhxd,dhxd1,dhxd2,dhxd3,dhxd4,dhxTabbar,dhLayout,lo,lc,ld,lh,Grid,Grid2,Grid3,gr,Gr,Grxn;
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

            var gtdb='<div id="y"style="width:500px;height:30px;float:left;font-size:14px;"><table><tr><td  style="width:350px" align="left">&nbsp;&nbsp;&nbsp;日期:&nbsp;<input name="" type="text" value="2013-2-1"  style="width:60px;"/>&nbsp;<input name="" type="text" value="12"  style="width:20px;"/>点～<input name="" type="text" value="2013-2-3"  style="width:60px;"/>&nbsp;<input name="" type="text" value="24"  style="width:20px;"/>点&nbsp;<button type="button" style="background:#81d4ff" onclick="run2();">查询</button></td></tr></table></div>';
            
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
                // 设置井基本信息
                createXinxi();
                
//                createWindows();
//                createWindows1();
//                createWindow();
//                createwind();
//                createwind1();
//                createwind2();
//                createwi();
//                createWin();
                
                
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
                                youjingItem.id = value.key;
                                youjingItem.data = [];
                                youjingItem.data.push(value.name + '：' + value.value);

                                youjingData.rows.push(youjingItem);
                            }
                        });

                        gr.parse(youjingData,'json');
                    }
                });                        
                 
                // 事件绑定
                gr.attachEvent('onRowDblClicked', function(rId, cInd){
                
                    $("#ssqx4").css("display","block");
					$("#gtdb").css("display","none");
					var gid=rId;
					var liename=gr.cells(rId,cInd).getValue();
					//从分号截取字符串
					//var zf=liename.split("：");
					var zf=liename.split("(");
					var qname=zf[0];
					var r=zf[1].split(")");
					var qdw=r[0];
					var ys;
					if(j>2){
						j=0;
						}
					ys=yse[j];	
					te(dyDate,qname,qdw,ys);
					j+=1;
                });
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
                            youjingItem.id = value.key;
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
                Gr.attachEvent('onRowDblClicked', function(rId, cInd){
                    alert(rId);
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
            
//            Grid2= new dhtmlXGridObject('gr');
//            Grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
//            Grid2.setHeader(["设备名称","出厂厂家","型号","序号","设备地址"]);
//            Grid2.setInitWidths("120,120,120,120,*");
//            Grid2.setColAlign("center,center,center,center,center");
//            Grid2.setColTypes("ro,ro,ro,ro,ro");
//            Grid2.init();
            
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
            
            function createWin(){
                dhxd4 = new dhtmlXWindows();
                dhxd4.attachViewportTo(document.body);
                dhxd4.createWindow("wa",800,200,350,65);
                dhxd4.window("wa").button('minmax2').hide();
                dhxd4.window("wa").button('minmax1').hide();
                dhxd4.window("wa").button('park').hide();
                dhxd4.window("wa").hide();
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
            function createWindow(){
                dhxWins2 = new dhtmlXWindows();
                dhxWins2.attachViewportTo(document.body);
                dhxWins2.createWindow("win2",600,200,400,150);
                dhxWins2.window("win2").button('minmax2').hide();
                dhxWins2.window("win2").button('minmax1').hide();
                dhxWins2.window("win2").button('park').hide();
                dhxWins2.window("win2").hide();	
            }
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
                            Grid3.load('data/cyggsl.json','json');
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
            function run1(){
                window.location.href="ssjcgt.html";
            }
            function run2(){
                //window.location.href="ssjcgtdb.html";
                $("#ssqx4").css("display","none");
                $("#gtdb").css("display","block");
                dhxd4.window("wa").hide(); 

            }
            function sj(){
                dhxd4.window("wa").show();
                dhxd4.window("wa").setText("功图对比");
                dhxd4.attachEvent("onClose", function(win){
                dhxd4.window("wa").hide(); 
                            });
                dhxd4.window("wa").attachHTMLString(gtdb);
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
                    <div id="ssjc" style="width:1280px; height:10">
                        <img src="${ctx}/static/img/head.png"/>
                    </div>
                    <div id="tool" style="width:119px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                        <a  href="ssjc.html" style="text-decoration:none"><img border="0" src="${ctx}/static/img/ssjk_red.png" style="width:119px; height:33px;"/></a>
                    </div>
                    <div id="tool1" style="width:125px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left">
                        <a href="bjxix.html" style="text-decoration:none"><img border="0" src="${ctx}/static/img/bjzt.png" /></a>
                    </div>
                    <div id="tool2" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                        <a  href="scdt.html" style="text-decoration:none"><img border="0" src="${ctx}/static/img/scdt.png" style="width:120px; height:33px;"/></a>
                    </div>
                    <div id="tool3" style="width:120px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                        <a  href="scjl.html" style="text-decoration:none"><img  border="0" src="${ctx}/static/img/scgl.png" style="width:120px; height:33px;"/></a>
                    </div>
                    <div id="tool4" style="width:120px; height:20;border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                        <a  href="wltp.html" style="text-decoration:none"><img border="0"  src="${ctx}/static/img/txwl.png" style="width:120px; height:33px;"/></a>
                    </div>
                    <div id="tool5" style="width:120px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                        <img src="${ctx}/static/img/yjcz.png" style="width:120px; height:33px" />
                    </div>
                    <div id="tool7" style="width:550px; height:20; float:left" >
                        <img src="${ctx}/static/img/tp.png" style="width:550px; height:33px" />
                    </div>
                    <div id="bt" style="width:1246px; height:28px; font-size:14px;  border-top-color:#1580db; border-top-style:solid; border-top-width:1px;font-weight:bold; line-height:30px; background-color:#a9d3ff; float:left">
                        &nbsp;&nbsp;${info.majorTag.name}---${info.name}
                    </div>
                    <div id="cha" style="float:right; border-top-color:#1580db; border-top-style:solid; border-top-width:1px">
                        <a href="ssjc.html"><img src="${ctx}/static/img/cha.png" border="0" style="height:28px;"/></a>
                    </div>
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
                                <div id="dq0" class="cssdiv" style="width:160px; height:23px;font-size:14px ;line-height:30px;float:left;cursor:pointer" onclick="qxa(0);">
                                    <a onclick="div2Hidden();" style="cursor:hand">
                                        A相电压：<span id="dq_u_a">0</span>
                                    </a>
                                </div>
                                <div id="dq1" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(1);">
                                    B相电压：<span id="dq_u_b">0</span>
                                </div>
                                <div id="dq2" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(2);">
                                    C相电压：<span id="dq_u_c">0</span>
                                </div>
                                <div id="dq6" class="cssdiv" style="width:140px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(6);">
                                    平均功率因数：<span id="dq_gl_ys">0</span>
                                </div>
                                <div id="dq3" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(3);">
                                    A相电流：<span id="dq_i_a">0</span>
                                </div>
                                <div id="dq4" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(4);">
                                    B相电流：<span id="dq_i_b">0</span>
                                </div>
                                <div id="dq5" class="cssdiv" style="width:160px; height:23px;font-size:14px;line-height:30px;float:left;cursor:pointer" onclick="qxa(5);">
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
                            <div style="width:629px;height:30px; background-color:#eef7ff;">
                                <div id="gt3" style="width:125px; height:10; float:left; padding-top:6px; padding-left:8px">
                                    <img src="${ctx}/static/img/jsgt.png" border="0" align="middle"/>&nbsp;&nbsp;<a onclick="run1();" style="cursor: hand;font-size:14px">即时功能读取</a>
                                </div>
                                <div id="gt4" style="width:105px; height:10; float:left; padding-top:5px; ">
                                    <img  border="0" src="${ctx}/static/img/gtdb.png" align="middle"/>&nbsp;&nbsp;<a  onclick="sj();" style="cursor: hand;font-size:14px">功图对比</a>
                                </div>
                                <div id="gt5" style="width:131px; height:10; float:left;padding-top:5px;">
                                    <img src="${ctx}/static/img/cygsl.png" align="middle"/>&nbsp;&nbsp;<a onclick="cyfslfx()" style=" cursor: hand;font-size:14px">抽油杆受力分析</a>
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
                            <div id="gtc1" style="width:210px;line-height:25px; height:25px; font-size:14px;float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp最大载荷(KN)：75.64
                            </div>
                            <div id="gtc2" style="width:210px; line-height:25px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp最小载荷(KN)：32.77
                            </div>
                            <div id="gtc3" style="width:208px; line-height:25px;height:25px;font-size:14px; float:left">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp诊断：正常
                            </div>
                            <div id="gtc4" style="width:210px; line-height:25px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px; background-color:#deeeff ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp上冲程时间(s)：30
                            </div>
                            <div id="gtc5" style="width:210px; height:25px; line-height:25px;float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px;font-size:14px; background-color:#deeeff " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp下冲程时间(s)：31
                            </div>
                            <div id="gtc6" style="width:208px;line-height:25px; font-size:14px;height:25px; float:left; background-color:#deeeff" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp冲次(min<SUP>-1</SUP>)：1.48
                            </div>
                            <div id="gtc7" style="width:210px; line-height:25px;height:25px;font-size:14px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp上冲程能耗(kWh)：0.02
                            </div>
                            <div id="gtc8" style="width:210px;line-height:25px;font-size:14px; height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp下冲程能耗(kWh)：0.016
                            </div>
                            <div id="gtc9" style="width:208px;line-height:25px; font-size:14px;height:25px; float:left" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp平衡度：0.95
                            </div>
                            <div id="gtc10" style="width:210px;line-height:25px;font-size:14px; height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ; background-color:#deeeff">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp单井日耗电量(kWh)：20
                            </div>
                            <div id="gtc11" style="width:210px;line-height:25px; font-size:14px;height:25px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px; background-color:#deeeff " >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp当前电表数：123.7
                            </div>
                            <div id="gtc12" style="width:208px; font-size:14px;line-height:25px;height:25px; float:left; background-color:#deeeff" >
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp产液量(t/d)：50
                            </div>
                            <div id="gtc13" style="width:210px; font-size:14px;line-height:25px;height:30px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px ">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp泵效：80%
                            </div>
                            <div id="gtc13" style="width:210px;line-height:25px; height:30px; float:left; border-right:solid; border-right-color:#C4E1FF; border-right-width:1px " >
                            </div>
                        </div>
                        <div id="bia13" style="width:1280px;  height:5px;float:left; "></div>
                        <div id="bia2" style="width:5px;  height:22px; float:left "></div>
                        <div id="ssqx2" style="width:1268px; height:135px;border:solid; border-width:1px; border-color:#9fdfae; float:left" class="ss1">
                            <div id="ssqx3" style="width:1268px; font-size:14px; font-weight:bold;height:10; float:left; background-color:#9fdfae" align="left" class="ss2">
                                &nbsp实&nbsp;&nbsp;&nbsp时&nbsp;&nbsp;&nbsp数&nbsp;&nbsp;&nbsp据
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
                            <div id="gtdb" style="width:1268px; height:120px; float:left; display:none">
                                <img src="${ctx}/static/img/sgt.png" style="height:110px" />
                                <img src="${ctx}/static/img/sgts.png" style="height:110px;" />
                                <img src="${ctx}/static/img/sgts.png" style="height:110px;" />
                                <img src="${ctx}/static/img/sgte.png" style="height:110px;" />
                                <img src="${ctx}/static/img/sg.png" style="height:110px;" />
                                <img src="${ctx}/static/img/ggtt.png" style="height:110px;" />
                                <img src="${ctx}/static/img/gl.png" style="height:110px;" />
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
                                     <td  style="width:200px; font-size:14px;" align="center">上下冲成频率：50</td>
                                     <td  style="width:250px; font-size:14px;" align="center">变频器换向时间(s)：50</td>
                                     <td  style="width:150px; font-size:14px;" align="center">冲程(m)：4.81</td>
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
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td  style="width:250px; height:23px; background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspA相电流有效值：1.53</td>
                                    <td  style="width:250px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspC相电压有效值：24</td>
                                    <td  style="width:150px;background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;视在功率：49.98</td>
                                    <td  style="width:200px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A相无功功率：0.32</td>
                                    <td  style="width:250px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspB相电压总谐波含量：10</td>
                                    <td  style="width:200px;background-color:#fde7fd;font-size:14px;" ><a ondblclick="cbb();" style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B相电压0～31次谐波</a></td>
                                </tr>
                                <tr>
                                    <td  style="width:250px; height:23px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspB相电流有效值：1.52</td>
                                    <td  style="width:250px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspAB线电压有效值：215</td>
                                    <td  style="width:150px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;功率因数：0.17</td>
                                    <td  style="width:200px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相无功功率：0.32</td>
                                    <td  style="width:250px;border-right-style:solid; font-size:14px;border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspC相电压总谐波含量：20</td>
                                    <td  style="width:150px;border-right-style:solid; font-size:14px;border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C相电压0～31次谐波</td>
                                </tr>
                                <tr>
                                    <td  style="width:250px; height:23px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspC相电流有效值：1.52</td>
                                    <td  style="width:250px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspBC线电压有效值：215</td>
                                    <td  style="width:150px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;周波：40</td>
                                    <td  style="width:200px;background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C相无功功率：0.31</td>
                                    <td  style="width:250px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspA相电流总谐波含量：12</td>
                                    <td  style="width:200px;background-color:#fde7fd;font-size:14px; " >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A相电流0～31次谐波</td>
                                </tr>
                                <tr>
                                    <td  style="width:250px; height:23px;font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp3相不平衡电流：45</td>
                                    <td  style="width:250px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspCA线电压有效值：215</td>
                                    <td  style="width:150px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;A相有功功率：0.07</td>
                                    <td  style="width:200px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A相视在功率：29</td>
                                    <td  style="width:250px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspB相电流总谐波含量：11</td>
                                    <td  style="width:150px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B相电流0～31次谐波</td>
                                </tr>
                                <tr>
                                    <td  style="width:250px; height:23px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspA相电压有效值：51</td>
                                    <td  style="width:250px;background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp有功功率：39</td>
                                    <td  style="width:150px;background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;B相有功功率：0.05</td>
                                    <td  style="width:200px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B相视在功率：30</td>
                                    <td  style="width:250px;background-color:#fde7fd; font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspC相电流总谐波含量：13</td>
                                    <td  style="width:150px;background-color:#fde7fd;font-size:14px; border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C相电流0～31次谐波</td>
                                </tr>
                                <tr>
                                    <td  style="width:250px; height:23px;font-size:14px;border-right-style:solid; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbspB相电压有效值：56</td>
                                    <td  style="width:250px;border-right-style:solid;font-size:14px; border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp无功功率：52</td>
                                    <td  style="width:150px;border-right-style:solid; font-size:14px;border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;C相有功功率：0.06</td>
                                    <td  style="width:200px;border-right-style:solid; font-size:14px;border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A相电压总谐波含量：26</td>
                                    <td  style="width:248px;border-right-style:solid; font-size:14px;border-right-color:#FCF; border-right-width:1px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A相电压0～31次谐波</td>
                                    <td  style="width:150px;font-size:14px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;反向有功峰电能</td>
                                </tr>
                            </table>
                        </div>
                        <div id="bia13" style="width:1340px; height:5px;float:left; "></div>
                        <div id="bia2" style="width:5px; height:22px; float:left "></div>
                        <div id="dqcsqx" style=" width:1268px; height:20px; font-size:14px;border-width:1px; background-color:#9fdfae; font-weight:bold;float:left">
                            &nbsp;电&nbsp;&nbsp;&nbsp气&nbsp;&nbsp;&nbsp参&nbsp;&nbsp;&nbsp数&nbsp;&nbsp;&nbsp曲&nbsp;&nbsp;&nbsp线
                        </div>
                        <div id="bia2" style="width:5px; height:20px; float:left;" ></div>
                        <div id="dqcsqxt" style=" width:1266px; height:95px; border-style:solid; border-color:#9fdfae; border-width:1px;  float:left" >
                            <div id="div3" style="width:100%;height:100%;">
                                <div id="container2" style="min-width: 90%; height: 100%; margin: 0 auto"></div>
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

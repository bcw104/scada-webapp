<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生产运行记录</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z-wing.css" />        
        <script type="text/javascript" src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jQuery.Tip.js"></script>
        <script type="text/javascript">
            var objUrl='${ctx}';
            var username='${username}';
            $(function () {
                $("#szda").html('欢迎您 ${name}');
            });
        </script>
        <script type="text/javascript" src="${ctx}/static/application.js"></script>
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
            #hhk1{
                position:absolute;
                left:460px;
                top:210px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #xian{
                position:absolute;
                left:489px;
                top:238px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc1{
                position:absolute;
                left:1047px;
                top:623px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc2{
                position:absolute;
                left:1047px;
                top:535px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc3{
                position:absolute;
                left:865px;
                top:600px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc4{
                position:absolute;
                left:1090px;
                top:600px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc5{
                position:absolute;
                left:350px;
                top:200px;
                width:79px;
                height:43px;
                z-index:1;
            }
            #bc6{
                position:absolute;
                left:916px;
                top:500px;
                width:79px;
                height:43px;
                z-index:1;
            }
            #bc7{
                position:absolute;
                left:916px;
                top:600px;
                width:79px;
                height:43px;
                z-index:1;
            }
            #bc8{
                position:absolute;
                left:900px;
                top:530px;
                width:79px;
                height:43px;
                z-index:1;
            }
            #bc9{
                position:absolute;
                left:1050px;
                top:530px;
                width:79px;
                height:43px;
                z-index:1;
            }
            .s1{ color:red;}
            .s2{ color:#000;}
            .cssdiv:hover{
                color:#09F
            }
            .cssdiv1:hover{
                color:#09F
            }
            .cssdiv2:hover{
                color:#09F
            }
            #szda {
                position:absolute;
                left:724px;
                top:38px;
                width:1075px;
                height:27px;
                z-index:1;
                color: #fff;
                font-size: 14px;
                font-weight: bold;
            }
        </style>
        <script type="text/javascript">
            var dhxTabbar,dhxTabbar1,dhxTabble,createTabble3,createTreeGrid1,treeGrid,treeGrid1,Grid,dhxWins,dhxWin,Grid1,Grid2,Grid3,Grid4,Grid5,Grid6,Grid7,Grid8,Grid9,Grid10;
            var tubiao='<div id="dt" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/tbb.png"  style="width:100%; height:100%"></img></div>';
            
            /**
             * 页面初始化
             * @returns {undefined}
             */
            function scjll(){

                $(".cssdiv").addClass("s1");
                createTabble();
                createTreeGrid1();
//                createTreeGrid();
//                createGrid();
//                createWindow();
//                createWindows();
            }
            
            /**
             * 创建报表信息选项卡
             * @returns {undefined}
             */
            function createTabble(){
                dhxTabbar=new dhtmlXTabBar('gr');
                dhxTabbar.setImagePath("${ctx}/static/dhtmlx/imgs/");
                //dhxTabbar.setSkin('dhx_blue');
                dhxTabbar.addTab("tab1", "油井报表", "85px");
                dhxTabbar.addTab("tab2", "水源井报表", "95px");
                dhxTabbar.addTab("tab3", "注水站报表", "95px");
                dhxTabbar.addTab("tab4", "增压站报表", "95px");
                dhxTabbar.addTab("tab5", "注汽站报表", "95px");
                dhxTabbar.addTab("tab6", "远程控制记录", "120px");
                dhxTabbar.addTab("tab7", "远程调参记录", "120px");
                dhxTabbar.addTab("tab8", "故障处置记录", "120px");
                dhxTabbar.setTabActive("tab1");
                dhxTabbar.cells("tab1").attachObject("yjbb");
                dhxTabbar.cells("tab2").attachObject("syjbb");
                dhxTabbar.cells("tab3").attachObject("zszbb");
                dhxTabbar.cells("tab4").attachObject("zyzbb");
                dhxTabbar.cells("tab5").attachObject("zqbb");
                dhxTabbar.cells("tab6").attachObject("yckz");
                dhxTabbar.cells("tab7").attachObject("yctc");
                dhxTabbar.cells("tab8").attachObject("gzcz");
            }
            
            /**
             * 创建设备监控管理选项卡
             * @returns {undefined}
             */
            function createTabble3(){
                dhxTabbar3=new dhtmlXTabBar('gr1');
                dhxTabbar3.setImagePath("${ctx}/static/dhtmlx/imgs/");
                //dhxTabbar3.setSkin('modern');
                dhxTabbar3.addTab("tab1", "网络拓扑图", "100px");
                dhxTabbar3.addTab("tab2", "网络表格", "85px");
                dhxTabbar3.setTabActive("tab1");
                dhxTabbar3.cells("tab1").attachObject("wltpt");
                dhxTabbar3.cells("tab2").attachObject("wlbg");
            }
            
            var deviceJson;
            /**
             * 创建设备监控管理选项卡--网络表格
             * @returns {undefined}
             */
            function createTreeGrid1(){
                treeGrid= new dhtmlXGridObject('ysbscjc');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("设备名称,生产厂家,型号,序号,设备地址,井名,IP地址,通讯状态");
                treeGrid.setInitWidths("150,150,150,150,150,150,150,*");
                treeGrid.setColAlign("left,center,center,center,center,center,center,center");
                treeGrid.setColTypes("tree,txt,txt,txt,txt,txt,txt,txt");
                treeGrid.init();
                treeGrid.enableMultiselect(true);
                
                
                // 获得机构信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/produce/deviceList',
                    dateType:'json',
                    success: function(json){                        
                        
                        deviceJson = json;
                        treeGrid.clearAll();
                        treeGrid.parse(getDeviceData(deviceJson),'json'); 
                    }
                });
            }
            
            /**
             * 创建设备监控管理选项卡--网络表格
             * @returns {undefined}
             */
            function createTreeGrid1BySearch(){
                treeGrid= new dhtmlXGridObject('ysbscjc');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("设备名称,生产厂家,型号,序号,设备地址,井名,IP地址,通讯状态");
                treeGrid.setInitWidths("150,150,150,150,150,150,150,*");
                treeGrid.setColAlign("left,center,center,center,center,center,center,center");
                treeGrid.setColTypes("tree,txt,txt,txt,txt,txt,txt,txt");
                treeGrid.init();
                treeGrid.enableMultiselect(true);                

                treeGrid.clearAll();
                treeGrid.parse(getDeviceData(deviceJson),'json'); 
            }
            
            /**
             * 获得网络表格数据
             * @param {type} p_json
             * @returns {Object}             
             * */
            function getDeviceData(p_json){
            
                var deviceData = new Object();
                deviceData.rows = [];
                
                // 封装网络表格JSON
                $.each(p_json, function(key, value){
                    
                    if((value.name.indexOf($.trim($("#txtName").val())) >= 0) && (String(value.address).indexOf($.trim($("#txtAddress").val())) >= 0)){
                        var tmpDevice = new Object(); 
                        tmpDevice.id = value.id;
                        tmpDevice.data = [];
                        tmpDevice.rows = [];

                        // 名称设置
                        var deviceName = {};
                        deviceName.value = value.name;
                        deviceName.image = 'folder.gif';        
                        tmpDevice.data.push(deviceName);
                        tmpDevice.data.push(value.manufacture);
                        tmpDevice.data.push(value.type);
                        tmpDevice.data.push(value.number);
                        tmpDevice.data.push(value.address);
                        tmpDevice.data.push(value.endtagname);
                        tmpDevice.data.push(value.ip);
                        tmpDevice.data.push(value.state == "true" ? "正常" : "非正常");

                        $.each(value.sensor, function(keySensor, valueSensor){
                            var tmpSensor = new Object(); 
                            tmpSensor.id = valueSensor.id + "_sensor";
                            tmpSensor.data = [];

                            tmpSensor.data.push(valueSensor.name);
                            tmpSensor.data.push(valueSensor.manufacture);
                            tmpSensor.data.push(valueSensor.type);
                            tmpSensor.data.push(valueSensor.number);
                            tmpSensor.data.push(valueSensor.address);
                            tmpSensor.data.push(valueSensor.endtagname);
                            tmpSensor.data.push(valueSensor.ip);
                            tmpSensor.data.push(valueSensor.state == "true" ? "正常" : "非正常");

                            tmpDevice.rows.push(tmpSensor);
                        });

                        deviceData.rows.push(tmpDevice);
                    }
                    
                });
                
                return deviceData;
            }
            
            function createWindow(){
                dhxWin = new dhtmlXWindows();
                dhxWin.attachViewportTo(document.body);
                dhxWin.createWindow("win",200,100,648,135);
                dhxWin.window("win").button('minmax2').hide();
                dhxWin.window("win").button('minmax1').hide();
                dhxWin.window("win").button('park').hide();
                dhxWin.window("win").hide();	
            }
            
            function rtu(){
                dhxWin.window("win").show();
                Grid9=dhxWin.window("win").attachGrid();
                Grid9.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid9.setHeader(["RTU对象","生产厂家","型号","启用信息","IP地址","通讯状态"]);
                Grid9.setInitWidths("100,100,100,100,100,100");
                Grid9.setColAlign("center,center,center,center,center,center");
                Grid9.setColTypes("ed,ed,ed,ed,ed,ed");
                Grid9.init();
                Grid9.load('data/bbbwin.json','json');
                dhxWin.window("win").setText("RTU对象");
                dhxWin.attachEvent("onClose", function(win){
                    dhxWin.window("win").hide(); 
                });
            }
            
            function createTabbar1(){
                dhxTabbar1=new dhtmlXTabBar('gr2');
                dhxTabbar1.setImagePath("${ctx}/static/dhtmlx/imgs/");
                //dhxTabbar1.setSkin('modern');
                dhxTabbar1.addTab("tab1", "工况监测历史", "120px");
                dhxTabbar1.addTab("tab2", "报警信息历史记录", "150px");
                dhxTabbar1.addTab("tab3", "故障诊断记录", "120px");
                dhxTabbar1.addTab("tab4", "遥控记录", "100px");
                dhxTabbar1.addTab("tab5", "遥调记录", "100px");
                dhxTabbar1.addTab("tab6", "设备监测历史记录", "150px");
                dhxTabbar1.setTabActive("tab1");
                dhxTabbar1.cells("tab1").attachObject("bjxx");
                dhxTabbar1.cells("tab2").attachObject("gkls");
                dhxTabbar1.cells("tab3").attachObject("gzls");
                dhxTabbar1.cells("tab4").attachObject("ykls");
                dhxTabbar1.cells("tab5").attachObject("ytls");
                dhxTabbar1.cells("tab6").attachObject("sbjcls");
            }
            
            function createWindows(){
                dhxWins = new dhtmlXWindows();
                dhxWins.attachViewportTo(document.body);
                dhxWins.createWindow("win",5,190,1270,525);
                dhxWins.window("win").button('minmax2').hide();
                dhxWins.window("win").button('minmax1').hide();
                dhxWins.window("win").button('park').hide();
                dhxWins.window("win").hide();	
            }
            
            function createTreeGrid(){
                treeGrid= new dhtmlXGridObject('gk');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader(["队","操作状态","操作时间","操作原因","操作人"]);
                treeGrid.setInitWidths("255,255,255,255,255");
                treeGrid.setColAlign("left,center,center,center,center");
                treeGrid.setColTypes("tree,img,ro,ro,ro");
                treeGrid.init();
                treeGrid.load("data/yckz.json", "json");
                treeGrid1= new dhtmlXGridObject('gk1');
                treeGrid1.selMultiRows = true;
                treeGrid1.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid1.setHeader(["队","操作状态","操作时间","操作原因","操作人"]);
                treeGrid1.setInitWidths("255,255,255,255,255");
                treeGrid1.setColAlign("left,center,center,center,center");
                treeGrid1.setColTypes("tree,ro,ro,ro,ro");
                treeGrid1.init();
                treeGrid1.load("data/yctc.json", "json");
                treeGrid2= new dhtmlXGridObject('gk2');
                treeGrid2.selMultiRows = true;
                treeGrid2.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid2.setHeader(["队","报警时间","报警原因","负责人","响应时间"]);
                treeGrid2.setInitWidths("255,255,255,255,255");
                treeGrid2.setColAlign("left,center,center,center,center");
                treeGrid2.setColTypes("tree,ro,ro,ro,ro");
                treeGrid2.init();
                treeGrid2.load("data/gzcz.json", "json");
            }
            
            function createGrid(){
                Grid1= new dhtmlXGridObject('gryj');
                Grid1.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid1.setHeader(["序号","油井名称","日产液量（t/d）","日产油量（t/d）","含水率（%）","冲程（m）","冲次（min<SUP>-1</SUP>）","油压（MPa）","套压（MPa）","回压（MPa）","动液面（m）","泵效（%）","平衡度","井口温度（℃）","日平均电压（V）","日平均电流（A）","日耗电量（kw·h）","日注汽累积量（m³/d）","日注汽平均流量（m³/s）","日注汽平均压力（MPa）","日注汽平均温度（℃）","日注汽平均干度（%）","日注汽时间（h）","开井时间（h）","报警数（个）"]);
                Grid1.setInitWidths("70,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,150,170,160,150,150,150,150,150");
                Grid1.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,center");
                Grid1.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid1.init();
                Grid1.load('data/yjbb.json','json');

                Grid2= new dhtmlXGridObject('grsyj');
                Grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid2.setHeader(["序号","井号","日均外输压力（MPa）","日均井口压力（MPa）","日均水温（℃）","日均液位（米）","日耗电量（kw·h）","日均外输瞬时流量（m³/s）","日外输累积流量（m³/d）","报警数（个）"]);
                Grid2.setInitWidths("70,150,150,150,100,130,200,200,200,150");
                Grid2.setColAlign("center,center,center,center,center,center,center,center,center,center");
                Grid2.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid2.init();
                Grid2.load('data/syjbb.json','json');

                Grid3= new dhtmlXGridObject('grzsz');
                Grid3.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid3.setHeader(["序号","注水站名称","日注水累积量（m³/d）","日注水平均流量（m³/s）","日注水平均压力（MPa）","日注水平均温度（℃）","日注水时间（h）"]);
                Grid3.setInitWidths("70,150,220,220,220,220,*");
                Grid3.setColAlign("center,center,center,center,center,center,center");
                Grid3.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid3.init();
                Grid3.load('data/zszbb.json','json');

                Grid4= new dhtmlXGridObject('grzyz');
                Grid4.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid4.setHeader(["序号","增压站名称","入口温度（℃）","出口温度（℃）","外输压力（MPa）","原油含水率（%）","流量瞬时值（m³/s）","流量累计值（m³）","缓冲罐液位（m）","环境温度#1（℃）","环境温度#2（℃）","电动蝶阀值（0～100）"]);
                Grid4.setInitWidths("70,150,150,150,150,150,150,150,150,150,150,200");
                Grid4.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center");
                Grid4.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid4.init();
                Grid4.load('data/zyzbb.json','json');

                Grid5= new dhtmlXGridObject('grzq');
                Grid5.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid5.setHeader(["序号","注汽站","油压（MPa）","套压（MPa）","回压（MPa）","日注汽累积量（m³/d）","日注汽平均流量（m³/s）","日注汽平均压力（MPa）","日注汽平均温度（℃）","日注汽平均干度（%）"]);
                Grid5.setInitWidths("70,100,100,100,100,200,200,200,180,180");
                Grid5.setColAlign("center,center,center,center,center,center,center,center,center,center");
                Grid5.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid5.init();
                Grid5.load('data/zqzbb.json','json');

                Grid6= new dhtmlXGridObject('gkljlgr');
                Grid6.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid6.setHeader(["序号","队","井号","越限报警","井矿故障诊断报警","SOE报警","日期"]);
                Grid6.setInitWidths("70,150,150,150,150,150,*");
                Grid6.setColAlign("center,center,center,center,center,center,center");
                Grid6.setColTypes("ro,ro,ro,ro,ro,ro,ro");
                Grid6.init();
                Grid6.load('data/gkls.json','json');

                Grid7= new dhtmlXGridObject('bjgr');
                Grid7.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid7.setHeader(["序号","队","井号","温度(℃)","压力(MPa)","流量(m³/d)","电压(kw·h)","电流(kw·h)","电量(kw)","日期"]);
                Grid7.setInitWidths("70,100,150,150,150,150,150,150,150,150");
                Grid7.setColAlign("center,center,center,center,center,center,center,center,center,center");
                Grid7.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid7.init();
                Grid7.load('data/bjjl.json','json');

                Grid8= new dhtmlXGridObject('gzgr');
                Grid8.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid8.setHeader(["序号","队","井号","设备名称","故障时间","故障信息"]);
                Grid8.setInitWidths("70,175,175,175,175,*");
                Grid8.setColAlign("center,center,center,center,center,center");
                Grid8.setColTypes("ro,ro,ro,ro,ro,ro");
                Grid8.init();
                Grid8.load('data/gzls.json','json');

                Grid9= new dhtmlXGridObject('ykgr');
                Grid9.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid9.setHeader(["序号","队","井号","状态","日期"]);
                Grid9.setInitWidths("70,300,300,300,300");
                Grid9.setColAlign("center,center,center,center,center");
                Grid9.setColTypes("ro,ro,ro,ro,ro");
                Grid9.init();
                Grid9.load('data/ykls.json','json');

                Grid10= new dhtmlXGridObject('sbjclsjlgr');
                Grid10.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid10.setHeader(["序号","队","井号","监控设备信息","日期"]);
                Grid10.setInitWidths("70,200,300,300,*");
                Grid10.setColAlign("center,center,center,center,center");
                Grid10.setColTypes("ro,ro,ro,ro,ro");
                Grid10.init();
                Grid10.load('data/sbjclsjl.json','json');

                Grid11= new dhtmlXGridObject('ytgr');
                Grid11.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid11.setHeader(["序号","井号","井信息","调整类别","调整后参数","原参数","调整时间"]);
                Grid11.setInitWidths("70,200,400,200,100,100,*");
                Grid11.setColAlign("center,center,center,center,center,center,center");
                Grid11.setColTypes("ro,ro,ro,ro,ro,ro,ro");
                Grid11.init();
                Grid11.load('data/ytls.json','json');
            }
            
            function tbxs(){
                dhxWins.window("win").show();
                dhxWins.window("win").setText("生产综合图表");
                dhxWins.window("win").attachHTMLString(tubiao);
                dhxWins.attachEvent("onClose", function(win){
                    dhxWins.window("win").hide(); 
                });
            }
            
            function xx(i){
                document.getElementById("bc"+i).style.display="block";
            }
            
            function closedDiv(i){
                document.getElementById("bc"+i).style.display="none";
            }
            
            var dhxWins
            function jk(cdiv){
                $(".cssdiv1").removeClass("s1");
                $(".cssdiv2").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","block");
                $("#gr1").css("display","none");
                $("#gr2").css("display","none");
            }
            
            var i=0;
            function jk1(cdiv){
                $(".cssdiv").removeClass("s1");
                $(".cssdiv2").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","block");
                $("#gr2").css("display","none");
                if(i==0){createTabble3();}
                i+=1;
            }
            
            var sd=0;
            function jk2(cdiv){
                $(".cssdiv").removeClass("s1");
                $(".cssdiv1").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","none");
                $("#gr2").css("display","block");
                if(sd==0){createTabbar1();}
                sd+=1;
            }
            
        </script>
        <STYLE type=text/css> 
            div.objbox { 
                SCROLLBAR-FACE-COLOR: #FFFFFF ; 
                SCROLLBAR-HIGHLIGHT-COLOR: #e6d5ff; 
                SCROLLBAR-SHADOW-COLOR: #e6d5ff; 
                SCROLLBAR-3DLIGHT-COLOR: #e6d5ff; 
                SCROLLBAR-ARROW-COLOR: #e6d5ff; 
                SCROLLBAR-TRACK-COLOR: #FFFFFF;
                SCROLLBAR-DARKSHADOW-COLOR: #e6d5ff
            }
        </STYLE>
    </head>
    <body onload="scjll();">
        <div id="divkd"></div>
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="sj" style="width:1280px; height:69px;  float:left; font-size:0 ">
                <!--logo-->
                <div id="sscjl" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png" usemap="#planetmap" style="border: 0px"/>
                        <map name="planetmap" id="planetmap">
                            <area shape="rect" coords="1136,43,1184,62" href ="${ctx}/main/mgr" alt="设置" />
                            <area shape="rect" coords="1209,44,1261,61" href ="${ctx}/logout" alt="退出" />
                        </map>
                </div>
                <div id="tool" style="width:119px; height:20;  border-right-style:solid;border-right-color:#06F; border-right-width:1px; float:left">
                    <a  href="${ctx}/main" style="text-decoration:none"><img border="0" src="${ctx}/static/img/ssjk.png" style="width:119px; height:33px"/></a>
                </div>
                <div id="tool1" style="width:125px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a   href="${ctx}/alarmpage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/bjzt.png"/></a>
                </div>
                <div id="tool2" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="${ctx}/performancepage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/scdt.png" style="width:126px;height:33px"/></a>
                </div>
                <div id="tool3" style="width:122px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="${ctx}/producepage" style="text-decoration:none"><img  border="0" src="${ctx}/static/img/scgl_red.png"  style="width:122px; height:33px"/></a>
                </div>
                <div id="tool4" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="${ctx}/managepage" style="text-decoration:none"><img border="0"  src="${ctx}/static/img/txwl.png" style="width:126px; height:33px"/></a>
                </div>
                <div id="tool5" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <img src="${ctx}/static/img/yjcz.png" style="width:120px; height:33px" />
                </div>
                <div id="tool7" style="width:535px; height:20; float:left" >
                    <img src="${ctx}/static/img/tp.png" style="width:535px; height:33px" />
                </div>
                <!--竖着Tabbar页-->
                <div id="zy" style="width:35px; height:602px; float:left; ">
                    <!--报表信息-->
                    <div id="bx" class="cssdiv" onclick="jk(this);" style=" width:33px; height:146px;cursor:pointer;background-color:#e6d5ff; font-size:14px; line-height:35px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;">
                        &nbsp;&nbsp;报<br />&nbsp;&nbsp;表<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                    <!--设备监控管理-->
                    <div id="sbjk" class="cssdiv1" onclick="jk1(this);" style=" width:33px; height:204px;cursor:pointer;background-color:#cced94; font-size:14px; line-height:35px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                       &nbsp;&nbsp;设<br/>&nbsp;&nbsp;备<br/>&nbsp;&nbsp;监<br/>&nbsp;&nbsp;控<br/>&nbsp;&nbsp;管<br/>&nbsp;&nbsp;理
                    </div>
                    <!--生产运行历史记录-->
                    <div id="scyx" class="cssdiv2" onclick="jk2(this);" style=" width:33px;cursor:pointer;  height:247px; background-color:#ffc8db; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                       &nbsp;&nbsp;生<br/>&nbsp;&nbsp;产<br/>&nbsp;&nbsp;运<br/>&nbsp;&nbsp;行<br/>&nbsp;&nbsp;历<br/>&nbsp;&nbsp;史<br/>&nbsp;&nbsp;记<br/>&nbsp;&nbsp;录
                    </div>
                </div>
                <!--报表信息Tabbar-->
                <div id="gr" style="width:1245px; height:602px; float:left;">
                </div>
                <!--油井报表-->
                <div  id="yjbb" style="width:1245px; height:835px;overflow:scrol">
                    <div id="yj" style="width:1245px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">矿</td>
                                <td align="right" style="width:80px;">
                                    <select name="">
                                        <option selected="selected">一矿</option>
                                        <option>二矿</option>
                                        <option>三矿</option>
                                        <option>四矿</option>
                                    </select>
                                </td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">队</td>
                                <td align="right" style="width:80px;">
                                    <select name="">
                                        <option selected="selected">一队</option>
                                        <option>二队</option>
                                        <option>三队</option>
                                        <option>四队</option>
                                    </select>
                                </td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">开始时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"/></td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">结束时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"/></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;图&nbsp;表&nbsp;显&nbsp;示</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;快&nbsp;捷&nbsp;查&nbsp;询：</td>
                                <td style="width:200px; font-size:14px; font-weight:bold" align="center"><input name="radio" type="radio" value=""  checked="checked"/>当日<input name="radio" type="radio" value="" />本旬<input name="radio" type="radio" value="" />本月<input name="radio1" type="radio" value="" />本年</td>
                            </tr>
                        </table>
                    </div>
                    <div id="gryj" style="width:1245px; height:795px"></div>
                </div>
                <!--水源井报表-->
                <div  id="syjbb" style="width:1242px; height:578px;overflow:scrol">
                    <div id="syj" style="width:1242px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">矿</td>
                                <td align="right" style="width:80px;">
                                    <select name="">
                                        <option selected="selected">一矿</option>
                                        <option>二矿</option>
                                        <option>三矿</option>
                                        <option>四矿</option>
                                    </select>
                                </td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">队</td>
                                <td align="right" style="width:80px;">
                                    <select name="">
                                        <option selected="selected">一队</option>
                                        <option>二队</option>
                                        <option>三队</option>
                                        <option>四队</option>
                                    </select>
                                </td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">开始时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">结束时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;图&nbsp;表&nbsp;显&nbsp;示</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;快&nbsp;捷&nbsp;查&nbsp;询：</td>
                                <td style="width:200px; font-size:14px; font-weight:bold" align="center"><input name="radio1" type="radio" value=""  checked="checked"/>当日<input name="radio1" type="radio" value="" />本旬<input name="radio1" type="radio" value="" />本月<input name="radio1" type="radio" value="" />本年</td>
                            </tr>
                        </table>
                    </div>
                    <div id="grsyj" style="width:1243px; height:547px"></div>
                </div>
                <!--注水站报表-->
                <div  id="zszbb" style="width:1242px; height:578px;">
                    <div id="zsz" style="width:1242px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>                 
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">开始时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">结束时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;图&nbsp;表&nbsp;显&nbsp;示</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;快&nbsp;捷&nbsp;查&nbsp;询：</td>
                                <td style="width:200px; font-size:14px; font-weight:bold" align="center"><input name="radio4" type="radio" value=""  checked="checked"/>当日<input name="radio4" type="radio" value="" />本旬<input name="radio4" type="radio" value="" />本月<input name="radio4" type="radio" value="" />本年</td>
                            </tr>
                        </table>
                    </div>
                    <div id="grzsz" style="width:1242px; height:569px">
                    </div>
                </div>
                <!--增压站报表-->
                <div  id="zyzbb" style="width:1242px; height:578px;overflow:scrol">
                    <div id="zyz" style="width:1242px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>                 
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">开始时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">结束时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;图&nbsp;表&nbsp;显&nbsp;示</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;快&nbsp;捷&nbsp;查&nbsp;询：</td>
                                <td style="width:200px; font-size:14px; font-weight:bold" align="center"><input name="radio3" type="radio" value=""  checked="checked"/>当日<input name="radio3" type="radio" value="" />本旬<input name="radio3" type="radio" value="" />本月<input name="radio3" type="radio" value="" />本年</td>
                            </tr>
                        </table>
                    </div>
                    <div id="grzyz" style="width:1242px; height:549px">
                    </div>
                </div>
                <!--注气站报表--> 
                <div  id="zqbb" style="width:1242px; height:578px;">
                    <div id="zq" style="width:1242px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">开始时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">结束时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;图&nbsp;表&nbsp;显&nbsp;示</td>
                                <td style="width:100px; font-size:14px; font-weight:bold" align="center" onclick="tbxs();">&nbsp;快&nbsp;捷&nbsp;查&nbsp;询：</td>
                                <td style="width:200px; font-size:14px; font-weight:bold" align="center"><input name="radio2" type="radio" value=""  checked="checked"/>当日<input name="radio2" type="radio" value="" />本旬<input name="radio2" type="radio" value="" />本月<input name="radio2" type="radio" value="" />本年</td>
                            </tr>
                        </table>
                    </div>
                    <div id="grzq" style="width:1242px; height:549px"></div>
                </div>
                <!--远程控制记录--> 
                <div  id="yckz" style="width:1242px; height:578px;">
                    <div id="cx" style="width:1242px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:20px; font-size:14px; font-weight:bold" align="right">队</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">井</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:50px; font-size:14px; font-weight:bold" align="right">时&nbsp;&nbsp;间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="center">～</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:60px; font-size:14px; font-weight:bold" align="right">操作人</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                            </tr>
                        </table>
                    </div>
                    <div id="gk" style="width:1242px; height:549px">
                    </div>
                </div>
                <!--远程调参记录--> 
                <div  id="yctc" style="width:1248px; height:578px;">
                    <div id="cx1" style="width:1248px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:20px; font-size:14px; font-weight:bold" align="right">队</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="right">井</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:50px; font-size:14px; font-weight:bold" align="right">时&nbsp;&nbsp;间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:30px; font-size:14px; font-weight:bold" align="center">～</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:60px; font-size:14px; font-weight:bold" align="right">操作人</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                            </tr>
                        </table>
                    </div>
                    <div id="gk1" style="width:1245px; height:549px">
                    </div>
                </div>
                <!--故障处置-->
                <div  id="gzcz" style="width:1248px; height:558px;">
                    <div id="cx2" style="width:1275px; height:20px;border:solid; border-color:#e6d5ff; border-width:1px; background-color:#e6d5ff">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width:70px; font-size:14px; font-weight:bold" align="right">报警时间</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:60px; font-size:14px; font-weight:bold" align="right">负责人</td>
                                <td align="right" style="width:105px;"><input value="" style="width:100px;padding:0px; border:0px;height:17px"  /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="right"><img src="${ctx}/static/img/chaxun.png" /></td>
                                <td style="width:40px; font-size:14px; font-weight:bold" align="left">&nbsp;查&nbsp;&nbsp;询</td>
                            </tr>
                        </table>
                    </div>
                    <div id="gk2" style="width:1248px; height:549px">
                    </div>
                </div>
                <!--设备监控管理Tabbar-->
                <div id="gr1" style="width:1245px; height:602px; float:left; display:none">
                    <!--网络拓扑图-->
                    <div  id="wltpt" style="width:1270px; height:580px;">
                        <div id="qm" style="width:1270px; height:21px; font-size:14px; line-height:20px; font-weight:bold;background-color:#e6d5ff;border:solid; border-color:#e6d5ff; border-width:1px;  float:left">
                            &nbsp;&nbsp;&nbsp;网&nbsp;&nbsp;&nbsp;络&nbsp;&nbsp;&nbsp;拓&nbsp;&nbsp;&nbsp;扑&nbsp;&nbsp;&nbsp;图
                        </div>
                        <div id="wltp" style="width:1270px; height:580px; background-color:#FFE0BB;border:solid; border-color:#e6d5ff; border-width:1px;  float:left" >
                            <img src="${ctx}/static/img/wltpt.png" style="width:1270px; height:580px;" />
                        </div> 
                    </div>
                    <!--网络表格-->
                    <div  id="wlbg" style="width:1248px; height:578px;">
                        <div id="wlbgl" style="width:110px;height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;设&nbsp;&nbsp;备&nbsp;&nbsp;名&nbsp;&nbsp;称：
                        </div>
                        <div id="wlbg2" style="width:90px;height:19px;background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtName" id="txtName" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="wlbg3" style="width:70px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址：
                        </div>
                        <div id="wlbg3" style="width:90px;height:19px;background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtAddress" id="txtAddress" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="wlbg4" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" onclick="createTreeGrid1BySearch();" style="cursor:pointer" />
                        </div>	
                        <div id="wlbg5" style="width:855px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                        </div>    
                        <div id="ysbscjc" style="width:1248px; height:558px"></div>
                    </div>
                </div>
                <!--生产运行历史记录Tabbar-->
                <div id="gr2" style="width:1245px; height:602px;  float:left;display:none">
                <!--工况监测历史记录-->
                    <div id="bjxx" style="width:1245px; height:578px;overflow:scrol;border:solid; border-color:#e6d5ff; border-width:1px;">
                        <div id="bjjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="bjj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfie1" id="textfie1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="bjj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="bjj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfie2" id="textfie2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="bjj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="bjj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfie4" id="textfie4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="bjj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="bjj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfie5" id="textfie5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="bjj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="bjj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>	
                        <div id="bjgr" style="width:1245px; height:558px;  font-size:14px;line-height:25px;">	
                        </div>
                    </div>
                    <!--报警信息历史记录-->
                    <div id="gkls" style="width:1245px; height:578px;border:solid; border-color:#e6d5ff; border-width:1px; ">
                        <div id="gklsjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="gklsj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiegg1" id="textfiegg1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="gklsj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="gklsj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfieg2" id="textfieg2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gklsj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="gklsj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfieg4" id="textfieg4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gklsj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="gklsj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfieg5" id="textfieg5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gklsj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="gklsj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>
                        <div id="gkljlgr" style="width:1245px; height:558px;  font-size:14px;line-height:25px;">	
                        </div>
                    </div>
                    <!--故障诊断历史记录-->
                    <div id="gzls" style="width:1245px; height:578px;border:solid; border-color:#e6d5ff; border-width:1px;">
                        <div id="gzlsjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="gzlsj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiegs1" id="textfiegs1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="gzlsj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="gzlsj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiegs2" id="textfiegs2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gzlsj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="gzlsj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiegs4" id="textfiegs4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gzlsj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="gzlsj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiegs5" id="textfiegs5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="gzlsj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="gzlsj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>	
                        <div id="gzgr" style="width:1245px; height:558px;  font-size:14px; line-height:25px;">	
                        </div>
                    </div>
                    <!--遥控历史记录-->
                    <div id="ykls" style="width:1245px; height:578px;border:solid; border-color:#e6d5ff; border-width:1px; ">
                        <div id="ykjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="ykj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiey1" id="textfiey1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="ykj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="ykj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiey2" id="textfiey2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ykj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="ykj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiey4" id="textfiey4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ykj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="ykj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiey5" id="textfiey5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ykj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="ykj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>	
                        <div id="ykgr" style="width:1245px; height:558px;font-size:14px;line-height:25px;">	
                        </div>
                    </div>
                    <!--遥调历史记录-->
                    <div id="ytls" style="width:1245px; height:578px;border:solid; border-color:#e6d5ff; border-width:1px;">
                        <div id="ytjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="ytj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiet1" id="textfiet1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="ytj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="ytj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiet2" id="textfiet2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ytj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="ytj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiet4" id="textfiet4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ytj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="ytj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfiet5" id="textfiet5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="ytj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="ytj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>	
                        <div id="ytgr" style="width:1245px; height:558px;font-size:14px;line-height:25px;">	
                        </div>
                    </div>
                    <!--设备监测历史记录-->
                    <div id="sbjcls" style="width:1245px; height:578px;border:solid; border-color:#e6d5ff; border-width:1px;">
                        <div id="sbjclsjl" style="width:40px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;&nbsp;队
                        </div>
                        <div id="sbjclsj2" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfies1" id="textfies1" style=" height:13px; width:80px;"/>
                        </div>		
                        <div id="sbjclsj3" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;井&nbsp;&nbsp;号
                        </div>
                        <div id="sbjclsj4" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfies2" id="textfies2" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="sbjclsj5" style="width:60px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;日&nbsp;&nbsp;期
                        </div>
                        <div id="sbjclsj6" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfies4" id="textfies4" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="sbjclsj8" style="width:20px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            ～
                        </div>	
                        <div id="sbjclsj7" style="width:90px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="textfies5" id="textfies5" style=" height:13px; width:80px;"/>
                        </div>	
                        <div id="sbjclsj9" style="width:17px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" style="cursor:pointer" />
                        </div>	
                        <div id="sbjclsj10" style="width:665px;height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            &nbsp;&nbsp;查&nbsp;&nbsp;询
                        </div>	
                        <div id="sbjclsjlgr" style="width:1245px; height:558px; font-size:14px;line-height:25px;">	
                        </div>
                    </div>
                </div>   
            </div>
            <!--地图-->
            <div id="dt" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;">
                <img src="${ctx}/static/img/ditu.jpg"  style="width:1280px;height:716px;"/>
            </div>
            <!--视频-->
            <div id="sp" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;">
                <img src="${ctx}/static/img/sp.png"  style="width:1280px;height:716px;"/>
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
            <a href="ssjcmj.html"><img border="0" src="i${ctx}/static/img/3.png" /></a>
        </div>
        <div id="yin6" >
            <a href="ssjcdqb.html"><img border="0" src="${ctx}/static/img/4.png" /></a>
        </div>
        <div id="yin12" >
            <a href="ssjcmain.html"><img border="0" src="${ctx}/static/img/3.png" /></a>
        </div>
        <div id="hhk1" style="width:73px; height:20px; cursor:hand;"  onclick="rtu();" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div id="xian" style="width:20px; height:63px; cursor:hand" onclick="xx(5);" >
            &nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>
        </div>
        <div id="bc1" style="width:20px; height:63px; cursor:hand"onclick="xx(7);" >
            &nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>
        </div>
        <div id="bc2" style="width:20px; height:63px; cursor:hand"onclick="xx(6);" >
            &nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>&nbsp;&nbsp;<br/>
        </div>
        <div id="bc3" style="width:200px; height:63px; cursor:hand"onclick="xx(8);" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div id="bc4" style="width:20px; height:63px; cursor:hand"onclick="xx(9);" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div id="bc5" style=" display:none;background: url(${ctx}/static/img/dialog.png); text-align:center;padding-top:10px;color:red; font-size:10px" onclick="closedDiv(5);">
            线路不通<br>IP:192.168.1.1
        </div>
        <div id="bc6" style=" display:none;background: url(${ctx}/static/img/dialog.png); text-align:center;padding-top:10px;color:red;font-size:10px" onclick="closedDiv(6);">
            线路不通<br>IP:192.168.1.2
        </div>
        <div id="bc7" style=" display:none;background: url(${ctx}/static/img/dialog.png); text-align:center;padding-top:10px;color:red;font-size:10px" onclick="closedDiv(7);">
            线路不通<br>IP:192.168.1.3
        </div>
        <div id="bc8" style=" display:none;background: url(${ctx}/static/img/dialog.png); text-align:center;padding-top:10px;color:red;font-size:10px" onclick="closedDiv(8);">
            线路不通<br>IP:192.168.1.4
        </div>
        <div id="bc9" style=" display:none;background: url(${ctx}/static/img/dialog.png); text-align:center;padding-top:10px;color:red;font-size:10px" onclick="closedDiv(9);">
            线路不通<br>IP:192.168.1.5
        </div>
        <div id="szda" style="width:300px;"></div>
    </body>
</html>

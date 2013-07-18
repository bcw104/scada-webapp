<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生产运行记录</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z-wing.css" /> 
        <link rel="stylesheet" type="text/css" href="${ctx}/static/style/css.css">    
        <script type="text/javascript">
            var objUrl='${ctx}';
            var username='${username}';
        </script>   
        <script type="text/javascript" src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jQuery.Tip.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.comet.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/util.js"></script>
        <script type="text/javascript" src="${ctx}/static/application.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/swfobject.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/gis.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/map.js"></script>
        <script type="text/javascript">
            var dhxTabbar,dhxTabbar1,dhxTabble,createTabble3,createTreeGrid1,treeGrid,treeGrid1,Grid,dhxWins,dhxWin,Grid1,Grid2,Grid3,Grid4,Grid5,Grid6,Grid7,Grid8,Grid9,Grid10;
            var tubiao='<div id="dt" style="width:100%; height:100%; background-color:#C3F"><img src="${ctx}/static/img/tbb.png"  style="width:100%; height:100%"></img></div>';
            
            /**
             * 页面初始化
             * @returns {undefined}
             */
            function doOnLoad(){

                $(".cssdiv").addClass("s1");
                createTabble();
                createTreeGrid1();
            }
            
            var mapReportPage = new Map();
            function doSelect(id,last_id){
//              alert(id+ '--'+last_id);
//              dhxTabbar.setTabActive(itemId);
                dhxTabbar.cells(id).attachObject("yjbb");
                $("#reportIframe").attr("src", mapReportPage.get(id));
                return true;
            }
                
            /**
             * 创建报表信息选项卡
             * @returns {undefined}
             */
            function createTabble(){
                dhxTabbar=new dhtmlXTabBar('gr');
                dhxTabbar.setImagePath("${ctx}/static/dhtmlx/imgs/");
                //dhxTabbar.setSkin('dhx_blue');
                
                dhxTabbar.attachEvent("onSelect", doSelect);
                <c:forEach items="${lstReportPage}" var="loopReportPage" varStatus="loopStatus">
                    mapReportPage.set("tab${loopStatus.count}", "${loopReportPage.url}");
                    dhxTabbar.addTab("tab${loopStatus.count}", "${loopReportPage.name}", "100px");
                    if(${loopStatus.count} == 1){
                        dhxTabbar.setTabActive("tab${loopStatus.count}");
                        doSelect("tab${loopStatus.count}", 0);
                    }
                </c:forEach>             
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
                treeGrid.setEditable(false);
                
                
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
                var deviceDataJson = getDeviceData(deviceJson);
                treeGrid.parse(deviceDataJson,'json'); 
                
                if(deviceDataJson.rows.length == 0){
                    dhtmlx.message({
                        title: "消息提示",
                        type: "alert",
                        text: "没有与搜索条件匹配的项！"
                    });
                }
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
                    
                    if((value.name.indexOf($.trim($("#txtName").val())) >= 0) 
                            && ($.trim($("#txtAddress").val()) == "" || (String(value.address) == $.trim($("#txtAddress").val())))){
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
                        var ipTmp = value.ip.split('|');
                        tmpDevice.data.push(ipTmp[1]);
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
                            var ipTmp = valueSensor.ip.split('|');
                            tmpSensor.data.push(ipTmp[1]);
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
    </head>
    <body>
        <div id="divkd"></div>
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="sj" style="width:1280px; height:69px;  float:left; font-size:0 ">
                <!--logo-->
                <div id="sscjl" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png" usemap="#planetmap" style="border: 0px"/>
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
                <div id="gr" style="width:1245px; height:600px; float:left;background-color: #00B83F">
                </div>
                <!--报表-->
                <div  id="yjbb" style="width:1245px; height:570px;overflow:scroll;">
                    <iframe id="reportIframe" src="" style="width:1245px; height:570px;overflow:scroll"></iframe>
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
                <div  style="width:100%;height:100%; position: relative;">
                        <div id="flashContent" style="width:100%;" ></div>                        
                    </div>
            </div>
            <!--视频-->
            <div id="sp" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;">
                <img src="${ctx}/static/img/sp.png"  style="width:1280px;height:716px;"/>
            </div>
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
        <div id="sztitle" style="width:300px;"></div>
        <div id="szda" style="width:300px;"></div>        
        <div id="szan" >
            <c:if test="${sysmgr == 1}">
                <a href="${ctx}/main/mgr"><img border="0" src="${ctx}/static/img/sz.png" /></a>
            </c:if>
        </div>
        <div id="tcan" >
            <a href="${ctx}/logout"><img border="0" src="${ctx}/static/img/tc.png" /></a>
        </div>
    </body>
</html>

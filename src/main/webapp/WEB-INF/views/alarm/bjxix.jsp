<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>报警信息</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z.css">
        <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/static/js/highcharts.src.js"></script>
        <script src="${ctx}/static/js/exporting.js"></script>
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
            #divkd {
                display:none;
                position:absolute;
                background:url(${ctx}/static/img/kd.jpg);
                left:18px;
                top:491px;
                width:64px;
                height:216px;
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
        </style>
        <script type="text/javascript">
            $(function () {
                var chart;
                $(document).ready(function() {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'mcltb1',
                            type: 'spline'
                        },
                        title: {
                            text: ''
                        },
                        subtitle: {
                            text: ''
                        },
                        xAxis: {
                            type: 'datetime',
                        },
                        yAxis: {
                            title: {
                                text:null
                            },
                            min: 0,
                            gridLineWidth:0,
                            max:6,
                            lineWidth:1,
                        },
                         legend: {
                            enabled: false
                        },
                        plotOptions: {
                            //未选线，线效果
                            spline: {
                                lineWidth: 4,
                                //选线，线效果
                                states: {
                                    hover: {
                                        lineWidth: 4
                                    }
                                },
                                marker: {
                                    enabled: false,
                                   //选点，点效果
                                    states: {
                                        hover: {
                                            enabled: true,
                                            symbol: 'circle',
                                            radius: 1,
                                            lineWidth: 0
                                        }
                                    }
                                },
                                pointInterval: 3600000, // one hour
                                pointStart: Date.UTC(2013, 3, 6, 0, 0, 0)
                            }
                        },
                        series: [{
                            name: '井口温度越线',
                            data: [
                                [Date.UTC(13,00,00), 0],
                                [Date.UTC(13,00,00), 1],
                                [Date.UTC(14,00,00), 1],
                                [Date.UTC(15,00,00), 1],
                                [Date.UTC(16,00,00), 1],
                                [Date.UTC(17,00,00), 1],
                                [Date.UTC(17,00,00), 0]
                            ]
                        }]
                    });
                });    
            });
		</script>
        <script>
            var treeGrid,dhxWins,dhxWins1,grid1,grid2,grid3,grid4,grid5,grid6;
            
            /**
             * 报警信息初始化
             * @returns {undefined}
             */
            function bjxx(){
                createTreeGrid();
                $(".cssdiv1").addClass("s1");
//                grid1();
//                grid2();
//                grid3();
//                grid4();
//                grid5();
//                grid6();
            }
            
            function grid1(){
                grid= new dhtmlXGridObject('mcxx11');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["报警对象"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("mt");
                grid.load('data/dfyx11.json','json');
            }
            
            function grid2(){
                grid= new dhtmlXGridObject('mcxx12');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["负 责 人"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("mt");
                grid.load('data/dfyx12.json','json');
            }
            
            function grid3(){
                grid= new dhtmlXGridObject('mcxx21');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["报警对象"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("modern");
                grid.load('data/dfyx11.json','json');
            }
            
            function grid4(){
                grid= new dhtmlXGridObject('mcxx22');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["负 责 人"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("modern");
                grid.load('data/dfyx12.json','json');
            }
            
            function grid5(){
                grid= new dhtmlXGridObject('mcxx31');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["报警对象"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("mt");
                grid.load('data/dfyx11.json','json');
            }
            
            function grid6(){
                grid= new dhtmlXGridObject('mcxx32');
                grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                grid.setHeader(["负 责 人"]);
                grid.setInitWidths("188");
                grid.setColAlign("center");
                grid.setColTypes("ro");
                grid.init();
                grid.setSkin("mt");
                grid.load('data/dfyx12.json','json');
            }
            
            function jk(cdiv){
                $(".cssdiv1").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","block");
                $("#gr1").css("display","none");
            }
            
            function jk1(cdiv){
                $(".cssdiv").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","block");
            }
            
            /**
             * 历史记录信息显示
             * @returns {undefined}
             */
            function createTreeGrid(){
                treeGrid = new dhtmlXGridObject('wltp');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("序号,报警对象,部件,报警内容,报警时间,负责人,回复时间,处理时间,评价");
                treeGrid.setInitWidths("100,125,125,150,150,150,150,150,*");
                treeGrid.setColAlign("center,center,center,center,center,left,center,center,center");
                treeGrid.setColTypes("ro,ro,ro,ro,ro,tree,ro,ro,ro");
                treeGrid.init();
                treeGrid.enableMultiselect(true);
                
                // 获得工况信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/alarm/history',
                    dateType:'json',
                    success: function(json){

                        var baojingData = new Object();
                        baojingData.rows = [];

                        $.each(json,function(key, value){

                            var baojingItem = new Object();
                            baojingItem.id = value.id;
                            baojingItem.data = [];
                            baojingItem.data.push(value.endTag.id);
                            baojingItem.data.push(value.endTag.name);
                            baojingItem.data.push('');
                            baojingItem.data.push(value.info);
                            baojingItem.data.push(value.actionTime);
//                            alert(value.alarmHandleList.length);
                            // 负责人信息设置
                            var fuzerenInfo = {};
                            fuzerenInfo.value = value.alarmHandleList.length + '人';
                            fuzerenInfo.image = 'folder.gif'; 
                            baojingItem.data.push(fuzerenInfo);
                            
                            baojingItem.rows = [];
                            $.each(value.alarmHandleList,function(alarmkey, alarmvalue){
                                var fuzerenInfoItem = {};
                                fuzerenInfoItem.id = 'fzr_' + alarmvalue.user.id;
                                fuzerenInfoItem.data = [];
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push(alarmvalue.user.name);
                                fuzerenInfoItem.data.push(alarmvalue.confirmTime);
                                fuzerenInfoItem.data.push(alarmvalue.handleTime);
                                fuzerenInfoItem.data.push('');
                                
                                baojingItem.rows.push(fuzerenInfoItem);
                            });                          

                            baojingData.rows.push(baojingItem);
                        });

                        treeGrid.parse(baojingData,'json');
                    }
                }); 
            }
            
            function runurl(){
                window.location.href="bcxi.html";
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
    <body onload="bjxx();">
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="scdt" style="width:1280px; height:69px;  float:left " class="ssjkd">
                <!--logo-->
                <div id="ssjc" style="width:1280px; height:10">
                    <img src="${ctx}/static/img/head.png"/>
                </div>
                <div id="tool" style="width:119px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a1">
                    <a href="${ctx}/main" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/ssjk.png" style="width:119px; height:33px"/>
                    </a>
                </div>
                <div id="tool1" style="width:124px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a2">
                    <a href="#" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/bjzt_red.png" />
                    </a>
                </div>
                <div id="tool2" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a3">
                    <a  href="scdt.html" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/scdt.png" style="width:126px; height:33px"/>
                    </a>
                </div>
                <div id="tool3" style="width:122px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a4">
                    <a  href="scjl.html" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/scgl.png" style="width:122px; height:33px"/>
                    </a>
                </div>
                <div id="tool4" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a5">
                    <a  href="wltp.html" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/txwl.png"  style="width:126px; height:33px"/>
                    </a>
                </div>
                <div id="tool5" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <img src="${ctx}/static/img/yjcz.png" style="width:120px; height:33px" />
                </div>
                <div id="tool7" style="width:535px; height:20; float:left" >
                    <img src="${ctx}/static/img/tp.png" style="width:535px; height:33px" />
                </div>
                <!--竖div-->
                <div id="zhylll" style="width:33px;  height:595px; float:left;"> 
                    <div id="zyz" class="cssdiv1" onclick="jk1(this);" style=" width:32px; height:120px;cursor:pointer;background-color:#8ed4ff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;">
                        &nbsp;&nbsp;实<br />&nbsp;&nbsp;时<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                    <div id="jkxx" class="cssdiv" onclick="jk(this);" style=" width:32px; height:120px;cursor:pointer;  background-color:#e6d5ff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                        &nbsp;&nbsp;历<br />&nbsp;&nbsp;史<br />&nbsp;&nbsp;记<br />&nbsp;&nbsp;录
                    </div> 
                    <div id="zkk" class="cssdiv3" style=" width:32px; height:357px;cursor:pointer;  background-color:#fff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
     	            </div>
                </div>
                <div id="zhyrrr" style="width:1245px; height:595px; overflow:scrol; float:left">
                    <div id="gr" style="width:1245px; height:595px; overflow:scrol; float:left;display:none;overflow:scrol;">
                        <!--历史记录-->
                        <div id="qm" style="width:1245px; height:10; background-color:#e6d5ff; font-size:14px; font-weight:bold; line-height:19px;border:solid; border-color:#e6d5ff; border-width:1px;  float:left">
                            &nbsp;&nbsp;&nbsp历&nbsp;&nbsp;&nbsp史&nbsp;&nbsp;&nbsp记&nbsp;&nbsp;&nbsp录
                        </div>
                        <div id="wltp" style="width:1245px; height:578px; border:solid; border-color:#e6d5ff; border-width:1px;  float:left">
                        </div> 
                    </div>
                    <div id="gr1" style="width:1245px; height:578px; overflow:scrol; float:left;">
                        <!--曲线图--> 
                        <div id="ssjl" style=" width:1245px; height:599px;border:solid; border-color:#aad3ff; border-width:1px;  float:left">
                            <div id="jxx" style="width:1245px; height:20px; background-color:#8ed4ff; font-size:14px; font-weight:bold; line-height:20px;float:left">
                                &nbsp;&nbsp;实&nbsp;&nbsp;&nbsp时&nbsp;&nbsp;&nbsp信&nbsp;&nbsp;&nbsp息
                            </div>
                            <div id="jxxtp" style="width:1245px; height:193px;  float:left; ">
                                <div id="mcxxll1" style="float:left; height:193px; width:190px">
                                    <div id="mcxxt1" style="height:22px; width:190px; background-color:#e3f5ff; text-align:center;cursor:hand; font-size:14px; padding-top:6px;"  onclick="runurl();">
                                        <strong>井号：HJSH127-23</strong>
                                    </div>
                                    <div id="mcxx11" style=" height:81px; width:188px; background-color:#0C3;" >
                                    </div>
                                    <div id="mcxx12" style=" height:81px; width:188px; background-color:#03C;" >
                                    </div>
                                </div>
                                <div id="mcltb1" style=" height:193px; width:1055px; margin-left:190px;">
                                    1
                                </div>
                            </div>
                            <div id="djxxtp" style="width:1245px; height:193px; float:left; background-color:#0F0;">
                                <div id="mcxxll2" style="float:left; height:193px; width:190px">
                                    <div id="mcxxt2" style="height:22px; width:190px; background-color:#f5ffdc; text-align:center;cursor:hand; font-size:14px; padding-top:6px;" >
                                        <strong>井号：HJSH127-24</strong>
                                    </div>
                                    <div id="mcxx21" style=" height:81px; width:188px; background-color:#0C3;" >
                                    </div>
                                    <div id="mcxx22" style=" height:81px; width:188px; background-color:#03C;" >
                                    </div>
                                </div>
                                <div id="mcltb2" style=" height:193px; width:1055px; margin-left:190px; background-color:#90F;">
                                    1
                                </div>
                            </div>
                            <div id="zyztp"  style="width:1245px; height:193px; float:left; background-color:#00F;">
                                <div id="mcxxll3" style="float:left; height:193px; width:190px">
                                    <div id="mcxxt1" style="height:22px; width:190px; background-color:#e3f5ff; text-align:center;cursor:hand; font-size:14px; padding-top:6px;" >
                                    <strong>井号：HJSH127-25</strong>
                                    </div>
                                    <div id="mcxx31" style=" height:81px; width:188px; background-color:#0C3;" >
                                    </div>
                                    <div id="mcxx32" style=" height:81px; width:188px; background-color:#03C;" >
                                    </div>
                                </div>
                                <div id="mcltb3" style=" height:193px; width:1055px; margin-left:190px; background-color:#90F;">
                                1
                                </div>
                            </div>
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

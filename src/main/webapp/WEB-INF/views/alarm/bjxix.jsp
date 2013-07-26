<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>报警信息</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlxtoolbar_dhx_skyblue.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z-bjxix.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/style/css.css">
        <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_pgn_1.js"></script>
        <script src="${ctx}/static/dhtmlx/js/treeGridcodebae/ext/dhtmlxgridcell.js"></script>
        <script src="${ctx}/static/dhtmlx/js/treeGridcodebae/ext/dhtmlxtoolbar.js"></script>
        <script src="${ctx}/static/jquery/jquery-1.8.2.min.js"></script>
        <script src="${ctx}/static/jquery/highstock.js"></script>
        <script src="${ctx}/static/js/map.js" type="text/javascript"></script>
        <script src="${ctx}/static/js/common.js" type="text/javascript"></script>
        <script src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jQuery.Tip.js"></script>
        <script type="text/javascript">
            var objUrl='${ctx}';
            var username='${username}';
        </script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.comet.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/util.js"></script>
        <script type="text/javascript" src="${ctx}/static/application.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/swfobject.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/gis.js"></script>
        <script type="text/javascript">
            var treeGrid,dhxWins,dhxWins1,grid1,grid2,grid3,grid4,grid5,grid6;
            
            // 曲线参数
            var options = {
                title: {
                    text: '',
                },
                subtitle: {
                    text: '',
                },
                xAxis: {
                    type: 'datetime'
                },
                yAxis: {
                    min:0,
                    title:'',
                    lineWidth :0,
                    gridLineWidth:0,
                    labels: {
                        formatter: function() {
                            return '';
                        }
                    },
                },
                rangeSelector: {
                    enabled:false
				},
				credits:{
					enabled:false
				},
				navigator : {
					height:15
				},
                legend: {
                    enabled: false,
                },
                tooltip: {
                    formatter: function() {

                        return '<b>' + this.series.name.get(this.key) + '</b>';
                    }
                },
                plotOptions: {
                    pointInterval: 3600000
                },
                series:[]
            }
            
            // 曲线坐标点数据
            var series1 = {
                type: 'line',
                name: '',
                data:[],
                marker: {
                    enabled: false
                },
                states: {
                     hover: {
                        lineWidth: 0
                     }
                },
                enableMouseTracking: false
            };
            
            // 曲线数据点数据
            var series2 = {
                type: 'scatter',
                name: '',
                unit:'D',
                data:[],
                marker: {
                    radius: 4
                }
            };
            
            /**
             * 信息点击
             * @param {type} gr_rId
             * @param {type} gr_cInd
             * @returns {undefined}             
             * */
            function doGrClick(gr_rId, gr_cInd){
            
                var tmpName = gr_rId.split('||');
//                alert(tmpName[0] + '---' + tmpName[1] + '---' + tmpName[2] + '---' + tmpName[3] + '---' + tmpName[4]);

                switch(tmpName[3]){
                                            
                    case 'LUO_GAN_BENG':
                        window.location.href = '${ctx}/alarmpage/lgb?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                        break;
                    case 'DIAN_QIAN_BENG':
                        window.location.href = '${ctx}/alarmpage/dqb?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                        break;
                    case 'GU_LI_JING':
                        window.location.href = '${ctx}/alarmpage/glj?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                        break;
                    default:                                                
                        switch(tmpName[2]){

                            case '自喷':
                                window.location.href = '${ctx}/alarmpage/zp?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                                break;
                            case '注汽':
                                window.location.href = '${ctx}/alarmpage/zq?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                                break;
                            case '焖井':
                                window.location.href = '${ctx}/alarmpage/mj?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                                break;
                            default:
                                window.location.href = '${ctx}/alarmpage/cyj?id=' + tmpName[0] + '&actionTime=' + tmpName[4];
                        }                                                
                }                  
            }  
                
            // 曲线点
            var mapPoint;
            
            /**
             * 报警信息初始化
             * @returns {undefined}
             */
            function doOnLoad(){
                
                $("#txtDx").val("");
                $("#txtBl").val("");
                $("#txtLx").val("");
                $("#txtSj").val("");
                
                // 获得实时报警信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/alarm/realtime',
                    dateType:'json',
                    success: function(json){
                        var loopIndex = 0;
                        var dateTmp;
                        
                        // 井名称
                        var jingName;
                        // 井Stage
                        var jingStage;
                        // 曲线参数
                        var seriesItme1;
                        var seriesItme1Tmp;
                        // 报警参数
                        var seriesItme2;
                        var seriesItme2Tmp;
                        
                        var seriesItme2Name;
                        // 报警对象
                        var baojingData;
                        // 负责人
                        var fuzerenData;
                        
                        // 遍历井
                        $.each(json,function(key, value){
                                
                            // 获得井扩展信息
                            $.ajax({
                                type: 'POST',
                                url: '${ctx}/alarm/endTagExtInfo',
                                data:{code:key},
                                dateType:'json',
                                success: function(json){

                                // 曲线参数
                                seriesItme1 = [];
                                // 报警参数
                                seriesItme2 = [];
                                seriesItme2Name = [];
                                // 报警对象
                                baojingData = new Object();
                                baojingData.rows = [];
                                // 负责人
                                fuzerenData = new Object();
                                fuzerenData.rows = [];
                            
                                    jingStage = json.stage;
                                    
                                    // 遍历报警信息
                                    $.each(value,function(itemkey, itemvalue){                         

                                        mapPoint = new Map();
                                        seriesItme1Tmp = [];
                                        seriesItme2Tmp = [];
                                        jingName = itemvalue.endTag.name;

                                        seriesItme1Tmp.push([Number(itemvalue.actionTime), 0]);
                                        seriesItme1Tmp.push([Number(itemvalue.actionTime), (value.length - itemkey)]);
                                        seriesItme1Tmp.push([Number(dateSysNow), (value.length - itemkey)]);

                                        seriesItme1.push(seriesItme1Tmp);

                                        seriesItme2Tmp.push([Number(itemvalue.actionTime), (value.length - itemkey)]);
                                        dateTmp = new Date(itemvalue.actionTime);
                                        mapPoint.set(itemvalue.actionTime, '报警时间:' + dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                                + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes() 
                                                + '<br/>' + '报警原因:' + itemvalue.info);

                                        $.each(itemvalue.alarmHandleList,function(alarmkey, alarmvalue){

                                            // 回复时间
                                            if(alarmvalue.confirmTime != null && alarmvalue.confirmTime != ''){
                                                seriesItme2Tmp.push([Number(alarmvalue.confirmTime), (value.length - itemkey)]);
                                                dateTmp = new Date(alarmvalue.confirmTime);
                                                mapPoint.set(alarmvalue.confirmTime, '回复时间:' + dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes() 
                                                        + '<br/>' + '负责人:' + alarmvalue.user.name);
                                            }
                                            // 处理时间
                                            if(alarmvalue.handleTime != null && alarmvalue.handleTime != ''){
                                                seriesItme2Tmp.push([Number(alarmvalue.handleTime), (value.length - itemkey)]);
                                                dateTmp = new Date(alarmvalue.confirmTime);
                                                mapPoint.set(alarmvalue.handleTime, '处理时间:' + dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes() 
                                                        + '<br/>' + '负责人:' + alarmvalue.user.name);
                                            }

                                            // 负责人
                                            var fuzerenItem = new Object();
                                            fuzerenItem.id = alarmvalue.user.id;
                                            fuzerenItem.data = [alarmvalue.user.name];
                                            fuzerenData.rows.push(fuzerenItem);
                                        });

                                        seriesItme2.push(seriesItme2Tmp);
                                        seriesItme2Name.push(mapPoint);

                                        // 报警对象
                                        var baojingItem = new Object();
                                        baojingItem.id = itemvalue.endTag.id + '||' + itemkey  + '||' + jingStage + '||' + itemvalue.endTag.subType + '||' + itemvalue.actionTime;
                                        baojingItem.data = [itemvalue.varCnName];
                                        baojingData.rows.push(baojingItem);
                                    }); 

                                    var strDivHtml = '  <div id="jxxtp_' + key + '" style="width:1200px; height:193px;border:solid; border-width:1px; border-color:#e6d5ff;  float:left; ">';
                                    strDivHtml += '         <div id="mcxxll1_' + key + '" style="float:left; height:193px; width:190px">';

                                    if(loopIndex % 2 === 0){                            
                                        strDivHtml += '             <div id="mcxxt1_' + key + '" style="background-color:#e3f5ff; height:22px; width:190px; text-align:center; font-size:14px; padding-top:6px;">';
                                    }else{
                                        strDivHtml += '             <div id="mcxxt1_' + key + '" style="background-color:#f5ffdc; height:22px; width:190px; text-align:center; font-size:14px; padding-top:6px;" >';
                                    }

        //                            strDivHtml += '             <div id="mcxxt1_' + key + '" style="background-color:#e3f5ff; height:22px; width:190px; text-align:center;cursor:hand; font-size:14px; padding-top:6px;"  onclick="runurl();">';
                                    strDivHtml += '                 <strong>井号：' + jingName + '</strong>';
                                    strDivHtml += '             </div>';
                                    strDivHtml += '             <div id="mcxx11_' + key + '" style=" height:81px; width:188px;cursor:pointer ; background-color:#0C3;" ></div>';
                                    strDivHtml += '             <div id="mcxx12_' + key + '" style=" height:81px; width:188px;cursor:pointer ; background-color:#03C;" ></div>';
                                    strDivHtml += '         </div>';
                                    strDivHtml += '         <div id="mcltb1_' + key + '" style=" height:193px; width:1035px; margin-left:190px;"></div>';
                                    strDivHtml += '     </div>';

                                    $("#qxContent").append(strDivHtml);                            

                                    // 报警对象
                                    grid1 = new dhtmlXGridObject('mcxx11_' + key);
                                    grid1.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                                    grid1.setHeader(["报警对象"]);
                                    grid1.setInitWidths("*");
                                    grid1.setColAlign("center");
                                    grid1.setColTypes("ro");
                                    grid1.init();

                                    // 负责人
                                    grid2 = new dhtmlXGridObject('mcxx12_' + key);
                                    grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                                    grid2.setHeader(["负 责 人"]);
                                    grid2.setInitWidths("*");
                                    grid2.setColAlign("center");
                                    grid2.setColTypes("ro");
                                    grid2.init();

                                    if(loopIndex % 2 === 0){                            
                                        grid1.setSkin("mt");
                                        grid2.setSkin("mt");
                                    }else{
                                        grid1.setSkin("modern");
                                        grid2.setSkin("modern");
                                    }

                                    grid1.parse(baojingData,'json');                            
                                    grid2.parse(fuzerenData,'json');

                                    // 事件绑定
                                    grid1.attachEvent('onRowSelect', doGrClick);
                                    loopIndex++;
                         
                                    options.series = [];
                                    series1.data = [];
                                    series2.data = [];

                                    for(var i = 0; i < seriesItme1.length; i++){

                                        var series1Tmp = new Object();
                                        var series2Tmp = new Object();

                                        $.extend(series1Tmp, series1);
                                        $.extend(series2Tmp, series2);

                                        series1Tmp.data = seriesItme1[i];
                                        series2Tmp.name = seriesItme2Name[i];
                                        series2Tmp.data = seriesItme2[i];

                                        options.series.push(series1Tmp);
                                        options.series.push(series2Tmp);
                                    }
                                    $('#mcltb1_' + key).highcharts('StockChart', options);
                                }
                            });                             
                        });
                    }
                }); 
                // 历史记录
                createTreeGrid();
            }            
            
            $(function () {
                $(".cssdiv1").addClass("s1");
            });
            
            function jk(cdiv){
                $(".cssdiv1").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","block");
                $("#gr1").css("display","none");
                $("#recinfoArea").children().css("width","1245px");
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
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/";
                treeGrid.setHeader("序号,报警对象,设备,变量名,报警类型,报警原因,报警时间,解除时间,其它信息,负责人,回复时间,处理时间,评价");
                treeGrid.setInitWidths("100,125,125,150,150,150,150,150,150,150,150,150,*");
                treeGrid.setColAlign("center,center,center,center,center,center,center,center,center,left,center,center,center");
                treeGrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,tree,ro,ro,ro");
//                treeGrid.enableMultiselect(true);
                
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
                            baojingItem.data.push(value.id);
                            baojingItem.data.push(value.endTag.name);
                            baojingItem.data.push(value.endTag.device.name);//待定
                            baojingItem.data.push(value.varCnName);
                            baojingItem.data.push(value.alarmType);
                            baojingItem.data.push(value.info);
                            
                            dateTmp = new Date(value.actionTime);
                            baojingItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());

                            if(value.status == "1"){
                                dateTmp = new Date(value.resumeTime);
                                baojingItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                            }else{
                                baojingItem.data.push("");
                            }
                            
                            baojingItem.data.push(value.remark);
                            
                            // 负责人信息设置
                            var fuzerenInfo = {};
                            fuzerenInfo.value = value.alarmHandleList.length + '人';
                            fuzerenInfo.image = 'folder.gif'; 
                            baojingItem.data.push(fuzerenInfo);
                            
                            baojingItem.rows = [];
                            $.each(value.alarmHandleList,function(alarmkey, alarmvalue){
                                var fuzerenInfoItem = {};
                                fuzerenInfoItem.id = 'fzr_' + alarmvalue.user.id + '_' + value.id;
                                fuzerenInfoItem.data = [];
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push(alarmvalue.user.name);
                                
                                dateTmp = new Date(alarmvalue.confirmTime);
                                fuzerenInfoItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                                
                                if(alarmvalue.handleTime == null){
                                    fuzerenInfoItem.data.push('');
                                }else{
                                    dateTmp = new Date(alarmvalue.handleTime);
                                    fuzerenInfoItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                            + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                                }
                                fuzerenInfoItem.data.push('');//待定
                                
                                baojingItem.rows.push(fuzerenInfoItem);
                            });                          

                            baojingData.rows.push(baojingItem);
                        });
                        treeGrid.init();
                        treeGrid.enablePaging(true,10,3, "recinfoArea");
                        treeGrid.setPagingSkin("toolbar", "dhx_skyblue");

                        treeGrid.parse(baojingData,'json');
                    }
                }); 
            }
            
            /**
             * 历史记录信息查询
             * @returns {undefined}
             */
            function searchHistoryData(){                
                
                treeGrid = new dhtmlXGridObject('wltp');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/";
                treeGrid.setHeader("序号,报警对象,设备,变量名,报警类型,报警原因,报警时间,解除时间,其它信息,负责人,回复时间,处理时间,评价");
                treeGrid.setInitWidths("100,125,125,150,150,150,150,150,150,150,150,150,*");
                treeGrid.setColAlign("center,center,center,center,center,center,center,center,center,left,center,center,center");
                treeGrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,tree,ro,ro,ro");
                treeGrid.enablePaging(true,10,3, "recinfoArea");
                treeGrid.setPagingSkin("toolbar", "dhx_skyblue");
                treeGrid.init();
                            
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
                            baojingItem.data.push(value.id);
                            baojingItem.data.push(value.endTag.name);
                            baojingItem.data.push(value.endTag.device.name);//待定
                            baojingItem.data.push(value.varCnName);
                            baojingItem.data.push(value.alarmType);
                            baojingItem.data.push(value.info);
                            
                            dateTmp = new Date(value.actionTime);
                            var dateBj = dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' + dateTmp.getDate();
                            baojingItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());

                            // 查询判定
                            // 报警对象
                            if(value.endTag.name.indexOf($.trim($("#txtDx").val())) < 0){
                                return true;
                            }
                            // 变量名
                            if(value.varCnName.indexOf($.trim($("#txtBl").val())) < 0){
                                return true;
                            }
                            // 报警类型
                            if(value.alarmType.indexOf($.trim($("#txtLx").val())) < 0){
                                return true;
                            }
                            // 报警时间
                            if(dateBj.indexOf($.trim($("#txtSj").val())) < 0){
                                return true;
                            }

                            if(value.status == "1"){
                                dateTmp = new Date(value.resumeTime);
                                baojingItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                            }else{
                                baojingItem.data.push("");
                            }
                            
                            baojingItem.data.push(value.remark);
                            
                            // 负责人信息设置
                            var fuzerenInfo = {};
                            fuzerenInfo.value = value.alarmHandleList.length + '人';
                            fuzerenInfo.image = 'folder.gif'; 
                            baojingItem.data.push(fuzerenInfo);
                            
                            baojingItem.rows = [];
                            $.each(value.alarmHandleList,function(alarmkey, alarmvalue){
                                var fuzerenInfoItem = {};
                                fuzerenInfoItem.id = 'fzr_' + alarmvalue.user.id + '_' + value.id;
                                fuzerenInfoItem.data = [];
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push('');
                                fuzerenInfoItem.data.push(alarmvalue.user.name);
                                
                                dateTmp = new Date(alarmvalue.confirmTime);
                                fuzerenInfoItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                        + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                                
                                if(alarmvalue.handleTime == null){
                                    fuzerenInfoItem.data.push('');
                                }else{
                                    dateTmp = new Date(alarmvalue.handleTime);
                                    fuzerenInfoItem.data.push(dateTmp.getFullYear() + '-' + (dateTmp.getMonth() + 1) + '-' 
                                            + dateTmp.getDate() + ' ' + dateTmp.getHours() + '：' + dateTmp.getMinutes());
                                }
                                fuzerenInfoItem.data.push('');//待定
                                
                                baojingItem.rows.push(fuzerenInfoItem);
                            });                          

                            baojingData.rows.push(baojingItem);
                        });
                        
                        treeGrid.parse(baojingData,'json');
                        
                        if(baojingData.rows.length == 0){
                            
                            dhtmlx.message({
                                title: "消息提示",
                                type: "alert",
                                text: "没有与搜索条件匹配的项！"
                            });
                        }
                    }
                }); 
            }
            
            function runurl(){
                window.location.href="bcxi.html";
            }
        </script>
    </head>
    <body>
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="scdt" style="width:1280px; height:69px;  float:left; font-size: 0 " class="ssjkd">
                <!--logo-->
                <div id="ssjc" style="width:1280px; height:10">
                    <img src="${ctx}/static/img/head.png" usemap="#planetmap" style="border: 0px"/>
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
                    <a  href="${ctx}/performancepage" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/scdt.png" style="width:126px; height:33px"/>
                    </a>
                </div>
                <div id="tool3" style="width:122px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a4">
                    <a  href="${ctx}/producepage" style="text-decoration:none">
                        <img  border="0" src="${ctx}/static/img/scgl.png" style="width:122px; height:33px"/>
                    </a>
                </div>
                <div id="tool4" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" class="a5">
                    <a  href="${ctx}/managepage" style="text-decoration:none">
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
                    <div id="gr" style="width:1245px; height:602px; overflow:scrol; float:left;display:none;overflow:scrol;">
                        <!--历史记录-->
                        <div id="qm" style="width:375px; height:10; background-color:#e6d5ff; font-size:14px; font-weight:bold; line-height:19px;border:solid; border-color:#e6d5ff; border-width:1px;  float:left">
                            &nbsp;&nbsp;&nbsp历&nbsp;&nbsp;&nbsp史&nbsp;&nbsp;&nbsp记&nbsp;&nbsp;&nbsp录
                        </div>
                        <div style="width:100px;height:19px;  line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            报&nbsp;&nbsp;警&nbsp;&nbsp;对&nbsp;&nbsp;象
                        </div>
                        <div style="width:100px; height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtDx" id="txtDx" style=" height:13px; width:80px;"/>
                        </div>
                        <div style="width:100px;height:19px;  line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            变&nbsp;&nbsp;量&nbsp;&nbsp;名
                        </div>
                        <div style="width:100px; height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtBl" id="txtBl" style=" height:13px; width:80px;"/>
                        </div>
                         <div style="width:100px;height:19px;  line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            报&nbsp;&nbsp;警&nbsp;&nbsp;类&nbsp;&nbsp;型
                        </div>
                        <div style="width:100px; height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtLx" id="txtLx" style=" height:13px; width:80px;"/>
                        </div>
                        <div style="width:100px;height:19px;  line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            报&nbsp;&nbsp;警&nbsp;&nbsp;时&nbsp;&nbsp;间
                        </div>
                        <div style="width:100px; height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <input type="text" name="txtSj" id="txtSj" style=" height:13px; width:80px;" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-M-d'})"/>
                        </div>
                        <div style="width:50px; height:19px; background-color:#e6d5ff; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                            <img src="${ctx}/static/img/chaxun.png" onclick="searchHistoryData();" style="cursor:pointer" />
                        </div>
                        <div id="wltp" style="width:1245px; height:547px; border:solid; border-color:#e6d5ff; border-width:1px;  float:left">
                        </div>
                        <div id="recinfoArea" style="width:1236px; height:30px;  float: left;">

                        </div>
                    </div>
                    <div id="gr1" style="width:1245px; height:578px; overflow:scrol; float:left;">
                        <!--曲线图--> 
                        <div id="ssjl" style=" width:1245px; height:599px;border:solid; border-color:#aad3ff; border-width:1px;  float:left">
                            <div id="jxx" style="width:1245px; height:20px; background-color:#8ed4ff; font-size:14px; font-weight:bold; line-height:20px;float:left">
                                &nbsp;&nbsp;实&nbsp;&nbsp;&nbsp时&nbsp;&nbsp;&nbsp信&nbsp;&nbsp;&nbsp息
                            </div>
                            <div id="qxContent" style="height: 580px; overflow:auto;">            
                            </div>
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

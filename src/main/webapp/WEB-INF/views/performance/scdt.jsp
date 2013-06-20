<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生产动态</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/style/demo.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/style/zTreeStyle.css" />
        <script type="text/javascript" src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/highcharts.src.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/chart2.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/math.js"></script>
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
            var treeGrid,dhxWins,dhxWins1,tree;
            var drljl='<div id="dqlj" style="width:400px;height:200px"><img src="imagess/drljl.png"</div>';
            var ypj='<div id="ypj" style="width:400px;height:200px"><img src="imagess/ypj.png"</div>';
            var xpj='<div id="xpj" style="width:400px;height:200px"><img src="imagess/xpj.png"</div>';
            var bq='<div id="bq" style="width:400px;height:200px"><img src="imagess/bq.png"</div>';
 
            //树状控件
            var IDMark_A = "_a";
            var setting = {
                view: {
                    addDiyDom: addDiyDom
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback : { 
                           onClick: onClick
                }
            };

            var zNodes =[
                { id:'1', pId:'0', name:"产油量", open:true},
                { id:'1_11', pId:'1', name:"七队产油量"},
                { id:'1_11_111', pId:'1_11', name:"HJSH127-21产油量"},
                { id:'1_11_112', pId:'1_11', name:"HJSH127-22产油量"},
                { id:'12', pId:'1', name:"八队产油量"},
                { id:'13', pId:'1', name:"九队产油量"},
                { id:'2', pId:'0', name:"产液量", open:true},
                { id:'21', pId:'2', name:"七队产液量"},
                { id:'22', pId:'2', name:"八队产液量"},
                { id:'23', pId:'2', name:"九队产液量"},
                { id:'3', pId:'0', name:"产气量", open:true},
                { id:'31', pId:'3', name:"七队产汽量"},
                { id:'32', pId:'3', name:"八队产汽量"},
                { id:'33', pId:'3', name:"九队产汽量"},			
                { id:'3', pId:'0', name:"油井开井数", open:true},
                { id:'31', pId:'3', name:"七队油井开井数"},
                { id:'32', pId:'3', name:"八队油井开井数"},
                { id:'33', pId:'3', name:"九队油井开井数"},			
                { id:'3', pId:'0', name:"油井用电量", open:true},
                { id:'31', pId:'3', name:"七队油井用电量"},
                { id:'32', pId:'3', name:"八队油井用电量"},
                { id:'33', pId:'3', name:"九队油井用电量"},			
                { id:'3', pId:'0', name:"油井注气量", open:true},
                { id:'31', pId:'3', name:"七队油井注气量"},
                { id:'32', pId:'3', name:"八队油井注气量"},
                { id:'33', pId:'3', name:"九队油井注气量"},			
                { id:'3', pId:'0', name:"注水量", open:true},
                { id:'31', pId:'3', name:"七队注水量"},
                { id:'32', pId:'3', name:"八队注水量"},
                { id:'33', pId:'3', name:"九队注水量"},			
                { id:'3', pId:'0', name:"水井开井数", open:true},
                { id:'31', pId:'3', name:"七队产汽量"},
                { id:'32', pId:'3', name:"七队产汽量"},
                { id:'33', pId:'3', name:"七队产汽量"}
            ];
			
            /**
             * 生产动态初始化
             * @returns {undefined}
             */
            function scdt(){

                // 列表信息
                createTreeGrid();
//                createWindows();
//                createWindows1();
                $(".cssdiv").addClass("s1");
            }
            
            // 组织机构信息
            var strMajorTag;
            // 已选择组织机构
            var selMajorTagData = ',';
            var selMajorTagData_liquid = ',';
            var selMajorTagData_ele = ',';
            // 天数
            var days = 0;
            // 旬数
            var xun_days = 0;
            // 今日开井数
            var run_status_day = 0;
            // 昨日开井数
            var run_status_yesterday = 0;
            // 前日开井数
            var run_status_before = 0;
                
            /**
             * 列表信息绑定
             * @returns {undefined}
             */
            function createTreeGrid(){
                
                // 已选择组织机构
                selMajorTagData = ',';
                selMajorTagData_liquid = ',';
                selMajorTagData_ele = ',';

                treeGrid= new dhtmlXGridObject('sz');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("指标名称,当日量累计,比前,月,#cspan,#cspan,旬,#cspan,#cspan");
                treeGrid.attachHeader(["#rspan", "#rspan","#rspan","平均", "同比","环比","平均", "同比","环比"]);
                treeGrid.setInitWidths("200,200,200,110,110,110,110,110,*");
                treeGrid.setColAlign("left,center,center,center,center,center,center,center,center");
                treeGrid.setColTypes("tree,ed,ed,ed,ed,ed,ed,ed,ed");
                treeGrid.init();

                // 生产动态信息
                var scdtData = new Object();
                scdtData.rows = [];
                
                // 生产动态详细信息
                var scdtItemData;
                // 生产动态根节点
                var scdtItemRootData; 
                
                // 获得机构信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/performance/getDateData',
                    dateType:'json',
                    success: function(jsonDate){

                        // 天数
                        days = jsonDate.days;
                        // 旬数
                        xun_days = jsonDate.xun_days;
                        
                        // 获得机构信息
                        $.ajax({
                            type: 'POST',
                            url: '${ctx}/realtime/majortag',
                            dateType:'json',
                            success: function(json){
                                strMajorTag = json;
                                if(json != ''){
                                    // 获得井数据信息
                                    $.ajax({
                                        type: 'POST',
                                        url: '${ctx}/performance/getMajorDataList',
                                        dateType:'json',
                                        success: function(jsonYoujing){

                                            // 今日开井数
                                            run_status_day = 0;
                                            // 昨日开井数
                                            run_status_yesterday = 0;
                                            // 前日开井数
                                            run_status_before = 0;
                                            
                                            // 产油量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'cyl';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '产油量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            var tmpGridInfo = createGridItem(strMajorTag, jsonYoujing, 0);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 产液量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'cyel';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '产液量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_liquid(strMajorTag, jsonYoujing, 0);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 产气量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'cql';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '产气量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);
                                            scdtItemData.data.push(0);

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 油井开井数            
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'yjkj';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '油井开井数';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            scdtItemData.data.push(run_status_day);
                                            scdtItemData.data.push(run_status_yesterday - run_status_before);
                                            scdtItemData.data.push("-");
                                            scdtItemData.data.push("-");
                                            scdtItemData.data.push("-");
                                            scdtItemData.data.push("-");
                                            scdtItemData.data.push("-");
                                            scdtItemData.data.push("-");

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 油井用电量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'yjydl';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '油井用电量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_ele(strMajorTag, jsonYoujing, 0);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            treeGrid.clearAll();
                                            treeGrid.parse(scdtData,'json');
                                        }
                                    });
                                }
                            }
                        });
                    }
                });                
            }
            
             /**
             * 信息子级信息生成(产油量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem(p_MajorTagList, p_EndTagList, p_parentId){
               
                // 今日累计
                var major_dayCount = 0;
                // 昨日累计
                var major_yesterdayCount = 0;
                // 前日累计
                var major_beforeYesterdayCount = 0;
                // 当月累计
                var major_monCount = 0;
                // 去年当月累计
                var major_lastyearMonCount = 0;
                // 上月累计
                var major_beforeMonCount = 0;
                // 当旬累计
                var major_xunCount = 0;
                // 上月当旬累计
                var major_lastmonXunCount = 0;
                // 上旬累计
                var major_beforeXunCount = 0;
                       
                var tmpGridData = [];
                var tmpReturnGridData = new Object(); 

                // 今日累计
                tmpReturnGridData.dayCount = 0;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = 0;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = 0;
                // 当月累计
                tmpReturnGridData.monCount = 0;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = 0;
                // 上月累计
                tmpReturnGridData.beforeMonCount = 0;
                // 当旬累计
                tmpReturnGridData.xunCount = 0;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = 0;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = 0;
                
                // 封装信息JSON
                $.each(p_MajorTagList, function(keyMajorTag, valueMajorTag){
                    
                    if(valueMajorTag.pid == p_parentId && (selMajorTagData.indexOf(',' + valueMajorTag.id + ',') < 0))
                    {
                        selMajorTagData += valueMajorTag.id + ',';

                        var tmpMajorTag = new Object(); 
                        tmpMajorTag.id = valueMajorTag.id;
                        tmpMajorTag.data = [];
                        tmpMajorTag.data.push(valueMajorTag.name);
                        tmpMajorTag.rows = [];

                        if(valueMajorTag.type == 'DUI_LEVEL'){

                            // 今日累计
                            var dayCount = 0;
                            // 昨日累计
                            var yesterdayCount = 0;
                            // 前日累计
                            var beforeYesterdayCount = 0;
                            // 当月累计
                            var monCount = 0;
                            // 去年当月累计
                            var lastyearMonCount = 0;
                            // 上月累计
                            var beforeMonCount = 0;
                            // 当旬累计
                            var xunCount = 0;
                            // 上月当旬累计
                            var lastmonXunCount = 0;
                            // 上旬累计
                            var beforeXunCount = 0;                        

                            // 遍历油井
                            $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                                if(valueYoujing.major_tag_id == valueMajorTag.id){

                                    var tmpEndTag = new Object(); 
                                    tmpEndTag.id = 'j_' + valueYoujing.id;
                                    tmpEndTag.data = []; 
                                    tmpEndTag.data.push(valueYoujing.name);                                
                                    tmpEndTag.data.push(valueYoujing.day_count);
                                    tmpEndTag.data.push(valueYoujing.before_count);
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_avg, 100)), 100));
                                    tmpEndTag.data.push(valueYoujing.mon_tongbi);
                                    tmpEndTag.data.push(valueYoujing.mon_huanbi);
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_avg, 100)), 100));
                                    tmpEndTag.data.push(valueYoujing.xun_tongbi);
                                    tmpEndTag.data.push(valueYoujing.xun_huanbi);

                                    tmpMajorTag.rows.push(tmpEndTag);
//alert(valueYoujing.run_status_day + "--" + valueYoujing.run_status_yesterday + "--" + valueYoujing.run_status_before);
                                    // 今日开井数
                                    run_status_day = accAdd(run_status_day, valueYoujing.run_status_day > 0 ? 1 : 0);
                                    // 昨日开井数
                                    run_status_yesterday = accAdd(run_status_yesterday, valueYoujing.run_status_yesterday);
                                    // 前日开井数
                                    run_status_before = accAdd(run_status_before, valueYoujing.run_status_before);
            
                                    // 今日累计
                                    dayCount = accAdd(dayCount, valueYoujing.day_count);
                                    // 昨日累计
                                    yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count);
                                    // 前日累计
                                    beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count);
                                    // 当月累计
                                    monCount = accAdd(monCount, valueYoujing.mon_count);
                                    // 去年当月累计
                                    lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count);
                                    // 上月累计
                                    beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count);
                                    // 当旬累计
                                    xunCount = accAdd(xunCount, valueYoujing.xun_count);
                                    // 上月当旬累计
                                    lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count);
                                    // 上旬累计
                                    beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count);
                                }              
                            });

                            tmpMajorTag.data.push(dayCount);
                            tmpMajorTag.data.push(accSub(yesterdayCount, beforeYesterdayCount));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, lastyearMonCount), lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, beforeMonCount), beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, lastmonXunCount), lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, beforeXunCount), beforeXunCount), 100)), 100));
       
                            // 供上级使用
                            // 今日累计
                            major_dayCount = accAdd(major_dayCount, dayCount);
                            // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, yesterdayCount);
                            // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, beforeYesterdayCount);
                            // 当月累计
                            major_monCount = accAdd(major_monCount, monCount);
                            // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, lastyearMonCount);
                            // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, beforeMonCount);
                            // 当旬累计
                            major_xunCount = accAdd(major_xunCount, xunCount);
                            // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, lastmonXunCount);
                            // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, beforeXunCount);
                        }else{

                            var tmpGridInfo = createGridItem(p_MajorTagList, p_EndTagList, valueMajorTag.id);
                            
                            tmpMajorTag.data.push(tmpGridInfo.dayCount);
                            tmpMajorTag.data.push(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));
                            
                            tmpMajorTag.rows = tmpGridInfo.data;
                                
                             // 供上级使用
                                    // 今日累计
                            major_dayCount = accAdd(major_dayCount, tmpGridInfo.dayCount);
                                    // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, tmpGridInfo.yesterdayCount);
                                    // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, tmpGridInfo.beforeYesterdayCount);
                                    // 当月累计
                            major_monCount = accAdd(major_monCount, tmpGridInfo.monCount);
                                    // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, tmpGridInfo.lastyearMonCount);
                                    // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, tmpGridInfo.beforeMonCount);
                                    // 当旬累计
                            major_xunCount = accAdd(major_xunCount, tmpGridInfo.xunCount);
                                    // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, tmpGridInfo.lastmonXunCount);
                                    // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, tmpGridInfo.beforeXunCount);
                        }
                        
                        tmpGridData.push(tmpMajorTag);
                    }else{
                        return true;
                    }
                }); 

                // 今日累计
                tmpReturnGridData.dayCount = major_dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = major_yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = major_beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = major_monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = major_lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = major_beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = major_xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = major_lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = major_beforeXunCount;
                tmpReturnGridData.data = tmpGridData;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(产液量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_liquid(p_MajorTagList, p_EndTagList, p_parentId){
               
                // 今日累计
                var major_dayCount = 0;
                // 昨日累计
                var major_yesterdayCount = 0;
                // 前日累计
                var major_beforeYesterdayCount = 0;
                // 当月累计
                var major_monCount = 0;
                // 去年当月累计
                var major_lastyearMonCount = 0;
                // 上月累计
                var major_beforeMonCount = 0;
                // 当旬累计
                var major_xunCount = 0;
                // 上月当旬累计
                var major_lastmonXunCount = 0;
                // 上旬累计
                var major_beforeXunCount = 0;
                       
                var tmpGridData = [];
                var tmpReturnGridData = new Object(); 

                // 今日累计
                tmpReturnGridData.dayCount = 0;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = 0;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = 0;
                // 当月累计
                tmpReturnGridData.monCount = 0;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = 0;
                // 上月累计
                tmpReturnGridData.beforeMonCount = 0;
                // 当旬累计
                tmpReturnGridData.xunCount = 0;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = 0;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = 0;
                
                // 封装信息JSON
                $.each(p_MajorTagList, function(keyMajorTag, valueMajorTag){
                    
                    if(valueMajorTag.pid == p_parentId && (selMajorTagData_liquid.indexOf(',' + valueMajorTag.id + ',') < 0))
                    {
                        selMajorTagData_liquid += valueMajorTag.id + ',';

                        var tmpMajorTag = new Object(); 
                        tmpMajorTag.id = valueMajorTag.id + '_liquid';
                        tmpMajorTag.data = [];
                        tmpMajorTag.data.push(valueMajorTag.name);
                        tmpMajorTag.rows = [];

                        if(valueMajorTag.type == 'DUI_LEVEL'){

                            // 今日累计
                            var dayCount = 0;
                            // 昨日累计
                            var yesterdayCount = 0;
                            // 前日累计
                            var beforeYesterdayCount = 0;
                            // 当月累计
                            var monCount = 0;
                            // 去年当月累计
                            var lastyearMonCount = 0;
                            // 上月累计
                            var beforeMonCount = 0;
                            // 当旬累计
                            var xunCount = 0;
                            // 上月当旬累计
                            var lastmonXunCount = 0;
                            // 上旬累计
                            var beforeXunCount = 0;                        

                            // 遍历油井
                            $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                                if(valueYoujing.major_tag_id == valueMajorTag.id){

                                    var tmpEndTag = new Object(); 
                                    tmpEndTag.id = 'j_' + valueYoujing.id + '_liquid';
                                    tmpEndTag.data = []; 
                                    tmpEndTag.data.push(valueYoujing.name);                                
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.day_count_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.before_count_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_avg_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_tongbi_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_huanbi_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_avg_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_tongbi_liquid, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_huanbi_liquid, 100)), 100));

                                    tmpMajorTag.rows.push(tmpEndTag);

                                    // 今日累计
                                    dayCount = accAdd(dayCount, valueYoujing.day_count_liquid);
                                    // 昨日累计
                                    yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count_liquid);
                                    // 前日累计
                                    beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count_liquid);
                                    // 当月累计
                                    monCount = accAdd(monCount, valueYoujing.mon_count_liquid);
                                    // 去年当月累计
                                    lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count_liquid);
                                    // 上月累计
                                    beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count_liquid);
                                    // 当旬累计
                                    xunCount = accAdd(xunCount, valueYoujing.xun_count_liquid);
                                    // 上月当旬累计
                                    lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count_liquid);
                                    // 上旬累计
                                    beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count_liquid);
                                }              
                            });

                            tmpMajorTag.data.push(accDiv(Math.round(accMul(dayCount, 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accSub(yesterdayCount, beforeYesterdayCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, lastyearMonCount), lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, beforeMonCount), beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, lastmonXunCount), lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, beforeXunCount), beforeXunCount), 100)), 100));
       
                            // 供上级使用
                            // 今日累计
                            major_dayCount = accAdd(major_dayCount, dayCount);
                            // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, yesterdayCount);
                            // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, beforeYesterdayCount);
                            // 当月累计
                            major_monCount = accAdd(major_monCount, monCount);
                            // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, lastyearMonCount);
                            // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, beforeMonCount);
                            // 当旬累计
                            major_xunCount = accAdd(major_xunCount, xunCount);
                            // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, lastmonXunCount);
                            // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, beforeXunCount);
                        }else{

                            var tmpGridInfo = createGridItem_liquid(p_MajorTagList, p_EndTagList, valueMajorTag.id);
                            
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));
                            
                            tmpMajorTag.rows = tmpGridInfo.data;
                                
                             // 供上级使用
                                    // 今日累计
                            major_dayCount = accAdd(major_dayCount, tmpGridInfo.dayCount);
                                    // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, tmpGridInfo.yesterdayCount);
                                    // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, tmpGridInfo.beforeYesterdayCount);
                                    // 当月累计
                            major_monCount = accAdd(major_monCount, tmpGridInfo.monCount);
                                    // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, tmpGridInfo.lastyearMonCount);
                                    // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, tmpGridInfo.beforeMonCount);
                                    // 当旬累计
                            major_xunCount = accAdd(major_xunCount, tmpGridInfo.xunCount);
                                    // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, tmpGridInfo.lastmonXunCount);
                                    // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, tmpGridInfo.beforeXunCount);
                        }
                        
                        tmpGridData.push(tmpMajorTag);
                    }else{
                        return true;
                    }
                }); 

                // 今日累计
                tmpReturnGridData.dayCount = major_dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = major_yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = major_beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = major_monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = major_lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = major_beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = major_xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = major_lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = major_beforeXunCount;
                tmpReturnGridData.data = tmpGridData;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(油井用电量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_ele(p_MajorTagList, p_EndTagList, p_parentId){
               
                // 今日累计
                var major_dayCount = 0;
                // 昨日累计
                var major_yesterdayCount = 0;
                // 前日累计
                var major_beforeYesterdayCount = 0;
                // 当月累计
                var major_monCount = 0;
                // 去年当月累计
                var major_lastyearMonCount = 0;
                // 上月累计
                var major_beforeMonCount = 0;
                // 当旬累计
                var major_xunCount = 0;
                // 上月当旬累计
                var major_lastmonXunCount = 0;
                // 上旬累计
                var major_beforeXunCount = 0;
                       
                var tmpGridData = [];
                var tmpReturnGridData = new Object(); 

                // 今日累计
                tmpReturnGridData.dayCount = 0;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = 0;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = 0;
                // 当月累计
                tmpReturnGridData.monCount = 0;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = 0;
                // 上月累计
                tmpReturnGridData.beforeMonCount = 0;
                // 当旬累计
                tmpReturnGridData.xunCount = 0;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = 0;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = 0;
                
                // 封装信息JSON
                $.each(p_MajorTagList, function(keyMajorTag, valueMajorTag){
                    
                    if(valueMajorTag.pid == p_parentId && (selMajorTagData_ele.indexOf(',' + valueMajorTag.id + ',') < 0))
                    {
                        selMajorTagData_ele += valueMajorTag.id + ',';

                        var tmpMajorTag = new Object(); 
                        tmpMajorTag.id = valueMajorTag.id + '_ele';
                        tmpMajorTag.data = [];
                        tmpMajorTag.data.push(valueMajorTag.name);
                        tmpMajorTag.rows = [];

                        if(valueMajorTag.type == 'DUI_LEVEL'){

                            // 今日累计
                            var dayCount = 0;
                            // 昨日累计
                            var yesterdayCount = 0;
                            // 前日累计
                            var beforeYesterdayCount = 0;
                            // 当月累计
                            var monCount = 0;
                            // 去年当月累计
                            var lastyearMonCount = 0;
                            // 上月累计
                            var beforeMonCount = 0;
                            // 当旬累计
                            var xunCount = 0;
                            // 上月当旬累计
                            var lastmonXunCount = 0;
                            // 上旬累计
                            var beforeXunCount = 0;                        

                            // 遍历油井
                            $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                                if(valueYoujing.major_tag_id == valueMajorTag.id){

                                    var tmpEndTag = new Object(); 
                                    tmpEndTag.id = 'j_' + valueYoujing.id + '_ele';
                                    tmpEndTag.data = []; 
                                    tmpEndTag.data.push(valueYoujing.name);                                
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.day_count_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.before_count_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_avg_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_tongbi_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.mon_huanbi_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_avg_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_tongbi_ele, 100)), 100));
                                    tmpEndTag.data.push(accDiv(Math.round(accMul(valueYoujing.xun_huanbi_ele, 100)), 100));

                                    tmpMajorTag.rows.push(tmpEndTag);

                                    // 今日累计
                                    dayCount = accAdd(dayCount, valueYoujing.day_count_ele);
                                    // 昨日累计
                                    yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count_ele);
                                    // 前日累计
                                    beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count_ele);
                                    // 当月累计
                                    monCount = accAdd(monCount, valueYoujing.mon_count_ele);
                                    // 去年当月累计
                                    lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count_ele);
                                    // 上月累计
                                    beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count_ele);
                                    // 当旬累计
                                    xunCount = accAdd(xunCount, valueYoujing.xun_count_ele);
                                    // 上月当旬累计
                                    lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count_ele);
                                    // 上旬累计
                                    beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count_ele);
                                }              
                            });

                            tmpMajorTag.data.push(accDiv(Math.round(accMul(dayCount, 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accSub(yesterdayCount, beforeYesterdayCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, lastyearMonCount), lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(monCount, beforeMonCount), beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, lastmonXunCount), lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(xunCount, beforeXunCount), beforeXunCount), 100)), 100));
       
                            // 供上级使用
                            // 今日累计
                            major_dayCount = accAdd(major_dayCount, dayCount);
                            // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, yesterdayCount);
                            // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, beforeYesterdayCount);
                            // 当月累计
                            major_monCount = accAdd(major_monCount, monCount);
                            // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, lastyearMonCount);
                            // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, beforeMonCount);
                            // 当旬累计
                            major_xunCount = accAdd(major_xunCount, xunCount);
                            // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, lastmonXunCount);
                            // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, beforeXunCount);
                        }else{

                            var tmpGridInfo = createGridItem_ele(p_MajorTagList, p_EndTagList, valueMajorTag.id);
                            
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                            tmpMajorTag.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));
                            
                            tmpMajorTag.rows = tmpGridInfo.data;
                                
                             // 供上级使用
                                    // 今日累计
                            major_dayCount = accAdd(major_dayCount, tmpGridInfo.dayCount);
                                    // 昨日累计
                            major_yesterdayCount = accAdd(major_yesterdayCount, tmpGridInfo.yesterdayCount);
                                    // 前日累计
                            major_beforeYesterdayCount = accAdd(major_beforeYesterdayCount, tmpGridInfo.beforeYesterdayCount);
                                    // 当月累计
                            major_monCount = accAdd(major_monCount, tmpGridInfo.monCount);
                                    // 去年当月累计
                            major_lastyearMonCount = accAdd(major_lastyearMonCount, tmpGridInfo.lastyearMonCount);
                                    // 上月累计
                            major_beforeMonCount = accAdd(major_beforeMonCount, tmpGridInfo.beforeMonCount);
                                    // 当旬累计
                            major_xunCount = accAdd(major_xunCount, tmpGridInfo.xunCount);
                                    // 上月当旬累计
                            major_lastmonXunCount = accAdd(major_lastmonXunCount, tmpGridInfo.lastmonXunCount);
                                    // 上旬累计
                            major_beforeXunCount = accAdd(major_beforeXunCount, tmpGridInfo.beforeXunCount);
                        }
                        
                        tmpGridData.push(tmpMajorTag);
                    }else{
                        return true;
                    }
                }); 

                // 今日累计
                tmpReturnGridData.dayCount = major_dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = major_yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = major_beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = major_monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = major_lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = major_beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = major_xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = major_lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = major_beforeXunCount;
                tmpReturnGridData.data = tmpGridData;
                
                return tmpReturnGridData;
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
            
            function createWindows(){
                dhxWins = new dhtmlXWindows();
                dhxWins.attachViewportTo(document.body);
                dhxWins.createWindow("win",200,200,450,310);
                dhxWins.window("win").button('minmax2').hide();
                dhxWins.window("win").button('minmax1').hide();
                dhxWins.window("win").button('park').hide();
                dhxWins.window("win").hide();	
            }	
            
            function createWindows1(){
                dhxWins1 = new dhtmlXWindows();
                dhxWins1.attachViewportTo(document.body);
                dhxWins1.createWindow("win1",200,200,380,200);
                dhxWins1.window("win1").button('minmax2').hide();
                dhxWins1.window("win1").button('minmax1').hide();
                dhxWins1.window("win1").button('park').hide();
                dhxWins1.window("win1").hide();	
            }	
	
            var cy =[15000,42000,33000,71000,44000];	
	
            //树状控件
            function addDiyDom(treeId, treeNode) {
                var aObj = $("#" + treeNode.tId + IDMark_A);
                //父节点
                if (treeNode.level == 0) {
                    var editStr = "<input type='checkbox' class='checkboxBtn' id='checkbox_" +treeNode.id+ "' onfocus='this.blur();'></input>";
                    aObj.before(editStr);
                    var btn = $("#checkbox_"+treeNode.id);
                    if (btn) 
                        btn.bind("change", function(){
                            checkAccessories(treeNode, btn);
                        });
                //子节点
                }else if(treeNode.level >= 1){
                    var idAry = [];
                    idAry = treeNode.getParentNode().id.split("_");//截取字符串
                    var editStr = "<input type='radio' class='radioBtn' id='radio_" +treeNode.id+ "' name='radio_"+idAry[0]+"'onfocus='this.blur();'></input>";
                    aObj.before(editStr);
                    var btn = $("#radio_"+treeNode.id);
                    if (btn) 
                        btn.bind("click", function() {checkBrand(treeNode, btn);});
                }
            }

            //单机节点事件
            function onClick(e,treeId, treeNode) {
		   
                var btn = $("#radio_"+treeNode.id);			
                checkBrand(treeNode, btn);
			
                if(treeNode.id == 1){				
                    te(cy);				
                    var checkedRadio = getCheckedRadio("radio_"+treeNode.id);				
                    if(checkedRadio != null){					
                        checkw(treeNode, checkedRadio);					
					}
				}			
            }
            
            //去掉单选
            function checkw(treeNode, checkedRadio){
                checkedRadio.attr("checked",false);
			}
            
            //多选触发事件
            function checkAccessories(treeNode, btn) {
                var checkedRadio = getCheckedRadio("radio_"+treeNode.id);
                if (btn.attr("checked")) {
                    if(checkedRadio!=null){
                        checkedRadio.attr("checked", false);
                    }
                    if (!checkedRadio) {
                        if(treeNode.id==1){
                            $("#container1").css("display","block");
                        }
                        else{
                            if(treeNode.id==3){
                                $("#container2").css("display","block");
                            }
                        }
                        $("#radio_" + treeNode.children[0].id).attr("checked", false);
                    }
                } else {
                    //取消时触发的事件
                    if(checkedRadio!=null){
                        checkedRadio.attr("checked", false);
                        if(treeNode.id==1){
                            $("#container1").css("display","none");
                        }else{
                            if(treeNode.id==3){
                                $("#container2").css("display","none");
                            }
                        }
					}else{
						if(treeNode.id==1){
                            $("#container1").css("display","none");
                        }else{
                            if(treeNode.id==3){
                                $("#container2").css("display","none");
                            }
                        }
                    }
                }
            }
            
            var h=[15000,52000,23000,71000,84000];
            
            //单选触发事件
            function checkBrand(treeNode, btn) {
			
                if (btn.attr("checked")) {
                    var pObj = $("#checkbox_" + treeNode.getParentNode().id);
                    if (pObj.attr("checked")) {
                        te(h);
                        pObj.attr("checked", true);
                    }else{
                        pObj.attr("checked", true);
                        alert(treeNode.id);
					}
                }else{
                    te(h);
					btn.attr("checked", true);
                }
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.selectNode(treeNode);
            }
		
            function getCheckedRadio(radioName){
                var r = document.getElementsByName(radioName);
                for(var i=0; i<r.length; i++){
                    if(r[i].checked){
                        return $(r[i]);
                    }
                }
                return null;
            }

            $(document).ready(function(){
                $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            });		
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
            .radioBtn {height: 16px;vertical-align: middle;}
            .checkboxBtn {vertical-align: middle;margin-right: 2px;}
        </STYLE>
    </head>
    <body onload="scdt();">
        <div id="divkd"></div>
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="scdt" style="width:1280px; height:69px;  float:left; font-size:0 ">
                <!--logo-->
                <div id="ssjc" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png"/>
                </div>
                <div id="tool" style="width:119px; height:20;  border-right-style:solid;border-right-color:#06F; border-right-width:1px; float:left">
                    <a  href="${ctx}/main" style="text-decoration:none"><img border="0" src="${ctx}/static/img/ssjk.png" style="width:119px; height:33px"/></a>
                </div>
                <div id="tool1" style="width:125px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a   href="${ctx}/alarmpage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/bjzt.png"/></a>
                </div>
                <div id="tool2" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="${ctx}/performancepage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/scdt_red.png" style="width:126px;height:33px"/></a>
                </div>
                <div id="tool3" style="width:122px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="scjl.html" style="text-decoration:none"><img  border="0" src="${ctx}/static/img/scgl.png"  style="width:122px; height:33px"/></a>
                </div>
                <div id="tool4" style="width:126px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a  href="wltp.html" style="text-decoration:none"><img border="0"  src="${ctx}/static/img/txwl.png" style="width:126px; height:33px"/></a>
                </div>
                <div id="tool5" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <img src="${ctx}/static/img/yjcz.png" style="width:120px; height:33px" />
                </div>
                <div id="tool7" style="width:535px; height:20; float:left" >
                    <img src="${ctx}/static/img/tp.png" style="width:535px; height:33px" />
                </div>
                <!--竖div-->
                <div id="zhylll" style="width:33px;  height:602px; float:left;">  
                    <div id="jkxx" class="cssdiv" onclick="jk(this);" style=" width:32px; height:120px;cursor:pointer;background-color:#e6d5ff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;">
                        &nbsp;&nbsp;列<br />&nbsp;&nbsp;表<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div> 
                    <div id="zyz" class="cssdiv1" onclick="jk1(this);"  style=" width:32px; height:120px;cursor:pointer;  background-color:#fce1cc; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                        &nbsp;&nbsp;实<br />&nbsp;&nbsp;时<br />&nbsp;&nbsp;曲<br />&nbsp;&nbsp;线
                    </div>
                    <div id="zkk" class="cssdiv3" style=" width:32px; height:357px;cursor:pointer;  background-color:#fff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">

                    </div>
                </div>
                <div id="zhyrrr" style="width:1245px; height:597px; overflow:scrol; float:left">
                    <div id="gr" style="width:1245px; height:595px; overflow:scrol; float:left">
                        <div id="qm" style="width:1245px; height:19px; background-color:#e6d5ff;border:solid; font-size:14px; line-height:22px; font-weight:bold; border-color:#e6d5ff; border-width:1px;  float:left">
                            &nbsp;&nbsp;&nbsp;油&nbsp;&nbsp;&nbsp;田&nbsp;&nbsp;&nbsp一&nbsp;&nbsp;&nbsp;区
                        </div>
                        <div id="sz" style="width:1245px; height:578px; background-color:#FFE0BB;  border:solid; border-color:#e6d5ff; border-width:1px;float:left" >
                        </div>
                    </div>
                    <div id="gr1" class="content_wrap" style="width:1245px; height:578px; overflow:scrol; float:left;display:none;overflow:scrol; ">
                        <div id="ssqx" style="width:1245px; height:23px; background-color:#fce1cc;border:solid;  font-size:14px; line-height:22px; font-weight:bold;border-color:#fce1cc; border-width:1px;  float:left" >
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;实&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;曲&nbsp;&nbsp;&nbsp;线</td>
                                    <td align="right" style="padding-right:10px">
                                        统计时间：
                                        <input type="text" name="textfield" id="textfield" value="2012/1/1" style="width:70px" />
                                        ~ 
                                        <input type="text" name="textfield"	id="textfield" value="2013/1/1" style="width:70px"/>
                                        <input name="radio" type="radio" value=""  checked="checked"/>
                                        当日
                                        <input name="radio" type="radio" value="" />
                                        本旬
                                        <input name="radio" type="radio" value="" />
                                        本月
                                        <input name="radio" type="radio" value="" />
                                        本年
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="sstree" style="width:198px; height:555px; background-color:#FFE0BB;border:solid; font-size:14px; border-color:#fce1cc; border-width:0px;  float:left" > 
                            <div id="treeDemo" class="ztree"></div>    
                        </div>
                        <div id="qx" style="width:1045px; height:570px; overflow:auto;border:solid; border-color:#fce1cc; border-width:1px; margin-left:200px;" >
                            <div id="container" style="width:1045px; height: 191px; border:solid; border-color:#fce1cc; border-width:1px;margin: 0 auto">
                            </div>
                            <div id="container1" style="width:1045px; height: 191px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <div id="container2" style="width:1045px; height: 191px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
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

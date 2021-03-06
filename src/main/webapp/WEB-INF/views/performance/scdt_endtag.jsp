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
        <link rel="stylesheet" type="text/css" href="${ctx}/static/style/css.css">
        <script type="text/javascript">
            var objUrl='${ctx}';
            var username='${username}';
        </script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script type="text/javascript" src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/highcharts.src.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/chart2.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/math.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/map.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jQuery.Tip.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.comet.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/util.js"></script>
        <script type="text/javascript" src="${ctx}/static/application.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/swfobject.js"></script>
        <script type="text/javascript" src="${ctx}/static/gis/gis.js"></script>
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

            /**
             * 列表信息显示
             * @param {type} cdiv
             * @returns {undefined}
             */
            function jk(cdiv){
                $(".cssdiv1").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","block");
                $("#gr1").css("display","none");
            }

            /**
             * 实时曲线信息显示
             * @param {type} cdiv
             * @returns {undefined}
             */
            function jk1(cdiv){
                $(".cssdiv").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","block");
            }  
            
            // 油井信息
            var strYoujing;
            // 组织机构信息
            var strMajorTag;
            // 已选择组织机构信息
            var selMajorTagData_tree;
            
            /**
             * 生产动态初始化
             * @returns {undefined}
             */
            function doOnLoad(){

                // 列表信息
                createTreeGrid();

                $(".cssdiv").addClass("s1");
                
                var treeNodes = [];
                var treeNodesItem = new Object();
                
                // 获得油井信息
                            $.ajax({
                                type: 'POST',
                                url: '${ctx}/realtime/youjing',
                                dateType:'json',
                                success: function(jsonYoujing){
 
                                    strYoujing = jsonYoujing; 
                                    
                                    // 产油量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'cyl_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '产油量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 产液量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'cyel_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '产液量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 油井开井数
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'yjkj_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '油井开井数';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.checked = true;
                                    treeNodesItem.doCheck = false;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 油井用电量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'yjydl_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '油井用电量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 油井注气量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'yjzql_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '油井注气量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 注水量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'zsl_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '注水量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    // 平均含水量
                                    treeNodesItem = new Object();

                                    treeNodesItem.id = 'pjhsl_0';
                                    treeNodesItem.pId = '0';
                                    treeNodesItem.name = '平均含水量';
                                    treeNodesItem.icon = '${ctx}/static/img/treeimg/d.gif';
                                    treeNodesItem.open = true;

                                    treeNodes.push(treeNodesItem);
                                    
                                    $.fn.zTree.init($("#treeDemo"), setting, treeNodes);
                                    
                                    // 油井开井数 状态
                                    $('#checkbox_yjkj_0').attr("checked", true);
                                    $('#checkbox_yjkj_0').attr("disabled", true);
                                    
                                    selMajorTagData_qx = ',';
                                    createQx_kjs(${info.id}, '油井开井数', 'container', 
                                        '油井开井数', 
                                        '${ctx}/performance/getOilProductDataList_kjs');  
                                }
                            }); 
            }
            
            // 组织机构信息
            var strMajorTag;
            // 已选择组织机构
            var selMajorTagData = ',';
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
             // 油井总数
            var youjing_count = 0;
                
            /**
             * 列表信息绑定
             * @returns {undefined}
             */
            function createTreeGrid(){
                
                // 已选择组织机构
                selMajorTagData = ',';

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
                
                // 获得日期信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/performance/getDateData',
                    dateType:'json',
                    success: function(jsonDate){

                        // 天数
                        days = jsonDate.days;
                        // 旬数
                        xun_days = jsonDate.xun_days;
                        // 初始日期设置
                        $('#txtStartDate').val(jsonDate.today);
                        $('#txtEndDate').val(jsonDate.today);
                        
                        
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

                                            var tmpGridInfo = createGridItem(jsonYoujing, ${info.id});

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.monAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.xunAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

//                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 已选择组织机构
                                            selMajorTagData = ',';
                
                                            // 产液量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'cyel';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '产液量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_liquid(jsonYoujing, ${info.id});

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.monAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.xunAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 已选择组织机构
                                            selMajorTagData = ',';
                                            
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
                                            
                                            // 油井注气量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'yjzql';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '油井注气量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_zhuqi(jsonYoujing);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 注水量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'zsl';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '注水量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_zhushui(jsonYoujing);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.monCount, days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.xunCount, xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 已选择组织机构
                                            selMajorTagData = ',';
                                            
                                            // 油井用电量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'yjydl';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '油井用电量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            tmpGridInfo = createGridItem_ele(jsonYoujing, ${info.id});

                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.dayCount, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(tmpGridInfo.yesterdayCount, tmpGridInfo.beforeYesterdayCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.monAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.lastyearMonCount), tmpGridInfo.lastyearMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.monCount, tmpGridInfo.beforeMonCount), tmpGridInfo.beforeMonCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(tmpGridInfo.xunAvg, 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.lastmonXunCount), tmpGridInfo.lastmonXunCount), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(tmpGridInfo.xunCount, tmpGridInfo.beforeXunCount), tmpGridInfo.beforeXunCount), 100)), 100));

                                            scdtItemData.rows = tmpGridInfo.data;

                                            scdtData.rows.push(scdtItemData);
                                            
                                            // 单井平均含水量
                                            scdtItemData = new Object();
                                            scdtItemData.id = 'djpjhsl';
                                            scdtItemData.data = [];

                                            scdtItemRootData = new Object();
                                            scdtItemRootData.value = '单井平均含水量';
                                            scdtItemRootData.image = 'folder.gif';  
                                            scdtItemData.data.push(scdtItemRootData);

                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(tmpGridInfo.dayCount, youjing_count), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accSub(accDiv(tmpGridInfo.yesterdayCount, youjing_count), accDiv(tmpGridInfo.beforeYesterdayCount, youjing_count)), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accDiv(tmpGridInfo.monCount, days), youjing_count), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(accDiv(tmpGridInfo.monCount, youjing_count),
                                                accDiv(tmpGridInfo.lastyearMonCount, youjing_count)), accDiv(tmpGridInfo.lastyearMonCount, youjing_count)), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(accDiv(tmpGridInfo.monCount, youjing_count), 
                                                accDiv(tmpGridInfo.beforeMonCount, youjing_count)), accDiv(tmpGridInfo.beforeMonCount, youjing_count)), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accDiv(tmpGridInfo.xunCount, youjing_count), xun_days), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(accDiv(tmpGridInfo.xunCount, youjing_count), 
                                                accDiv(tmpGridInfo.lastmonXunCount, youjing_count)), accDiv(tmpGridInfo.lastmonXunCount, youjing_count)), 100)), 100));
                                            scdtItemData.data.push(accDiv(Math.round(accMul(accDiv(accSub(accDiv(tmpGridInfo.xunCount, youjing_count), 
                                                accDiv(tmpGridInfo.beforeXunCount, youjing_count)), accDiv(tmpGridInfo.beforeXunCount, youjing_count)), 100)), 100));
                                              
                                            scdtData.rows.push(scdtItemData);
                                            
                                            treeGrid.clearAll();
                                            treeGrid.parse(scdtData,'json');
                                            
                                            treeGrid.attachEvent('onRowDblClicked', function(rId, cInd){
                                                
                                               if(rId.indexOf("_") >= 0){  
                                                   var wellTypeInfo = rId.split('_');
                                                   if(wellTypeInfo[0] == 'j'){
                                                       window.location.href = '${ctx}/performancepage/majortagpage?id=' + wellTypeInfo[1];
                                                   }
                                               }                                      
                                            });
                                        }
                                    });
                    }
                });                
            }
            
             /**
             * 信息子级信息生成(产油量)
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem(p_EndTagList, p_parentId){
                       
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
                // 当月累计平均
                tmpReturnGridData.monAvg = 0;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = 0;
                tmpReturnGridData.data = [];
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
                // 当月累计平均
                var monAvg = 0;
                // 当旬累计平均
                var xunAvg = 0;
                            
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                    if(valueYoujing.id == p_parentId && valueYoujing.type == 'YOU_JING'){
                                    
                        // 油井总数
                        youjing_count = accAdd(youjing_count, 1);
                        
//alert(valueYoujing.run_status_day + "--" + valueYoujing.run_status_yesterday + "--" + valueYoujing.run_status_before);
                        // 今日开井数
                        run_status_day = accAdd(run_status_day, valueYoujing.run_status_day > 0 ? 1 : 0);
                        // 昨日开井数
                        run_status_yesterday = accAdd(run_status_yesterday, valueYoujing.run_status_yesterday.run_status_day > 0 ? 1 : 0);
                        // 前日开井数
                        run_status_before = accAdd(run_status_before, valueYoujing.run_status_before.run_status_day > 0 ? 1 : 0);
            
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
                        // 当月累计平均
                        monAvg = accAdd(monAvg, valueYoujing.mon_avg);
                        // 当旬累计平均
                        xunAvg = accAdd(xunAvg, valueYoujing.xun_avg);
                    }              
                });   

                // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                // 当月累计平均
                tmpReturnGridData.monAvg = monAvg;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = xunAvg;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(产液量)
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_liquid(p_EndTagList, p_parentId){
               
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
                // 当月累计平均
                var monAvg = 0;
                // 当旬累计平均
                var xunAvg = 0;
                       
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
                // 当月累计平均
                tmpReturnGridData.monAvg = 0;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = 0;
                tmpReturnGridData.data = [];
                
                // 遍历油井
                            $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                                if(valueYoujing.id == p_parentId && valueYoujing.type == 'YOU_JING'){
                                    
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
                                    // 当月累计平均
                                    monAvg = accAdd(monAvg, valueYoujing.mon_avg_liquid);
                                    // 当旬累计平均
                                    xunAvg = accAdd(xunAvg, valueYoujing.xun_avg_liquid);
                                }              
                            });

                // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                // 当月累计平均
                tmpReturnGridData.monAvg = monAvg;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = xunAvg;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(油井用电量)
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_ele(p_EndTagList, p_parentId){
               
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
                // 当月累计平均
                var monAvg = 0;
                // 当旬累计平均
                var xunAvg = 0;
                       
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
                // 当月累计平均
                tmpReturnGridData.monAvg = 0;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = 0;
                tmpReturnGridData.data = [];
                
                // 遍历油井
                            $.each(p_EndTagList, function(keyYoujing, valueYoujing){

                                if(valueYoujing.id == p_parentId && valueYoujing.type == 'YOU_JING'){

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
                                    // 当月累计平均
                                    monAvg = accAdd(monAvg, valueYoujing.mon_avg_ele);
                                    // 当旬累计平均
                                    xunAvg = accAdd(xunAvg, valueYoujing.xun_avg_ele);
                                }              
                            });

                // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                // 当月累计平均
                tmpReturnGridData.monAvg = monAvg;
                // 当旬累计平均
                tmpReturnGridData.xunAvg = xunAvg;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(油井注气量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_zhuqi(p_EndTagList){
               
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
                
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){
                    
                    if(valueYoujing.type == 'YOU_JING'){
                        
                        // 今日累计
                        dayCount = accAdd(dayCount, valueYoujing.day_count_zhuqi);
                        // 昨日累计
                        yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count_zhuqi);
                        // 前日累计
                        beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count_zhuqi);
                        // 当月累计
                        monCount = accAdd(monCount, valueYoujing.mon_count_zhuqi);
                        // 去年当月累计
                        lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count_zhuqi);
                        // 上月累计
                        beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count_zhuqi);
                        // 当旬累计
                        xunCount = accAdd(xunCount, valueYoujing.xun_count_zhuqi);
                        // 上月当旬累计
                        lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count_zhuqi);
                        // 上旬累计
                        beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count_zhuqi);  
                    }
                });

                 // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                
                return tmpReturnGridData;
            }
            
            /**
             * 信息子级信息生成(注水量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_zhushui(p_EndTagList){
               
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
                
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){
                    
                    if(valueYoujing.type == 'ZHU_SHUI_ZHAN'){
    
                        // 今日累计
                        dayCount = accAdd(dayCount, valueYoujing.day_count_zhushui);
                        // 昨日累计
                        yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count_zhushui);
                        // 前日累计
                        beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count_zhushui);
                        // 当月累计
                        monCount = accAdd(monCount, valueYoujing.mon_count_zhushui);
                        // 去年当月累计
                        lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count_zhushui);
                        // 上月累计
                        beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count_zhushui);
                        // 当旬累计
                        xunCount = accAdd(xunCount, valueYoujing.xun_count_zhushui);
                        // 上月当旬累计
                        lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count_zhushui);
                        // 上旬累计
                        beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count_zhushui); 
                    }
                });

                 // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                
                return tmpReturnGridData;
            }

            /**
             * 信息子级信息生成(水井开井)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_water(p_EndTagList){
               
                // 今日累计
                var run_status_day_water = 0;
                // 昨日累计
                var run_status_yesterday_water = 0;
                // 前日累计
                var run_status_before_water = 0;

                var tmpReturnGridData = new Object(); 

                // 今日累计
                tmpReturnGridData.run_status_day_water = 0;
                // 昨日累计
                tmpReturnGridData.run_status_yesterday_water = 0;
                // 前日累计
                tmpReturnGridData.run_status_before_water = 0;
                
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){
                    
                    if(valueYoujing.type == 'SHUI_YUAN_JING'){
    
                        // 今日开井数
                        run_status_day_water = accAdd(run_status_day_water, valueYoujing.run_status_day_water > 0 ? 1 : 0);
                        // 昨日开井数
                        run_status_yesterday_water = accAdd(run_status_yesterday_water, valueYoujing.run_status_yesterday.run_status_day_water > 0 ? 1 : 0);
                        // 前日开井数
                        run_status_before_water = accAdd(run_status_before_water, valueYoujing.run_status_before.run_status_day_water > 0 ? 1 : 0);
                    }
                });

                 // 今日累计
                tmpReturnGridData.run_status_day_water = run_status_day_water;
                // 昨日累计
                tmpReturnGridData.run_status_yesterday_water = run_status_yesterday_water;
                // 前日累计
                tmpReturnGridData.run_status_before_water = run_status_before_water;
                
                return tmpReturnGridData;
            }

            /**
             * 信息子级信息生成(总用电量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_ele_total(p_EndTagList){
               
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
                
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){
                    
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
                });

                 // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                
                return tmpReturnGridData;
            }

            /**
             * 信息子级信息生成(油井平均含水量)
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_EndTagList 井信息
             * @returns {Object}             */
            function createGridItem_hanshui(p_EndTagList){
               
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
                
                // 遍历油井
                $.each(p_EndTagList, function(keyYoujing, valueYoujing){
                    
                    if(valueYoujing.type == 'YOU_JING'){
                        
                        // 今日累计
                        dayCount = accAdd(dayCount, valueYoujing.day_count_hanshui);
                        // 昨日累计
                        yesterdayCount = accAdd(yesterdayCount, valueYoujing.yesterday_count_hanshui);
                        // 前日累计
                        beforeYesterdayCount = accAdd(beforeYesterdayCount, valueYoujing.before_yesterday_count_hanshui);
                        // 当月累计
                        monCount = accAdd(monCount, valueYoujing.mon_count_hanshui);
                        // 去年当月累计
                        lastyearMonCount = accAdd(lastyearMonCount, valueYoujing.lastyear_mon_count_hanshui);
                        // 上月累计
                        beforeMonCount = accAdd(beforeMonCount, valueYoujing.before_mon_count_hanshui);
                        // 当旬累计
                        xunCount = accAdd(xunCount, valueYoujing.xun_count_hanshui);
                        // 上月当旬累计
                        lastmonXunCount = accAdd(lastmonXunCount, valueYoujing.lastmon_xun_count_hanshui);
                        // 上旬累计
                        beforeXunCount = accAdd(beforeXunCount, valueYoujing.before_xun_count_hanshui);  
                    }
                });

                 // 今日累计
                tmpReturnGridData.dayCount = dayCount;
                // 昨日累计
                tmpReturnGridData.yesterdayCount = yesterdayCount;
                // 前日累计
                tmpReturnGridData.beforeYesterdayCount = beforeYesterdayCount;
                // 当月累计
                tmpReturnGridData.monCount = monCount;
                // 去年当月累计
                tmpReturnGridData.lastyearMonCount = lastyearMonCount;
                // 上月累计
                tmpReturnGridData.beforeMonCount = beforeMonCount;
                // 当旬累计
                tmpReturnGridData.xunCount = xunCount;
                // 上月当旬累计
                tmpReturnGridData.lastmonXunCount = lastmonXunCount;
                // 上旬累计
                tmpReturnGridData.beforeXunCount = beforeXunCount;
                
                return tmpReturnGridData;
            }

            /**
             * 树状控件生成
             * @param {type} treeId
             * @param {type} treeNode
             * @returns {undefined}
             */
            function addDiyDom(treeId, treeNode) {
                
                var aObj = $("#" + treeNode.tId + IDMark_A);
                // 父节点
                if (treeNode.level == 0) {
				
                    var editStr = "<input type='checkbox' class='checkboxBtn' id='checkbox_" + treeNode.id + "'onfocus='this.blur();' ></input>";
                    aObj.before(editStr);
                    var btn = $("#checkbox_" + treeNode.id);
                    if (btn) btn.bind("change", function(){
                        checkAccessories(treeNode, btn);
                    });
                // 子节点
                }else if (treeNode.level >= 1) {
                    var idAry = [];
                    // 截取字符串
                    idAry = treeNode.getParentNode().id.split("_");
                    var editStr = "<input type='radio' class='radioBtn' id='radio_" + treeNode.id + "' name='radio_" + idAry[0] + "'onfocus='this.blur();'></input>";
                    aObj.before(editStr);
                    var btn = $("#radio_" + treeNode.id);
                    if (btn) btn.bind("click", function() {
                        checkBrand(treeNode, btn);
                    });
                }
            }

            //单机节点事件
            function onClick(e,treeId, treeNode) {
                
                if(treeNode.getParentNode() == null){
                    //树状控件连动
                    var btn = $("#checkbox_"+treeNode.id);
                    checkAccessories(treeNode, btn);
                }else{
                    //树状控件连动
                    var btn = $("#radio_"+treeNode.id);
                    checkBrand(treeNode, btn);
                }                 
             }
             
            //去掉单选
            function checkw(treeNode, checkedRadio){
                checkedRadio.attr("checked",false);
			}
            
            /**
             * 获得单选按钮
             * @param {type} radioName
             * @returns {unresolved}
             */
            function getCheckedRadio(radioName) {
                var r = document.getElementsByName(radioName);
                for(var i=0; i<r.length; i++)    {
                    if(r[i].checked)    {
                        return $(r[i]);
                    }
                }
                return null;
            }
            
            /**
             * 曲线生成
             * @param {type} code 选中节点code
             * @returns {Object}
             */
            function createQx_oil(p_id, p_title, p_render, p_name, p_path, p_unit){

                // 累计
                var mapData = new Map();
                // 获得井数据信息
                $.ajax({
                    type: 'POST',
                    url: p_path,
                    data:{code:p_id, startDate:$('#txtStartDate').val(), endDate:$('#txtEndDate').val()},
                    dateType:'json',
                    success: function(jsonYoujing){//alert(mapData.get('2013-06-09'));
                        $.each(jsonYoujing,function(keyYoujing, valueYoujing){
                                        if(valueYoujing.id == p_id){
                                            if(typeof(mapData.get(valueYoujing.date)) == "undefined"){
                                                mapData.set(valueYoujing.date, valueYoujing.day_count);
                                            }else{
                                                mapData.set(valueYoujing.date, accAdd(mapData.get(valueYoujing.date), valueYoujing.day_count));
                                            }
                                        }
                                    });
                        
                        createScdtQx(mapData, p_title, p_unit, p_render, p_name);
                    }
                });
            }
                                    
            /**
             * 曲线生成(油井开井数)
             * @param {type} code 选中节点code
             * @returns {Object}
             */
            function createQx_kjs(p_id, p_title, p_render, p_name, p_path){

                // 累计
                var mapData = new Map();
                // 获得井数据信息
                $.ajax({
                    type: 'POST',
                    url: p_path,
                    data:{startDate:$('#txtStartDate').val(), endDate:$('#txtEndDate').val()},
                    dateType:'json',
                    success: function(jsonYoujing){
                        $.each(jsonYoujing,function(keyYoujing, valueYoujing){
                                        if(valueYoujing.id == p_id){
//                                            alert(valueYoujing.date + '---' +valueYoujing.day_count);
                                            if(typeof(mapData.get(valueYoujing.date)) == "undefined"){
                                                mapData.set(valueYoujing.date, valueYoujing.day_count);
                                            }else{
                                                mapData.set(valueYoujing.date, Math.round(accAdd(mapData.get(valueYoujing.date), (valueYoujing.day_count > 0 ? 1 : 0))));
                                            }
                                        }
                                    });
                        
                        createScdtQx(mapData, p_title, '', p_render, p_name);
                    }
                });
            }

            /**
             * 曲线生成
             * @param {type} code 选中节点code
             * @returns {Object}
             */
            function createQx_oil_pj(p_id, p_title, p_render, p_name, p_path, p_unit){

                // 累计
                var mapData = new Map();
                // 获得井数据信息
                $.ajax({
                    type: 'POST',
                    url: p_path,
                    data:{code:p_id, startDate:$('#txtStartDate').val(), endDate:$('#txtEndDate').val()},
                    dateType:'json',
                    success: function(jsonYoujing){//alert(mapData.get('2013-06-09'));
                         $.each(jsonYoujing,function(keyYoujing, valueYoujing){
                                        if(valueYoujing.id == p_id){
                                            if(typeof(mapData.get(valueYoujing.date)) == "undefined"){
                                                mapData.set(valueYoujing.date, valueYoujing.day_count);
                                            }else{
                                                mapData.set(valueYoujing.date, accAdd(mapData.get(valueYoujing.date), valueYoujing.day_count));
                                            }
                                        }
                                    });
                        
                        createScdtQx_pj(mapData, p_title, p_unit, p_render, p_name, youjing_count);
                    }
                });
            }

            var selMajorTagData_qx = ',';
            /**
             * 多选触发事件(树状控件)
             * @param {type} treeNode
             * @param {type} btn
             * @returns {undefined}
             */
            function checkAccessories(treeNode, btn) {
                
                // 截取字符串
                var idAry = treeNode.id.split("_");
                  
                var checkedRadio = getCheckedRadio("radio_" + idAry[0]);
                if (btn.attr("checked")) {                    
                    if(checkedRadio != null){                  
                        checkedRadio.attr("checked", false);
                    }
                    
                    var chkId = treeNode.id;
                    switch(chkId){
                        //产油量
                        case 'cyl_0' :
                            $("#container1").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '油井产油量', 'container1', '油井产油量', 
                                '${ctx}/performance/getOilProductDataList', 't');
                            break;
                        //产液量
                        case 'cyel_0' :
                            $("#container2").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '油井产液量', 'container2', '油井产液量', 
                                '${ctx}/performance/getOilProductDataList_liquid', 'm³');
                            break;
                        //产气量(暂时不做实现)
                        case 'cql_0' :
                            $("#container3").css("display","block");
                            break;
                        //油井用电量
                        case 'yjydl_0' :
                            $("#container4").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '油井用电量', 'container4', '油井用电量', 
                                '${ctx}/performance/getOilProductDataList_ydl', 'kWh');  
                            break;
                        //油井注气量
                        case 'yjzql_0' :
                            $("#container5").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '油井注气量', 'container5', '油井注气量', 
                                '${ctx}/performance/getOilProductDataList_zql', 'm³');
                            break;
                        //注水量
                        case 'zsl_0' :
                            $("#container6").css("display","block");                            
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '油井注水量', 'container6', '油井注水量', 
                                '${ctx}/performance/getOilProductDataList_zsl', 'm³');
                            break;
                        //总用电量
                        case 'zydl_0' :
                            $("#container7").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil(${info.id}, '总用电量', 'container7', '总用电量', 
                                '${ctx}/performance/getOilProductDataList_zydl', 'kWh');
                            break;
                        //单井平均产量
                        case 'djpjcl_0' :
                            $("#container8").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil_pj(${info.id}, '单井平均产量', 'container8', '单井平均产量', 
                                '${ctx}/performance/getOilProductDataList', 't');
                            break;
                        //平均含水量
                        case 'pjhsl_0' :
                            $("#container9").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_oil_pj(${info.id}, '平均含水量', 'container9', '平均含水量', 
                                '${ctx}/performance/getOilProductDataList_hsl', '%');
                            break;	
                        //油井井数			
                        case 'yjzjs_0' :
                            $("#container10").css("display","block");
                            selMajorTagData_qx = ',';
                            createQx_kjs(${info.id}, '油井总井数', 'container10', '油井总井数', 
                                '${ctx}/performance/getOilProductDataList_zjs');
                            break;				
                    }                        
                //取消时触发的事件
                } else if(checkedRadio != null){
                        
                    checkedRadio.attr("checked", false);
                    var chkId = treeNode.id;
                    switch(chkId){
                        //产油量
                        case 'cyl_0' :
                            $("#container1").css("display","none");
                            break;
                        //产液量
                        case 'cyel_0' :
                            $("#container2").css("display","none");
                            break;
                        //产气量
                        case 'cql_0' :
                            $("#container3").css("display","none");
                            break;
                        //油井用电量
                        case 'yjydl_0' :
                            $("#container4").css("display","none");
                            break;
                        //油井注气量
                        case 'yjzql_0' :
                            $("#container5").css("display","none");
                            break;
                        //注水量
                        case 'zsl_0' :
                            $("#container6").css("display","none");
                            break;
                        //总用电量
                        case 'zydl_0' :
                            $("#container7").css("display","none");
                            break;
                        //单井平均产量
                        case 'djpjcl_0' :
                            $("#container8").css("display","none");
                            break;
                        //平均含水量
                        case 'pjhsl_0' :
                            $("#container9").css("display","none");
                            break;	
                        //油井井数			
                        case 'yjzjs_0' :
                            $("#container10").css("display","none");
                            break;				
                    }
                }else{
                    var chkId = treeNode.id;
                    switch(chkId){
                        //产油量
                        case 'cyl_0' :
                            $("#container1").css("display","none");
                            break;
                        //产液量
                        case 'cyel_0' :
                            $("#container2").css("display","none");
                            break;
                        //产气量
                        case 'cql_0' :
                            $("#container3").css("display","none");
                            break;
                        //油井用电量
                        case 'yjydl_0' :
                            $("#container4").css("display","none");
                            break;
                        //油井注气量
                        case 'yjzql_0' :
                            $("#container5").css("display","none");
                            break;
                        //注水量
                        case 'zsl_0' :
                            $("#container6").css("display","none");
                            break;
                        //总用电量
                        case 'zydl_0' :
                            $("#container7").css("display","none");
                            break;
                        //单井平均产量
                        case 'djpjcl_0' :
                            $("#container8").css("display","none");
                            break;
                       //平均含水量
                       case 'pjhsl_0' :
                            $("#container9").css("display","none");
                            break;	
                       //油井井数			
                       case 'yjzjs_0' :
                            $("#container10").css("display","none");
                            break;				
                    }                            
                }
            }
            
            //单选触发事件
            function checkBrand(treeNode, btn) {
                if (btn.attr("checked")) {
                        var trId = treeNode.id.split('_');
                        switch(trId[0]){
                            //产油量
                            case 'cyl' : 
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井产油量', 'container1', '油井产油量', 
                                        '${ctx}/performance/getOilProductDataList', 't');  
                                }
                                break;
                            //产液量
                            case 'cyel' : 
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井产液量', 'container2', '油井产液量', 
                                        '${ctx}/performance/getOilProductDataList_liquid', 'm³');  
                                }
                                break;
                            //产气量
                            case 'cql' : 
                                break;
                            //油井用电量
                            case 'yjydl' :  
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井用电量', 'container4', '油井用电量', 
                                        '${ctx}/performance/getOilProductDataList_ydl', 'kWh');  
                                }
                                break;
                            //油井注气量
                            case 'yjzql' : 
                                break;
                            //注水量
                            case 'zsl' : 
                                break;
                            //总用电量
                            case 'zydl' : 
                                break;
                            //单井平均产量
                            case 'djpjcl' : 
                                break;
                            //平均含水量
                            case 'pjhsl' : 
                                break;
                            //油井井数
                            case 'yjzjs' : 
                                break;
                            }
                }else{
                    var pObj = $("#checkbox_" + treeNode.getParentNode().id);
                    if (pObj.attr("checked")) {
                        //点击节点名称变曲线(子节点没有被选中)
                        var trId=treeNode.id.split('_');
                        var checkedRadio = getCheckedRadio("radio_"+treeNode.id);
                        switch(trId[0]){
                            //产油量
                            case 'cyl' : 
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井产油量', 'container1', '油井产油量', 
                                            '${ctx}/performance/getOilProductDataList', 't');
                                }else{
                                    selMajorTagData_qx = ',';
                                    createQx_oil(${info.id}, '油井产油量', 'container1', '油井产油量', 
                                            '${ctx}/performance/getOilProductDataList', 't');
                                }

                                if(checkedRadio!=null){
                                    checkw(treeNode, checkedRadio);
                                }
                                break;
                            //产液量
                            case 'cyel' : 
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井产液量', 'container2', '油井产液量', 
                                            '${ctx}/performance/getOilProductDataList_liquid', 'm³');
                                }else{
                                    selMajorTagData_qx = ',';
                                    createQx_oil(${info.id}, '油井产液量', 'container2', '油井产液量', 
                                            '${ctx}/performance/getOilProductDataList_liquid', 'm³');
                                }
                                if(checkedRadio!=null){
                                     checkw(treeNode, checkedRadio);
                                }
                                break;
                            //产气量
                            case 'cql' : 
                                break;
                            //油井用电量
                            case 'yjydl' : 
                                if(trId[2] == 'yj'){
                                    createQxForWell_oil(trId[3], '油井用电量', 'container4', '油井用电量', 
                                        '${ctx}/performance/getOilProductDataList_ydl', 'kWh');  
                               }else{
                                    selMajorTagData_qx = ',';
                                    createQx_oil(${info.id}, '油井用电量', 'container4', '油井用电量', 
                                        '${ctx}/performance/getOilProductDataList_ydl', 'kWh');
                               }
                               if(checkedRadio!=null){
                                    checkw(treeNode, checkedRadio);
                               }
                                break;
                            //油井注气量
                            case 'yjzql' : 
                                break;
                            //注水量
                            case 'zsl' : 
                                break;
                            //总用电量
                            case 'zydl' : 
                                break;
                            //单井平均产量
                            case 'djpjcl' : 
                                break;
                            //平均含水量
                            case 'pjhsl' : 
                                break;
                            //油井井数
                            case 'yjzjs' : 
                                break;
                        }
                    }                    
                    btn.attr("checked", true);
                }
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.selectNode(treeNode);
            }
            
            /**
            * 设置生成曲线日期
             */
            function SetFindDate(p_type){
            // 获得日期信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/performance/getFindDateData',
                    data:{type : p_type},
                    dateType:'json',
                    success: function(jsonDate){

                        // 初始日期设置
                        $('#txtStartDate').val(jsonDate.startDate);
                        $('#txtEndDate').val(jsonDate.endDate);
                    }
                });
            }
        </script>
    </head>
    <body>
        <div id="divkd"></div>
        <div id="zy"  style="width:3845px; height:717px;border:solid; border-width:1px">
            <!--数据-->
            <div id="scdt" style="width:1280px; height:69px;  float:left; font-size:0 ">
                <!--logo-->
                <div id="ssjc" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png" usemap="#planetmap" style="border: 0px"/>
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
                    <a  href="${ctx}/producepage" style="text-decoration:none"><img  border="0" src="${ctx}/static/img/scgl.png"  style="width:122px; height:33px"/></a>
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
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr height="19px">
                                    <td width="80%">&nbsp;&nbsp;&nbsp;${info.name}</td>
                                    <td width="10%"></td>
                                    <td width="10%" align="right" style="padding-right:5px; cursor:hand;" onclick="javascript:history.back();">返&nbsp;&nbsp;&nbsp;回</td>
                                </tr>
                            </table>  
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
                                        <input type="text" name="textfield" id="txtStartDate" value="2012/01/01" style="width:70px" 
                                               onClick="WdatePicker({readOnly:true,dateFmt:'yyyy/MM/dd'})" />
                                        ~ 
                                        <input type="text" name="textfield"	id="txtEndDate" value="2013/01/01" style="width:70px" 
                                               onClick="WdatePicker({readOnly:true,dateFmt:'yyyy/MM/dd'})" />
                                        <input name="radio" type="radio" value="1"  checked="checked" onclick="SetFindDate(1);"/>
                                        当日
                                        <input name="radio" type="radio" value="2" onclick="SetFindDate(2);" />
                                        本旬
                                        <input name="radio" type="radio" value="3" onclick="SetFindDate(3);" />
                                        本月
                                        <input name="radio" type="radio" value="4" onclick="SetFindDate(4);" />
                                        本年
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="treeDemo" class="ztree" style="width:195px;overflow:auto; height:565px;background-color:#FFE0BB;border:solid; font-size:14px; border-color:#fce1cc; border-width:0px;  float:left" > 
                        </div>
                        <!--实时曲线-->
                        <div id="qx" style="width:1038px; height:573px; overflow:auto;border:solid; border-color:#fce1cc; border-width:1px; margin-left:200px;" >
                            <!--产油量--> 		
                            <div id="container1" style="width:1036px; height: 191px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--产液量-->
                            <div id="container2" style="width:1036px; height: 191px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--产汽量-->
                            <div id="container3" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--油井用电量-->
                            <div id="container4" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--油井注气量-->
                            <div id="container5" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--注水量-->
                            <div id="container6" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--总用电量-->
                            <div id="container7" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--单井平均产量-->
                            <div id="container8" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--平均含水量-->
                            <div id="container9" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px; margin: 0 auto; display:none">
                            </div>
                            <!--油井井数-->
                            <div id="container10" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px;  display:none">
                            </div>
                            <!--油井开井数--> 
                            <div id="container" style="width:1036px; height: 189px; border:solid; border-color:#fce1cc; border-width:1px;margin: 0 auto">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--地图-->
            <div id="dt" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;" >
                <div  style="width:100%;height:100%; position: relative;">
                        <div id="flashContent" style="width:100%;" ></div>                        
                    </div>
            </div>
            <!--视频-->
            <div id="sp" style="width:1280px;height:716px; border:solid; border-color:#000; border-width:1px; float:left;" >
                <img src="${ctx}/static/img/sp.png"  style="width:1280px;height:716px;"/>
            </div>
        </div>
        <div id="sztitle"></div>
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

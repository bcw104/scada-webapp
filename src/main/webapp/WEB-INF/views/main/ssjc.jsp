<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生产监控</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z.css">
        <script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
        <script src="${ctx}/static/dhtmlx/js/treeGridcodebae/dhtmlxtreegrid.js"></script>
        <script src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_json.js"></script>
        <script src="${ctx}/static/dhtmlx/js/gridcodebase/ext/dhtmlxgrid_math.js"></script>
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.tmpl.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.atmosphere.js"></script>
        <script type="text/javascript" src="${ctx}/static/jquery/jquery.messager.js"></script>
        <script type="text/javascript">
            var objUrl='${ctx}';
            var username='${username}';
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
            .cssdiv3:hover{
                color:#09F
            }
        </style>
        <script>
            var dhLayout,toolbar,treeGrid,dhxTabbar,Grid,Grid1,Grid2,Grid3,Grid4,dhxWins;
            /**
             * 生产监控信息初始化
             * @returns {undefined}
             */
            function ssjc(){
                
                // 井矿信息生成
                createTreeGrid();
                // 增压站信息生成
                createGrid();
                createGr();
                creategr();
                createWindow();
                $(".cssdiv").addClass("s1");
            }
            
            function createWindow(){
                dhxWins = new dhtmlXWindows();
                dhxWins.attachViewportTo(document.body);
                dhxWins.createWindow("win",200,100,400,175);
                dhxWins.window("win").button('minmax2').hide();
                dhxWins.window("win").button('minmax1').hide();
                dhxWins.window("win").button('park').hide();
                dhxWins.window("win").hide();	
            }
            
            // 油井信息
            var strYoujing;
            // 组织机构信息
            var strMajorTag;
            // 搜索井号
            var searchKeyword = ''; 
            // 已选择组织机构
            var selMajorTagData = ',';
            
            /**
             * 井矿信息生成
             * @returns {undefined}
             */
            function createTreeGrid(){
                treeGrid= new dhtmlXGridObject('jdd');
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader(["井队名称","总井数","开井数","停井数","非正常停井","作业井","故障井","正常交付井"]);
                treeGrid.setInitWidths("200,160,160,160,160,160,160,*");
                treeGrid.setColAlign("left,center,center,center,center,center,center,center");
                treeGrid.setColTypes("tree,ed,ed,ed,ed,ed,ed,ed");
                treeGrid.setColSorting("str,str,str,str,str,str,str,str");
                treeGrid.init();
                
                // 搜索井号（井矿信息）
                searchKeyword = '';
                // 已选择组织机构
                selMajorTagData = ',';
                
                // 井矿信息
                var wellData = new Object();
                var wellDataAry = [];
                
                // 获得机构信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/majortag',
                    dateType:'json',
                    success: function(json){
                        strMajorTag = json;
                        if(json != ''){
                            // 获得油井信息
                            $.ajax({
                                type: 'POST',
                                url: '${ctx}/realtime/youjing',
                                dateType:'json',
                                success: function(jsonYoujing){
 
                                    strYoujing = jsonYoujing;                                
                            
                                    // 封装井矿信息JSON
                                    $.each(strMajorTag,function(keyMajorTag, valueMajorTag){
                                        
                                        if(valueMajorTag.pid == 0){
                                            
                                            var tmpMajorTag = new Object(); 
                                            tmpMajorTag.id = valueMajorTag.id;
                                            tmpMajorTag.open = 1;
                                            tmpMajorTag.data = [];
                                            // 名称设置
                                            var majorTagName = {};
                                            majorTagName.value = valueMajorTag.name;
                                            majorTagName.image = 'folder.gif';                                            
                                            tmpMajorTag.data.push(majorTagName);
                                           
                                            
                                            // 递归遍历子数据  
                                            var tmpWellInfo = createGridItem(strMajorTag, tmpMajorTag);         

                                            tmpMajorTag.rows = tmpWellInfo.data;
                                                    
                                            // 井参数信息
                                            tmpMajorTag.data.push(tmpWellInfo.jing);
                                            tmpMajorTag.data.push(tmpWellInfo.jingKai);
                                            tmpMajorTag.data.push(tmpWellInfo.jingGuan);
                                            tmpMajorTag.data.push(0);
                                            tmpMajorTag.data.push(0);
                                            tmpMajorTag.data.push(0);
                                            tmpMajorTag.data.push(0); 
                                            
                                            wellDataAry.push(tmpMajorTag);
                                        }else{
                                            
                                            return true;
                                        }                                    
                                    });
                                    
                                    // 总数据格式设置
                                    wellData.rows = wellDataAry;
                                            
                                    //var itemson=jsonManages(sr,jh);
                                    treeGrid.clearAll();
                                    treeGrid.parse(wellData,'json');

//                                    treeGrid.openItem("1001");
                                    treeGrid.attachEvent('onRowDblClicked', function(rId, cInd){
                                        
                                        var wellTypeInfo = rId.split('||');
//                                        alert(wellTypeInfo[1] + "----" + wellTypeInfo[2] + "----" + wellTypeInfo[3]);

                                        switch(wellTypeInfo[2]){
                                            
                                            case 'LUO_GAN_BENG':
                                                window.location.href = '${ctx}/main/lgb?id=' + wellTypeInfo[1];
                                                break;
                                            case 'DIAN_QIAN_BENG':
                                                window.location.href = '${ctx}/main/dqb?id=' + wellTypeInfo[1];
                                                break;
                                            case 'GU_LI_JING':
                                                window.location.href = '${ctx}/main/glj?id=' + wellTypeInfo[1];
                                                break;
                                            default:
                                                
                                                switch(wellTypeInfo[3]){

                                                    case '自喷':
                                                        window.location.href = '${ctx}/main/zp?id=' + wellTypeInfo[1];
                                                        break;
                                                    case '注汽':
                                                        window.location.href = '${ctx}/main/zq?id=' + wellTypeInfo[1];
                                                        break;
                                                    case '焖井':
                                                        window.location.href = '${ctx}/main/mj?id=' + wellTypeInfo[1];
                                                        break;
                                                    default:
                                                        window.location.href = '${ctx}/main/cyj?id=' + wellTypeInfo[1];
                                                }                                                
                                        }                                        
                                    });
                                }
                            });
                        }
                    }
                });
            }
                        
            /**
            * 井矿信息生成(查询用)
             * @returns {undefined}             
             */
            function createTreeGridBySearch(){
            
                treeGrid= new dhtmlXGridObject('jdd');
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader(["井队名称","总井数","开井数","停井数","非正常停井","作业井","故障井","正常交付井"]);
                treeGrid.setInitWidths("200,160,160,160,160,160,160,*");
                treeGrid.setColAlign("left,center,center,center,center,center,center,center");
                treeGrid.setColTypes("tree,ed,ed,ed,ed,ed,ed,ed");
                treeGrid.setColSorting("str,str,str,str,str,str,str,str");
                treeGrid.init();
                
                selMajorTagData = ',';
                searchKeyword = $.trim($("#textfie").val());
                
                var wellData = new Object();
                var wellDataAry = [];
                
                // 封装井矿信息JSON
                $.each(strMajorTag,function(keyMajorTag, valueMajorTag){
                                        
                    if(valueMajorTag.pid == 0){
                                            
                        var tmpMajorTag = new Object(); 
                        tmpMajorTag.id = valueMajorTag.id;
                        tmpMajorTag.open = 1;
                        tmpMajorTag.data = [];
                        // 名称设置
                        var majorTagName = {};
                        majorTagName.value = valueMajorTag.name;
                        majorTagName.image = 'folder.gif';                                            
                        tmpMajorTag.data.push(majorTagName);                                           
                                            
                        // 递归遍历子数据  
                        var tmpWellInfo = createGridItem(strMajorTag, tmpMajorTag);         

                        tmpMajorTag.rows = tmpWellInfo.data;
                                                    
                        // 井参数信息
                        tmpMajorTag.data.push(tmpWellInfo.jing);
                        tmpMajorTag.data.push(tmpWellInfo.jingKai);
                        tmpMajorTag.data.push(tmpWellInfo.jingGuan);
                        tmpMajorTag.data.push(0);
                        tmpMajorTag.data.push(0);
                        tmpMajorTag.data.push(0);
                        tmpMajorTag.data.push(0); 
                                            
                        wellDataAry.push(tmpMajorTag);
                    }else{
                                            
                        return true;
                    }                                    
                });
                                    
                // 总数据格式设置
                wellData.rows = wellDataAry;
                                            
                //var itemson=jsonManages(sr,jh);
                treeGrid.clearAll();
                treeGrid.parse(wellData,'json');

                treeGrid.openItem("1001");
                treeGrid.attachEvent('onRowDblClicked', function(rId, cInd){
                                        
                    var wellTypeInfo = rId.split('||');
//                  alert(wellTypeInfo[1] + "----" + wellTypeInfo[2] + "----" + wellTypeInfo[3]);

                    switch(wellTypeInfo[2]){
                                            
                        case 'LUO_GAN_BENG':
                            window.location.href = '${ctx}/main/lgb?id=' + wellTypeInfo[1];
                            break;
                        case 'DIAN_QIAN_BENG':
                            window.location.href = '${ctx}/main/dqb?id=' + wellTypeInfo[1];
                            break;
                        case 'GU_LI_JING':
                            window.location.href = '${ctx}/main/glj?id=' + wellTypeInfo[1];
                            break;
                        default:
                            switch(wellTypeInfo[3]){

                                case '自喷':
                                    window.location.href = '${ctx}/main/zp?id=' + wellTypeInfo[1];
                                    break;
                                case '注汽':
                                    window.location.href = '${ctx}/main/zq?id=' + wellTypeInfo[1];
                                    break;
                                case '焖井':
                                    window.location.href = '${ctx}/main/mj?id=' + wellTypeInfo[1];
                                    break;
                                default:
                                    window.location.href = '${ctx}/main/cyj?id=' + wellTypeInfo[1];
                            }                                                
                    }                                        
                });
            }

            /**
             * 井矿信息子级信息生成
             * @param {type} p_MajorTagList 组织机构信息
             * @param {type} p_MajorTagParent 上级组织机构
             * @returns {Object}             */
            function createGridItem(p_MajorTagList, p_MajorTagParent){
                // 机构数据
                var tmpWellData = [];
                var tmpReturnWellData = new Object(); 
                
                tmpReturnWellData.jing = 0;
                tmpReturnWellData.jingKai = 0;
                tmpReturnWellData.jingGuan = 0;
                
                var youjingDuiCount = 0;
                var youjingKaiDuiCount = 0;
                var youjingGuanDuiCount = 0;
                        
                // 封装井矿信息JSON
                $.each(p_MajorTagList,function(keyMajorTagList, valueMajorTagList){
                                        
                    if(valueMajorTagList.pid == p_MajorTagParent.id && (selMajorTagData.indexOf(',' + valueMajorTagList.id + ',') < 0))
                    {
                                            
                        selMajorTagData += valueMajorTagList.id + ',';
                                            
                        var tmpMajorTag = new Object(); 
                        tmpMajorTag.id = valueMajorTagList.id;
                        tmpMajorTag.open = 1;
                        tmpMajorTag.data = [];
                        // 名称设置
                        var majorTagName = {};
                        majorTagName.value = valueMajorTagList.name;
                        majorTagName.image = 'folder.gif';                                            
                        tmpMajorTag.data.push(majorTagName);

                        // 递归遍历子数据
                        if(valueMajorTagList.type == 'DUI_LEVEL'){
                            
                            var youjingCount = 0;
                            var youjingKaiCount = 0;
                            var youjingGuanCount = 0;
                            
                            var tmpYoujingData = [];
                            $.each(strYoujing,function(keyYoujing, valueYoujing)
                            {
                                if(valueMajorTagList.id == valueYoujing.major_tag_id && (valueYoujing.name.indexOf(searchKeyword) >= 0)){
                                    
                                    youjingCount++;
                                    
                                    var tmpYoujingTag = new Object(); 
                                    tmpYoujingTag.id = 'j||' + valueYoujing.id + '||' + valueYoujing.subtype + '||' + valueYoujing.stage;
                                    tmpYoujingTag.open = 1;
                                    tmpYoujingTag.data = [];
                                    // 名称设置
                                    var youjingName = {};
                                    youjingName.value = valueYoujing.name;
                                    youjingName.image = 'folder.gif';                                            
                                    tmpYoujingTag.data.push(youjingName);
                                    // 井参数信息
                                    // 井数
                                    tmpYoujingTag.data.push(1);
                                    // 开关井状态
                                    if(valueYoujing.state == "false"){
                                        
                                        youjingGuanCount++;
                                        tmpYoujingTag.data.push(0);
                                        tmpYoujingTag.data.push(1);
                                    }else{
                                        
                                        youjingKaiCount++;
                                        tmpYoujingTag.data.push(1);
                                        tmpYoujingTag.data.push(0);
                                    }
                                    
                                    tmpYoujingTag.data.push(0);
                                    tmpYoujingTag.data.push(0);
                                    tmpYoujingTag.data.push(0);
                                    tmpYoujingTag.data.push(0);
                        
                                    tmpYoujingData.push(tmpYoujingTag);
                                }
                            });
                        
                            // 井参数信息
                            tmpMajorTag.data.push(youjingCount);
                            tmpMajorTag.data.push(youjingKaiCount);
                            tmpMajorTag.data.push(youjingGuanCount);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0); 
                        
                            youjingDuiCount += youjingCount;
                            youjingKaiDuiCount += youjingKaiCount;
                            youjingGuanDuiCount += youjingGuanCount;
                            tmpMajorTag.rows = tmpYoujingData;  

                        }else{

                            var tmpWellInfo = createGridItem(p_MajorTagList, tmpMajorTag);         

                            // 井参数信息
                            tmpMajorTag.data.push(tmpWellInfo.jing);
                            tmpMajorTag.data.push(tmpWellInfo.jingKai);
                            tmpMajorTag.data.push(tmpWellInfo.jingGuan);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0);
                            tmpMajorTag.data.push(0); 
                            
                            youjingDuiCount += tmpWellInfo.jing;
                            youjingKaiDuiCount += tmpWellInfo.jingKai;
                            youjingGuanDuiCount += tmpWellInfo.jingGuan;
                            tmpMajorTag.rows = tmpWellInfo.data;
                        }                      
                                            
                        tmpWellData.push(tmpMajorTag);
                    }
                    else{
                        return true;
                    }
                });
                
                tmpReturnWellData.jing = youjingDuiCount;
                tmpReturnWellData.jingKai = youjingKaiDuiCount;
                tmpReturnWellData.jingGuan = youjingGuanDuiCount;
                tmpReturnWellData.data = tmpWellData;
                
                return tmpReturnWellData;
            }

            // 站Json
            var strZhan;
            
            /**
             * 增压站信息生成
             * @returns {undefined}             
             * */
            function createGrid(){
            
                searchKeyword = $.trim($("#txtZenya").val()); 
            
                Grid2= new dhtmlXGridObject('zybz');
                Grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid2.setHeader(["序号","增压站名称","入口温度(℃)","出口温度(℃)","外输压力(MPa)","原油含水率(%)","流量瞬时值(m³/s)","流量累计值(m³)","缓冲罐液位(m)","环境温度#1(℃)","环境温度#2(℃)","电动蝶阀值(0-100)"]);
                Grid2.setInitWidths("50,100,100,100,110,110,135,120,115,120,120,150");
                Grid2.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center");
                Grid2.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid2.init();
                Grid2.setSkin("modern");
                // 增压站数据封装
                getZhanJson('ZENG_YA_ZHAN', Grid2);                
            }
                
            /**
             * 站封装数据
             * @param {type} p_code
             * @param {type} p_grid
             * @returns {undefined}
             */   
            function getZhanJson(p_code, p_grid){
                        
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/zengya',
                    dateType:'json',
                    success: function(jsonZhan){

                        strZhan = jsonZhan;  
                         // 站封装数据
                        var zhanData = new Object();
                        zhanData.rows = [];
                        // 封装井矿信息JSON
                        $.each(strZhan,function(keyZhan, valueZhan){
                            
                            if(valueZhan.name.indexOf(searchKeyword) >= 0){
                            
                                switch(valueZhan.type){

                                    // 增压站
                                    case p_code:

                                        var zhanItem = new Object();
                                        zhanItem.id = valueZhan.id;
                                        zhanItem.data = [];
                                        zhanItem.data.push((keyZhan+1));
                                        zhanItem.data.push(valueZhan.name);
                                        zhanItem.data.push(valueZhan.zyz_ru_kou_wen_du);
                                        zhanItem.data.push(valueZhan.zyz_chu_kou_wen_du);
                                        zhanItem.data.push(valueZhan.zyz_wai_shu_ya_li);
                                        zhanItem.data.push(valueZhan.zyz_han_shui_lv);
                                        zhanItem.data.push(valueZhan.zyz_shun_shi_liu_liang);
                                        zhanItem.data.push(valueZhan.zyz_lei_ji_liu_liang);
                                        zhanItem.data.push(valueZhan.zyz_ye_wei);
                                        zhanItem.data.push(valueZhan.zyz_wen_du_1);
                                        zhanItem.data.push(valueZhan.zyz_wen_du_2);
                                        zhanItem.data.push(valueZhan.zyz_dian_dong_die_fa);

                                        zhanData.rows.push(zhanItem);
                                        break;
                                }
                            }
                        });
                        
                        p_grid.parse(zhanData,'json');
                    }
                });
            }
            
            function jsonManagezs(json,zs){
                var itemson={rows:[]};
                if(zs!=""){
                    for(var i=0;i<json.length;i++){
                        var it={};
                        var na=json[i].value;
                        var chang=zs.length;
                        for(var d=0;d<na.length;d++){
                            var jie=na.substring(d,d+chang);
                            if(zs==jie){
                                it.id = json[i].id;
                                it.data = [];
                                it.data.push(json[i].xu);
                                it.data.push(json[i].value);
                                it.data.push(json[i].yl);
                                it.data.push(json[i].wd);
                                it.data.push(json[i].ll);
                                itemson.rows.push(it);
                            }
                        }
                    }		
                }else{
                    for(var i=0;i<json.length;i++){
                        var it={};
                        it.id = json[i].id;
                        it.data = [];
                        it.data.push(json[i].xu);
                        it.data.push(json[i].value);
                        it.data.push(json[i].yl);
                        it.data.push(json[i].wd);
                        it.data.push(json[i].ll);
                        itemson.rows.push(it);
                    }
                }
                return itemson;
            }
            function createGr(){
                Grid= new dhtmlXGridObject('zsz');
                Grid.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid.setHeader(["序号","注水站名称","压力(MPa)","温度(℃)","流量(m³/d)"]);
                Grid.setInitWidths("75,300,300,300,*");
                Grid.setColAlign("center,center,center,center,center");
                Grid.setColTypes("ro,ro,ro,ro,ro");
                Grid.init();
                Grid.setSkin("clea");
                var zs=document.getElementById("textfiezs").value;
                var zsz=[
                    {"id":"1","xu":"1","value":"北区注水站","yl":"2.7","wd":"19.2","ll":"1324"},
                    {"id":"2","xu":"2","value":"南区注水站","yl":"2.5","wd":"20.5","ll":"1565"},
                    {"id":"3","xu":"3","value":"东区注水站","yl":"3.1","wd":"20.7","ll":"2134"},
                    {"id":"4","xu":"4","value":"西区注水站","yl":"2.8","wd":"23.2","ll":"3421"},
                    {"id":"5","xu":"5","value":"东北区注水站","yl":"2.6","wd":"21.9","ll":"8400"}];
                $.ajax({
                    type: 'POST',
                    //url: 'data/lianxi.json',
                    dateType:'json',
                    success: function(json){
                        var itemson=jsonManagezs(zsz,zs);
                        Grid.clearAll();
                        Grid.parse(itemson,'json');
                    }
                });
                //Grid.load('data/ssjcgrid.json','json');
            }
            function jsonManagejz(json,jz){
                var itemson={rows:[]};
                if(jz!=""){
                    for(var i=0;i<json.length;i++){
                        var it={};
                        var na=json[i].value;
                        var chang=jz.length;
                        for(var d=0;d<na.length;d++){
                            var jie=na.substring(d,d+chang);
                            if(jz==jie){
                                it.id = json[i].id;
                                it.data = [];
                                it.data.push(json[i].xu);
                                it.data.push(json[i].value);
                                it.data.push(json[i].yl);
                                it.data.push(json[i].wd);
                                it.data.push(json[i].ll);
                                itemson.rows.push(it);
                            }
                        }
                    }		
                }else{
                    for(var i=0;i<json.length;i++){
                        var it={};
                        it.id = json[i].id;
                        it.data = [];
                        it.data.push(json[i].xu);
                        it.data.push(json[i].value);
                        it.data.push(json[i].yl);
                        it.data.push(json[i].wd);
                        it.data.push(json[i].ll);
                        itemson.rows.push(it);
                    }
                }
                return itemson;
            }
            function creategr(){
                Grid1= new dhtmlXGridObject('jzz');
                Grid1.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid1.setHeader(["序号","接转站名称","压力(MPa)","温度(℃)","流量(m³/d)"]);
                Grid1.setInitWidths("75,300,300,300,*");
                Grid1.setColAlign("center,center,center,center,center");
                Grid1.setColTypes("ro,ro,ro,ro,ro");
                Grid1.init();
                Grid1.setSkin("mt");
                var jz=document.getElementById("textfiejz").value;
                var jzz=[
                    {"id":"1","xu":"1","value":"北区接转站","yl":"3.5","wd":"16.1","ll":"3698"},
                    {"id":"2","xu":"2","value":"南区接转站","yl":"3.6","wd":"20.6","ll":"1687"},
                    {"id":"3","xu":"3","value":"东区接转站","yl":"3.2","wd":"24.4","ll":"1234"},
                    {"id":"4","xu":"4","value":"西区接转站","yl":"2.9","wd":"22.9","ll":"1365"},
                    {"id":"5","xu":"5","value":"东北区接转站","yl":"2.8","wd":"21.6","ll":"1687"}];
                $.ajax({
                    type: 'POST',
                    //url: 'data/lianxi.json',
                    dateType:'json',
                    success: function(json){
                        var itemson=jsonManagejz(jzz,jz);
                        Grid1.clearAll();
                        Grid1.parse(itemson,'json');
                    }
                });
                //Grid1.load('data/ssjcgrid1.json','json');
            }

            function cregri(){
                var a=document.getElementById("textfield1").value;
                Grid2= new dhtmlXGridObject('zybz');
                Grid2.setImagePath("${ctx}/static/dhtmlx/js/gridcodebase/imgs/");
                Grid2.setHeader(["序号","增压站名称","入口温度(℃)","出口温度(℃)","外输压力(MPa)","原油含水率(%)","流量瞬时值(m³/s)","流量累计值(m³)","缓冲罐液位(m)","环境温度#1(℃)","环境温度#2(℃)","电动蝶阀值(0-100)"]);
                Grid2.setInitWidths("50,100,100,100,110,110,135,120,115,120,120,150");
                Grid2.setColAlign("center,center,center,center,center,center,center,center,center,center,center,center");
                Grid2.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                Grid2.init();
                Grid2.setSkin("modern");
                var se={
                    rows:[
                        {"id":"1","data":["1","1#增压站","30.2","40.3","1.2","56","0.6","199","5.2","30.2","24","50"]},
                        {"id":"2","data":["2","2#增压站","25","41.5","1.3","57","0.5","300","4.3","25","27.5","51"]},
                        {id:3,data:["3","3#增压站","27.3","42.9","1.5","58","0.3","123","4.5","27.3","23","52"]},
                        {id:4,data:["4","4#增压站","19","43.7","1.7","59","1.1","289","3.8","19","19.2","53"]},
                        {id:5,data:["5","5#增压站","22","44","1.4","60","0.9","78","2","22","28","54"]},
                        {id:6,data:["6","6#增压站","21","41","1.7","50","0.8","72","1","21","22","54"]},
                        {id:7,data:["7","7#增压站","28","43","1.9","70","0.3","76","2","25","21","53"]}]	
                };
                $.ajax({
                    type: 'POST',
                    url: 'data/lianxi.json',
                    dateType:'json',
                    success: function(json){
                        var item=jsonManage(se,a);
                        Grid2.clearAll();
                        Grid2.parse(item,'json');
                    }
                });
            }

            var j=0;
            function jsonManage(json,h){
                var item={rows:[]};
                if(h!=""){
                    for(var i=0;i<json.rows.length;i++){
                        var it={};
                        var na=json.rows[i].data[j+1];
                        var chang=h.length;
                        for(var d=0;d<na.length;d++){
                            var jie=na.substring(d,d+chang);
                            if(h==jie){
                                it.id = json.rows[i].id;
                                it.data = [];
                                it.data.push(i+1);
                                it.data.push(json.rows[i].data[j+1]);
                                it.data.push(json.rows[i].data[j+2]);
                                it.data.push(json.rows[i].data[j+3]);
                                it.data.push(json.rows[i].data[j+4]);
                                it.data.push(json.rows[i].data[j+5]);
                                it.data.push(json.rows[i].data[j+6]);
                                it.data.push(json.rows[i].data[j+7]);
                                it.data.push(json.rows[i].data[j+8]);
                                it.data.push(json.rows[i].data[j+9]);
                                it.data.push(json.rows[i].data[j+10]);
                                it.data.push(json.rows[i].data[j+11]);
                                item.rows.push(it);
                            }
                        }
                    }
                }else{
                    for(var i=0;i<json.rows.length;i++){
                        var it={};
                        it.id = json.rows[i].id;
                        it.data = [];
                        it.data.push(i+1);
                        it.data.push(json.rows[i].data[j+1]);
                        it.data.push(json.rows[i].data[j+2]);
                        it.data.push(json.rows[i].data[j+3]);
                        it.data.push(json.rows[i].data[j+4]);
                        it.data.push(json.rows[i].data[j+5]);
                        it.data.push(json.rows[i].data[j+6]);
                        it.data.push(json.rows[i].data[j+7]);
                        it.data.push(json.rows[i].data[j+8]);
                        it.data.push(json.rows[i].data[j+9]);
                        it.data.push(json.rows[i].data[j+10]);
                        it.data.push(json.rows[i].data[j+11]);
                        item.rows.push(it);
                    }
                }
                return item;
            }

            function jk(cdiv){
                $(".cssdiv1").removeClass("s1");
                $(".cssdiv2").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","block");
                $("#gr1").css("display","none");
                $("#gr2").css("display","none");
                $("#gr3").css("display","none");
            }

            function jk1(cdiv){
                $(".cssdiv").removeClass("s1");
                $(".cssdiv2").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","block");
                $("#gr2").css("display","none");
                $("#gr3").css("display","none");
            }

            function jk2(cdiv){
                $(".cssdiv").removeClass("s1");
                $(".cssdiv1").removeClass("s1");
                $(".cssdiv3").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","none");
                $("#gr2").css("display","block");
                $("#gr3").css("display","none");
            }

            function jk3(cdiv){
                $(".cssdiv").removeClass("s1");
                $(".cssdiv1").removeClass("s1");
                $(".cssdiv2").removeClass("s1");
                $(cdiv).addClass("s1");
                $("#gr").css("display","none");
                $("#gr1").css("display","none");
                $("#gr2").css("display","none");
                $("#gr3").css("display","block");
            }
        </script>
        <STYLE type=text/css> 
            div.objbox { 
                SCROLLBAR-FACE-COLOR: #FFFFFF ; 
                SCROLLBAR-HIGHLIGHT-COLOR: #E3E3E3; 
                SCROLLBAR-SHADOW-COLOR: #E3E3E3; 
                SCROLLBAR-3DLIGHT-COLOR: #E3E3E3; 
                SCROLLBAR-ARROW-COLOR: #E3E3E3; 
                SCROLLBAR-TRACK-COLOR: #FFFFFF;
                SCROLLBAR-DARKSHADOW-COLOR: #E3E3E3
            }
        </STYLE>
    </head>
    <body onload="ssjc();"><div id="tmpWell"></div>
        <div id="zz" style="width:3845px; height:717px;border:solid;border-width:1px">
            <!--数据-->
            <div id="ssjc" style="width:1280px; height:69px;  float:left; font-size: 0 " >
                <div id="ssjc" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png"/>
                </div>
                <div id="tool" style="width:119px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a href="#" style="text-decoration:none"><img border="0" src="${ctx}/static/img/ssjk_red.png" style="width:119px; height:33px;"/></a>
                </div>
                <div id="tool1" style="width:125px; height:20;border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left">
                    <a href="${ctx}/alarmpage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/bjzt.png" /></a>
                </div>
                <div id="tool2" style="width:120px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a href="${ctx}/performancepage" style="text-decoration:none"><img border="0" src="${ctx}/static/img/scdt.png" style="width:120px; height:33px;"/></a>
                </div>
                <div id="tool3" style="width:120px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a href="${ctx}/producepage" style="text-decoration:none"><img  border="0" src="${ctx}/static/img/scgl.png" style="width:120px; height:33px;"/></a>
                </div>
                <div id="tool4" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a href="wltp.html" style="text-decoration:none"><img border="0"  src="${ctx}/static/img/txwl.png" style="width:120px; height:33px;"/></a>
                </div>
                <div id="tool5" style="width:120px; height:20; border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <img src="${ctx}/static/img/yjcz.png" style="width:120px; height:33px" />
                </div>
                <div id="tool7" style="width:550px; height:20; float:left" >
                    <img src="${ctx}/static/img/tp.png" style="width:550px; height:33px" />
                </div>
                <!--主页面-->
                <div id="zy" style="width:35px; height:602px; float:left">
                    <!--井矿信息-->
                    <div id="jkxx" class="cssdiv" onclick="jk(this);" style=" width:33px; height:146px;cursor:pointer;background-color:#e6d5ff; font-size:14px; line-height:35px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;">
                        &nbsp;&nbsp;井<br />&nbsp;&nbsp;况<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                    <!--增压站信息-->
                    <div id="zyz" class="cssdiv1" onclick="jk1(this);"  style=" width:33px; height:146px;cursor:pointer;  background-color:#cced94; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                        &nbsp;&nbsp;增<br />&nbsp;&nbsp;压<br />&nbsp;&nbsp;站<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                    <!--注水站信息-->
                    <div id="zszz" class="cssdiv2" onclick="jk2(this);" style=" width:33px;cursor:pointer;  height:147px; background-color:#ffc8db; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                        &nbsp;&nbsp;注<br />&nbsp;&nbsp;水<br />&nbsp;&nbsp;站<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                    <!--接转站信息--> 
                    <div id="jzzz" class="cssdiv3" onclick="jk3(this);" style=" width:33px;cursor:pointer;  height:157px; background-color:#a9e2ff; font-size:14px; line-height:30px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                        &nbsp;&nbsp;接<br />&nbsp;&nbsp;转<br />&nbsp;&nbsp;站<br />&nbsp;&nbsp;信<br />&nbsp;&nbsp;息
                    </div>
                </div>  
                <!--井矿信息-->
                <div id="gr" style="width:1245px; height:602px; float:left">
                    <div id="jdm" style="width:1017px; height:19px;line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                        &nbsp;&nbsp;&nbsp;井&nbsp;&nbsp;&nbsp;况&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;息
                    </div>
                    <div id="jd" style="width:70px;height:19px;  line-height:20px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                        &nbsp;&nbsp;&nbsp;井&nbsp;&nbsp;&nbsp;号
                    </div>
                    <div id="jhxx" style="width:100px; height:19px; background-color:#e6d5ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                        <input type="text" name="textfie" id="textfie" style=" height:13px; width:80px; "/>
                    </div>
                    <div id="jhxx1" style="width:50px; height:19px; background-color:#e6d5ff; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                        <img src="${ctx}/static/img/chaxun.png" onclick="createTreeGridBySearch();" style="cursor:pointer" />
                    </div>
                    <div id="jdd" style="width:1243px; height:578px;top: 10;  border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
                    </div>
                </div>
                <!--增压站信息-->
                <div id="gr1" style="width:1245px; height:602px; float:left; display:none;overflow:scrol">
                    <div id="jdm" style="width:997px;height:19px;line-height:20px; background-color:#cced94; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#cced94; float:left" >
                        &nbsp;&nbsp;&nbsp;增&nbsp;&nbsp;&nbsp;压&nbsp;&nbsp;&nbsp;站&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;息
                    </div>
                    <div id="jd" style="width:90px;height:19px;line-height:20px; background-color:#cced94; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#cced94; float:left" >
                        &nbsp;&nbsp;&nbsp;增&nbsp;&nbsp;&nbsp;压&nbsp;&nbsp;&nbsp;站
                    </div>
                    <div id="zyzxx" style="width:100px; height:19px; background-color:#cced94; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#cced94; float:left" >
                        <input type="text" name="txtZenya" id="txtZenya" style=" height:13px; width:80px;"/>
                    </div>
                    <div id="zyzxx1" style="width:50px; height:19px; background-color:#cced94; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#cced94; float:left" >
                        <img src="${ctx}/static/img/chaxun.png" onclick="createGrid();" style="cursor:pointer" />
                    </div>
                    <div id="zybz" style="width:1243px; height:578px;top: 10; border:solid; border-width:1px; border-color:#cced94; float:left">
                    </div> 
                </div>
                <!--注水站信息-->
                <div id="gr2" style="width:1245px; height:602px; float:left; display:none;overflow:scrol">
                    <div id="jdm" style="width:997px;height:19px;line-height:20px; background-color:#ffc8db; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#ffc8db; float:left" >
                        &nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;水&nbsp;&nbsp;&nbsp;站&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;息
                    </div>
                    <div id="jd" style="width:90px;height:19px;line-height:20px; background-color:#ffc8db; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#ffc8db; float:left" >
                        &nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;水&nbsp;&nbsp;&nbsp;站&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;称
                    </div>
                    <div id="zszxx" style="width:100px; height:19px; background-color:#ffc8db; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#ffc8db; float:left" >
                        <input type="text" name="textfiezs" id="textfiezs" style=" height:13px; width:80px;"/>
                    </div>
                    <div id="zszxx1" style="width:50px; height:19px; background-color:#ffc8db; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#ffc8db; float:left" >
                        <img src="${ctx}/static/img/chaxun.png" onclick="createGr();" style="cursor:pointer" />
                    </div>
                    <div id="zsz" style="width:1243px; height:578px;top: 10;  border:solid; border-width:1px; border-color:#ffc8db; float:left">
                    </div>
                </div>
                <!--接转站信息-->
                <div id="gr3" style="width:1245px; height:602px; float:left; display:none;overflow:scrol">
                    <div id="jdm10" style="width:997px;height:19px;line-height:20px; background-color:#a9e2ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#a9e2ff; float:left" >
                        &nbsp;&nbsp;&nbsp;接&nbsp;&nbsp;&nbsp;转&nbsp;&nbsp;&nbsp;站&nbsp;&nbsp;&nbsp;信&nbsp;&nbsp;&nbsp;息
                    </div>
                    <div id="jd2" style="width:90px; height:19px;line-height:20px;background-color:#a9e2ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#a9e2ff; float:left" >
                        &nbsp;&nbsp;&nbsp;接&nbsp;&nbsp;&nbsp;转&nbsp;&nbsp;&nbsp;站&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;称
                    </div>
                    <div id="jzzxx" style="width:100px; height:19px; background-color:#a9e2ff; font-size:14px; font-weight:bold; border:solid; border-width:1px; border-color:#a9e2ff; float:left" >
                        <input type="text" name="textfiejz" id="textfiejz" style=" height:13px; width:80px;"/>
                    </div>
                    <div id="jzszxx1" style="width:50px; height:19px; background-color:#a9e2ff; font-size:16px; font-weight:bold; border:solid; border-width:1px; border-color:#a9e2ff; float:left" >
                        <img src="${ctx}/static/img/chaxun.png" onclick="creategr();" style="cursor:pointer" />
                    </div>
                    <div id="jzz" style="width:1243px; height:578px;top: 10;  border:solid; border-width:1px; border-color:#a9e2ff; float:left">
                    </div> 
                </div> 
            </div>     
            <!--地图-->
            <div id="dt" style="width:1280px;height:716px; border:solid; border-width:1px; float:left;" >
                <img src="${ctx}/static/img/ditu.jpg"  style="width:1280px;height:716px;"/>
            </div>
            <!--视频-->
            <div id="sp" style="width:1280px;height:716px; border:solid;  border-width:1px; float:left;" >
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

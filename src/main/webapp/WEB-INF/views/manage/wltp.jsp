<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>调度运行</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx-z-w.css">
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
            #xian{
                position:absolute;
                left:460px;
                top:220px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc1{
                position:absolute;
                left:1019px;
                top:600px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc2{
                position:absolute;
                left:1019px;
                top:510px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc3{
                position:absolute;
                left:830px;
                top:577px;
                width:1075px;
                height:27px;
                z-index:1;
            }
            #bc4{
                position:absolute;
                left:1060px;
                top:577px;
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
            .cssdiv:hover{
                color:#09F
            }
        </style>
        <script>
            var treeGrid,Grid,Grid1,Grid2,Grid3,Grid4,dhxWins,dhxTabble,dhxTabbar,dhxWins,dhxWins1,dhxWins2,dhxd,dhxd1,dhxd2,dhxd3,dhxd4;

            var ew='<div id="y" style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input id="kz_name" name="kz_name" type="text" value="" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input id="kz_password" name="kz_password" type="password" value=""  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input id="kz_content" name="kz_content" type="text" value=""  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd();">确定</button></td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx();">取消</button></td></tr></table></div>';
            var anniu='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" id="kz_kaijing" style="background:#81d4ff" onclick="kj();">开井</button></td><td style="width:98px;" align="center"><button type="button" id="kz_tingjing" style="background:#81d4ff" onclick="tj();">停井</button></td></tr></table></div>';
            var sd='<div id="y"style="width:180px;height:30px;float:left;"><table><tr><td style="width:250px" align="center">油井状态:开井</td></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qdd();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qxx();">取消</button><td></tr></table></div>';
            var yt='<div id="y"style="width:186px;height:100px;float:left;font-size:14px;"><table><tr><td style="width:250px" align="left">&nbsp;&nbsp;&nbsp;用户名:&nbsp;<input id="tc_name" name="tc_name" type="text" value="" style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input id="tc_password" name="tc_password" type="password" value=""  style="width:95px;"/></td></tr><tr style="height:10px"></tr><tr><td  style="width:250px" align="left">&nbsp;&nbsp;&nbsp;操作原因:&nbsp;<input id="tc_content" name="tc_content" type="text" value=""  style="width:80px;"/></td></tr><tr style="height:10px"></tr></table></div><div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qd1();">确定</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="qx1();">取消</button><td></tr></table></div>';
            var yc='<div id="k" style="width:186px;height:60px;float:left"><table><tr><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tc();">调参</button><td><td style="width:98px;" align="center"><button type="button" style="background:#81d4ff" onclick="tc_qx();">取消</button><td></tr></table></div>';
            var ytc='<div id="y"style="width:380px;height:60px;float:left"><table border="0" width="100%"><tr><td style="width:150px; " align="left">上行冲程(m)：<input id="tc_scch" name="tc_scch" type="text" value="" style="width:20px;"/></td><td style="width:150px; " align="left">上行冲次(min<SUP>-1</SUP>)：<input id="tc_scci" name="tc_scci" type="text" value="" style="width:20px;"/></td></tr><tr><td style="width:150px; ba" align="left">下行冲程(m)：<input id="tc_xcch" name="tc_xcch" type="text" value="" style="width:20px;"/></td><td style="width:150px; " align="left">下行冲次(min<SUP>-1</SUP>)：<input id="tc_xcci" name="tc_xcci"  type="text" value="" style="width:20px;"/></td></tr></table></div><div id="k" style="width:100%;height:60px;float:left"><table width="100%"><tr><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qd2();">确定</button><td><td style="width:50%;" align="center"><button type="button" style="background:#81d4ff" onclick="qx2();">取消</button><td></tr></table></div>';
           
            var gri='',gr;

            /**
             * 页面初始化
             * @returns {undefined}
             */
            function scdt(){
                
                // 构建井矿信息标签页面
                createTabble();
                // 构建页面数据
                createTreeGrid();
                // 调参、控制弹出框
                createwind();
                // 控制弹出框(开井、关井)
                createwind1();
                // 开井确认操作
                createwind2();
                createwi();
//                createWin();
                $(".cssdiv").addClass("s1");
            }
            
            /**
             * 构建井矿信息标签页面
             * @returns {undefined}
             */
            function createTabble(){
                dhxTabble=new dhtmlXTabBar('tabbarw');
                dhxTabble.setImagePath("${ctx}/static/dhtmlx/imgs/");
                dhxTabble.addTab("tab1", "井矿信息", "85px");
                dhxTabble.setTabActive("tab1");
                dhxTabble.cells("tab1").attachObject("taa1");
            }
            
            /**
             * 调参、控制弹出框
             * @returns {undefined}
             */
            function createwind(){
                dhxd = new dhtmlXWindows();
                dhxd.attachViewportTo(document.body);
                dhxd.createWindow("wi",800,200,200,180);
                dhxd.window("wi").button('minmax2').hide();
                dhxd.window("wi").button('minmax1').hide();
                dhxd.window("wi").button('park').hide();
                dhxd.window("wi").hide();
            }
            
            /**
             * 控制弹出框(开井、关井)
             * @returns {undefined}
             */
            function createwind1(){
                dhxd1 = new dhtmlXWindows();
                dhxd1.attachViewportTo(document.body);
                dhxd1.createWindow("wi1",800,200,180,70);
                dhxd1.window("wi1").button('minmax2').hide();
                dhxd1.window("wi1").button('minmax1').hide();
                dhxd1.window("wi1").button('park').hide();
                dhxd1.window("wi1").hide();
            }
            
            /**
             * 开井确认操作
             * @returns {undefined}
             */
            function createwind2(){
                dhxd2= new dhtmlXWindows();
                dhxd2.attachViewportTo(document.body);
                dhxd2.createWindow("wi2",800,200,180,100);
                dhxd2.window("wi2").button('minmax2').hide();
                dhxd2.window("wi2").button('minmax1').hide();
                dhxd2.window("wi2").button('park').hide();
                dhxd2.window("wi2").hide();
            }
            
            /**
             * 调参
             * @returns {undefined}
             */
            function createwi(){
                dhxd3= new dhtmlXWindows();
                dhxd3.attachViewportTo(document.body);
                dhxd3.createWindow("wi3",872,173,400,130);
                dhxd3.window("wi3").button('minmax2').hide();
                dhxd3.window("wi3").button('minmax1').hide();
                dhxd3.window("wi3").button('park').hide();
                dhxd3.window("wi3").hide();
            }
            
            // 组织机构信息
            var majortagJson;
            // 井信息
            var endtagJson;
            
            // 已选择组织机构
            var selMajorTagData = ',';
            // 搜索井号
            var searchKeyword = ''; 
            // 选择井信息
            var selEndTagData = '';
                
            /**
             * 构建井矿信息标签页面数据
             * @returns {undefined}
             */
            function createTreeGrid(){
                
                // 井矿信息
                var wellData = new Object();
                var wellDataAry = [];
            
                treeGrid= new dhtmlXGridObject('jdd');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("井队名称,远程控制,远程调参");
                treeGrid.setInitWidths("300,500,*");
                treeGrid.setColAlign("left,center,center");
                treeGrid.setColTypes("tree,ed,txt");
                treeGrid.init();
                
                selMajorTagData = ',';
                searchKeyword = '';
                
                // 获得机构信息
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/realtime/majortag',
                    dateType:'json',
                    success: function(json){
                        majortagJson = json;
                        
                        if(json != ''){
                            // 获得油井信息
                            $.ajax({
                                type: 'POST',
                                url: '${ctx}/realtime/youjing',
                                dateType:'json',
                                success: function(jsonYoujing){
                            
                                    endtagJson = jsonYoujing;
                                    // 封装井矿信息JSON
                                    $.each(majortagJson, function(keyMajorTag, valueMajorTag){
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
                                            var tmpWellInfo = createGridItem(majortagJson, tmpMajorTag);         

                                            tmpMajorTag.rows = tmpWellInfo.data;
                                            
                                            wellDataAry.push(tmpMajorTag);
                                        }else{
                                            
                                            return true;
                                        }  
                                    });
                                    
                                    wellData.rows = wellDataAry;

                                    treeGrid.clearAll();
                                    treeGrid.parse(wellData,'json');
                                    
                                    treeGrid.attachEvent('onRowDblClicked', function(rId, cInd){
                                        selEndTagData = '';
                                        if(cInd == 1){
                                            selEndTagData = rId;
                                            dhxd.window("wi").show();
                                            dhxd.window("wi").setText("远程控制");
                                            dhxd.attachEvent("onClose", function(win){
                                                dhxd.window("wi").hide(); 
                                            });
                                            dhxd.window("wi").attachHTMLString(ew);
                                        }else if(cInd == 2){
                                            selEndTagData = rId;
                                            dhxd.window("wi").show();
                                            dhxd.window("wi").setText("远程调参");
                                            dhxd.attachEvent("onClose", function(win){
                                                dhxd.window("wi").hide(); 
                                            });
                                            dhxd.window("wi").attachHTMLString(yt);
                                        }
                                    });
                                }
                            });
                        }
                    }
                });
            }
            
            /**
             * 构建井矿信息标签页面数据（查询用）
             * @returns {undefined}
             */
            function createTreeGridBySearch(){
            
                var wellData = new Object();
                var wellDataAry = [];
                
                treeGrid= new dhtmlXGridObject('jdd');
                treeGrid.selMultiRows = true;
                treeGrid.imgURL = "${ctx}/static/dhtmlx/js/gridcodebase/imgs/icons_greenfolders/";
                treeGrid.setHeader("井队名称,远程控制,远程调参");
                treeGrid.setInitWidths("300,500,*");
                treeGrid.setColAlign("left,center,center");
                treeGrid.setColTypes("tree,ed,txt");
                treeGrid.init();
                
                selMajorTagData = ',';
                searchKeyword = $.trim($("#textfie").val());
                
                // 封装井矿信息JSON
                $.each(majortagJson, function(keyMajorTag, valueMajorTag){
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
                        var tmpWellInfo = createGridItem(majortagJson, tmpMajorTag);         

                        tmpMajorTag.rows = tmpWellInfo.data;
                                            
                        wellDataAry.push(tmpMajorTag);
                    }else{
                        return true;
                    }  
                });
                                    
                wellData.rows = wellDataAry;

                treeGrid.clearAll();
                treeGrid.parse(wellData,'json');
                                    
                treeGrid.attachEvent('onRowDblClicked', function(rId, cInd){
                    selEndTagData = '';
                    if(cInd == 1){
                        selEndTagData = rId;
                        dhxd.window("wi").show();
                        dhxd.window("wi").setText("远程控制");
                        dhxd.attachEvent("onClose", function(win){
                            dhxd.window("wi").hide(); 
                        });
                        dhxd.window("wi").attachHTMLString(ew);
                    }else if(cInd == 2){
                        selEndTagData = rId;
                        dhxd.window("wi").show();
                        dhxd.window("wi").setText("远程调参");
                        dhxd.attachEvent("onClose", function(win){
                            dhxd.window("wi").hide(); 
                        });
                        dhxd.window("wi").attachHTMLString(yt);
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
                            
                            var tmpYoujingData = [];
                            $.each(endtagJson, function(keyYoujing, valueYoujing)
                            {
                                if(valueMajorTagList.id == valueYoujing.major_tag_id && (valueYoujing.name.indexOf(searchKeyword) >= 0)){
                                    
                                    var tmpYoujingTag = new Object(); 
                                    tmpYoujingTag.id = 'j||' + valueYoujing.id + '||' + valueYoujing.state;
                                    tmpYoujingTag.open = 1;
                                    tmpYoujingTag.data = [];
                                    // 名称设置
                                    var youjingName = {};
                                    youjingName.value = valueYoujing.name;
                                    youjingName.image = 'folder.gif';                                            
                                    tmpYoujingTag.data.push(youjingName);
   
                                    // 开关井状态
                                    if(valueYoujing.state == "false"){
                                        tmpYoujingTag.data.push('关井');
                                    }else{
                                        tmpYoujingTag.data.push('开井');
                                    }
                                    // 远程调参
                                    tmpYoujingTag.data.push('调参');
                        
                                    tmpYoujingData.push(tmpYoujingTag);
                                }
                            });
                            
                            tmpMajorTag.rows = tmpYoujingData;  

                        }else{

                            var tmpWellInfo = createGridItem(p_MajorTagList, tmpMajorTag);         

                            tmpMajorTag.rows = tmpWellInfo.data;
                        }                      
                                            
                        tmpWellData.push(tmpMajorTag);
                    }
                    else{
                        return true;
                    }
                });
                
                tmpReturnWellData.data = tmpWellData;
                
                return tmpReturnWellData;
            }

            /**
             * 远程控制窗口--确定事件
             * @returns {undefined}             
             * */
            function qd(){
                
                if($.trim($("#kz_name").val()) == ""){
                    alert("请输入用户名！");
                    return false;
                }else if($.trim($("#kz_password").val()) == ""){
                    alert("请输入密码！");
                    return false;
                }else if($.trim($("#kz_content").val()) == ""){
                    alert("请输入操作原因！");
                    return false;
                }
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/alarm/mobileLogin',
                    data:{username:$.trim($("#kz_name").val()),password:$.trim($("#kz_password").val())},
                    dateType:'json',
                    success: function(json){
                        if(json.state == "1"){
                            dhxd.window("wi").hide();
                            dhxd1.window("wi1").show();
                            dhxd1.window("wi1").setText("远程控制");
                            dhxd1.attachEvent("onClose", function(win){
                               dhxd1.window("wi1").hide(); 
                            });
                            dhxd1.window("wi1").attachHTMLString(anniu);

                            var endTagTmp = selEndTagData.split("||");
                            if(endTagTmp[2] == "false"){
                                $("#kz_tingjing").attr({'disabled':'disabled'});
                                $("#kz_kaijing").removeAttr('disabled');
                            }else{                                
                                $("#kz_kaijing").attr({'disabled':'disabled'});
                                $("#kz_tingjing").removeAttr('disabled');
                            }  
                        }else{
                            alert("用户名或密码错误！");
                            return false;
                        }                        
                    }
                });                                
            }

            /**
             * 远程控制--取消
             * @returns {undefined}             
             * */
            function qx(){
                dhxd.window("wi").hide();
            }
            
            /**
             * 开井操作
             * @returns {undefined}             
             * */
            function kj(){
            
                dhxd1.window("wi1").hide();
                dhxd2.window("wi2").show();
                dhxd2.window("wi2").setText("远程控制");
                dhxd2.attachEvent("onClose", function(win){
                    dhxd2.window("wi2").hide(); 
                });
                dhxd2.window("wi2").attachHTMLString(sd);                 
            }
            
            /**
             * 停井操作
             * @returns {undefined}             
             * */
            function tj(){
                
                var endTagTmp = selEndTagData.split("||");
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/manage/saveYkData',
                    data:{id:endTagTmp[1],state:"0",content:$.trim($("#kz_content").val())},
                    dateType:'json',
                    success: function(json){
                        if(json.state == "1"){
                            createTreeGrid();
                        }else{
                            alert("调控发生错误，请重新操作或与管理员联系！");
                            return false;
                        }                        
                    }
                });
                
                dhxd1.window("wi1").hide();	
            }
            
            /**
             * 开井确定操作
             * @returns {undefined}             
             * */
            function qdd(){
                
                var endTagTmp = selEndTagData.split("||");
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/manage/saveYkData',
                    data:{id:endTagTmp[1],state:"1",content:$.trim($("#kz_content").val())},
                    dateType:'json',
                    success: function(json){
                        if(json.state == "1"){
                            createTreeGrid();
                        }else{
                            alert("调控发生错误，请重新操作或与管理员联系！");
                            return false;
                        }                        
                    }
                });
                
                dhxd2.window("wi2").hide();	
            }
            
            /**
             * 开井取消操作
             * @returns {undefined}             
             * */
            function qxx(){
                dhxd2.window("wi2").hide();
            }
            
            /**
             * 远程调参窗口
             * @returns {Boolean}
             */
            function qd1(){
                 
                if($.trim($("#tc_name").val()) == ""){
                    alert("请输入用户名！");
                    return false;
                }else if($.trim($("#tc_password").val()) == ""){
                    alert("请输入密码！");
                    return false;
                }else if($.trim($("#tc_content").val()) == ""){
                    alert("请输入操作原因！");
                    return false;
                }
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/alarm/mobileLogin',
                    data:{username:$.trim($("#tc_name").val()),password:$.trim($("#tc_password").val())},
                    dateType:'json',
                    success: function(json){
                        if(json.state == "1"){
                            
                            dhxd.window("wi").hide();
                            dhxd1.window("wi1").show();
                            dhxd1.window("wi1").setText("远程调参");
                            dhxd1.attachEvent("onClose", function(win){
                                dhxd1.window("wi1").hide(); 
                            });
                            dhxd1.window("wi1").attachHTMLString(yc);
                        }else{
                            alert("用户名或密码错误！");
                            return false;
                        }                        
                    }
                }); 
            }
            
            /**
             * 远程调参--取消
             * @returns {undefined}             
             * */
            function qx1(){
                dhxd.window("wi").hide();
            }
            
            var tc_scch;
            var tc_scci;
            var tc_xcch;
            var tc_xcci;
            
            /**
             * 远程调参--确定
             * @returns {undefined}
             */
            function tc(){
                dhxd1.window("wi1").hide();
                dhxd3.window("wi3").show();
                dhxd3.window("wi3").setText("远程调参");
                dhxd3.attachEvent("onClose", function(win){
                    dhxd3.window("wi3").hide(); 
                });                
            
                var endTagTmp = selEndTagData.split("||");
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/manage/getYtData',
                    data:{id:endTagTmp[1]},
                    dateType:'json',
                    success: function(json){
                
                        dhxd3.window("wi3").attachHTMLString(ytc);
                        if(json != ""){
                            
                            tc_scch = (json.tc_scch == null ? "0" : json.tc_scch);
                            tc_scci = (json.tc_scci == null ? "0" : json.tc_scci);
                            tc_xcch = (json.tc_xcch == null ? "0" : json.tc_xcch);
                            tc_xcci = (json.tc_xcci == null ? "0" : json.tc_xcci);
                            
                            $("#tc_scch").val(tc_scch);
                            $("#tc_scci").val(tc_scci);
                            $("#tc_xcch").val(tc_xcch);
                            $("#tc_xcci").val(tc_xcci);
                        }                       
                    }
                });
            }
            
            /**
             * 远程调参--取消
             * @returns {undefined}
             */
            function tc_qx(){
               dhxd1.window("wi1").hide();
            }
            
            /**
             * 调参--确定
             * @returns {undefined}
             */
            function qd2(){
                
                if($.trim($("#tc_scch").val()) == ""){
                    alert("请输入上行冲程！");
                    return false;
                }else if($.trim($("#tc_scci").val()) == ""){
                    alert("请输入上行冲次！");
                    return false;
                }else if($.trim($("#tc_xcch").val()) == ""){
                    alert("请输入下行冲程！");
                    return false;
                }else if($.trim($("#tc_xcci").val()) == ""){
                    alert("请输入下行冲次！");
                    return false;
                }
                
                var endTagTmp = selEndTagData.split("||");
            
                // 用户验证
                $.ajax({
                    type: 'POST',
                    url: '${ctx}/manage/saveYtData',
                    data:{id:endTagTmp[1],content:$.trim($("#tc_content").val()),
                        scch:$.trim($("#tc_scch").val()) + "||" + tc_scch,scci:$.trim($("#tc_scci").val()) + "||" + tc_scci,
                        xcch:$.trim($("#tc_xcch").val()) + "||" + tc_xcch,xcci:$.trim($("#tc_xcci").val()) + "||" + tc_xcci},
                    dateType:'json',
                    success: function(json){
                        if(json.state == "1"){
                            alert("调参成功！");
                            dhxd3.window("wi3").hide();
                        }else{
                            alert("调参发生错误，请重新操作或与管理员联系！");
                            return false;
                        }                        
                    }
                }); 
            }
            
            /**
             * 调参--取消
             * @returns {undefined}
             */
            function qx2(){
                dhxd3.window("wi3").hide();
            }
        </script>
    </head>
    <body onload="scdt();">
        <div id="zz" style="width:3845px; height:717px;border:solid;border-width:1px">
            <!--数据-->
            <div id="ssjc" style="width:1280px; height:69px;  float:left; font-size: 0 " >
                <div id="ssjc" style="width:1280px; height:10;">
                    <img src="${ctx}/static/img/head.png"/>
                </div>
                <div id="tool" style="width:119px; height:20;  border-right-style:solid; border-right-color:#06F; border-right-width:1px; float:left" >
                    <a href="${ctx}/main" style="text-decoration:none"><img border="0" src="${ctx}/static/img/ssjk_red.png" style="width:119px; height:33px;"/></a>
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
                <div id="zy" style="width:35px; height:602px;float:left">
                    <!--启停井控制-->
                    <div id="qtjkz" class="cssdiv" style=" width:33px; height:230px;cursor:pointer;background-color:#e6d5ff; font-size:14px; line-height:35px; font-weight:bold; float:center;border-right-style:solid; border-right-color:#06F; border-right-width:1px;">
                        &nbsp;&nbsp;启<br />&nbsp;&nbsp;停<br />&nbsp;&nbsp;井<br />&nbsp;&nbsp;控<br />&nbsp;&nbsp;制<br />&nbsp;&nbsp;况
                    </div>
                    <div id="qtjkz1" class="cssdiv1" style=" width:33px; height:369px;cursor:pointer;background-color:#FFF; font-size:14px; line-height:35px; font-weight:bold; float:center;border-right-style:solid;border-right-color:#06F; border-right-width:1px;border-top-style:solid; border-top-color:#06F; border-top-width:1px;">
                    </div>
                </div>
                <!--井矿信息-->
                <div id="tabbarw" style="width:1245px; height:602px; float:left"></div>
                <div id="ta1" style="width:1251px;height:600px"></div>
                <div id="taa1" style="width:1248px; height:595px">
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
                    <div id="jdd" style="width:1248px; height:595px;top: 10; background-color:#C6C; border:solid; border-width:1px; border-color:#e6d5ff; float:left" >
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
            <a href="ssjczq.html" ><img border="0"  src="i${ctx}/static/img/3.png" /></a>
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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlx/dhtmlx.css">
<script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
<script src="${ctx}/static/jquery/jquery.form.js"></script> 
<script src="${ctx}/static/dhtmlx/dhtmlx.js"></script>
<style>
    html, body {
        width: 100%;
        height: 100%;
        margin: 0px;
        overflow: hidden;
        font-size:12px;
    }
    a:link {
		COLOR: #0065ce; TEXT-DECORATION: none
	}
	a:visited {
		COLOR: #0065ce; TEXT-DECORATION: none
	}
	a:hover {
		COLOR: #ff0000; TEXT-DECORATION: underline
	}
</style>
<script>
var dhxLayout,toolbar,mygrid,userItem;
window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
function doOnLoad(){
	  creatLayout();
	  creatToolbar();
	  
	  $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/role/list',
		  success: function(json){
			var item=jsonManage(json);
			creatGrid(item);
		  }
	  });
        dhxWins = new dhtmlXWindows();
        dhxWins.attachViewportTo(document.body);
        var w1=dhxWins.createWindow('win',0,0,450,400);
        w1.button('minmax2').hide();
        w1.button('minmax1').hide();
        w1.button('park').hide();
        dhxWins.window('win').hide();
        dhxWins.attachEvent("onClose", function(win){
            winClose();
        });
        dhxWins.window('win').center();
	  
}
/**
 * 窗口关闭
 * @returns {undefined}
 */
function winClose(){
    dhxWins.window('win').hide();
    dhxWins.window('win').setModal(false);
    document.getElementById("addForm").reset();
    document.getElementById("updateForm").reset();
    document.getElementById("addRole").style.display='none';
    document.getElementById("updateRole").style.display='none';
  
}
/**
 * JSON信息管理
 * @param {type} json
 * @returns {jsonManage.item}
 */
function jsonManage(json){
        var item={rows:[]};
        for(var i=0;i<json.length;i++){
                var it={};
                it.id = json[i].id;
                it.data = [];
                it.data.push(0);
                it.data.push(json[i].name);
                it.data.push(json[i].description);
                item.rows.push(it);
        }
        return item;
}
/**
 * 创建菜单栏
 * @returns {undefined}
 */
function creatToolbar(){
	toolbar=dhxLayout.cells("a").attachToolbar();
    toolbar.setIconsPath("${ctx}/static/dhtmlx/imgs/");
	toolbar.addButton("add", 1, "添加角色",'edit_add.png');
  	toolbar.addButton("update", 2, "编辑角色",'pencil.png');
	toolbar.addButton("drop", 3, "删除角色",'edit_remove.png');
    toolbar.addButton("setup", 4, "权限设置",'edit_remove.png');
    toolbar.attachEvent("onClick", doOnClick);
}
//toolbar按钮调用
function doOnClick(itemId){
    if(itemId=='add'){
        addDiv("addRole","添加角色");
    }else if(itemId=='update'){
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
            alertMessage("请选择用户");
            return;
        }
        $.post("${ctx}/admin/role/findUserRoleByID",
        {
          roleId:selectedId
        },
        function(data){
          userItem=data;
          $("#update_roleName").val(data.name);
          $("#update_roleDescription").val(data.description);
          $("#update_roleID").val(data.id);
        });
    
        addDiv("updateRole","编辑角色");
    }else if(itemId=='drop'){
        dropMessage();
    }else if(itemId=='setup'){
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
            alertMessage("请选择用户");
            return;
        }
        window.location.href="${ctx}/admin/role/roleMenu?id=" + selectedId;
    }
}
/**
* 创建显示窗口

 * @param {type} id
 * @param {type} title
 * @returns {undefined} */
function addDiv(id,title){
     dhxWins.window('win').show();
     dhxWins.window('win').setText(title);
     dhxWins.window('win').setModal(true);
     document.getElementById(id).style.display='block';
     dhxWins.window('win').appendObject(id);
}
/**
 * 设置布局
 * @returns {undefined}
 */
function creatLayout(){
	dhxLayout=new dhtmlXLayoutObject(document.body, "1C");
	dhxLayout.cells("a").hideHeader();
}
/**
 * 创建数据显示Grid
 * @param {type} json
 * @returns {undefined}
 */
function creatGrid(json){
	mygrid=dhxLayout.cells("a").attachGrid(); 
	mygrid.setImagePath("imgs/");
	mygrid.setHeader("序号,角色名称,角色说明");
	mygrid.setInitWidths("100,100,*");
	mygrid.setColAlign("center,left,left");
	mygrid.setColTypes("cntr,txt,txt");
	mygrid.setColSorting("int,str,str");
	mygrid.init();
	mygrid.parse(json,'json');
}
/**
 * 绑定数据
 * @returns {undefined}
 */
function getGridRowsData(){
    	  $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/role/list',
		  success: function(json){
			var item=jsonManage(json);
                        //mygrid.init();
                        mygrid.clearAll();
			mygrid.parse(item,'json');
		  }
	  });
}
/**
* 信息提示

 * @param {type} value
 * @returns {undefined} */
function alertMessage(value){
        dhtmlx.message({
		title: "消息提示",
                type: "alert",
		text: value
        });
}
/**
 * 添加角色
 * @returns {Boolean}
 */
function addRolseFormSubmit(){
    var uName=$("#roleName").val();
    var rName=$("#roleDescription").val();
    if(uName==''|| uName==null){
        alertMessage("角色名称不能为空");
        
        return;
    }
    if(rName==''|| rName==null){
        alertMessage("角色说明不能为空");
        return;
    }
     var options = {    
        success:function(data) {   
            if(data=='true'){
                alertMessage("添加角色成功");
                winClose();
                getGridRowsData();
            }else{
                alertMessage("添加角色失败，请重新操作");
                winClose();
            }
        }
      }; 
      $('#addForm').ajaxSubmit(options);
      return false;
}
/**
* 删除用户

 * @returns {unresolved} */
function dropMessage(){
    var selectedId=mygrid.getSelectedRowId();
    if(selectedId==null){
        alertMessage("请选择用户");
        return;
    }
    dhtmlx.message({ 
        type:"confirm", 
        text:"确定要删除此用户?",
        title:"删除用户",
        ok:"是",
        cancel:"否",
        callback: function(id) {
            if(id==true){
                drop(selectedId);
            }
        }
    });
}
//编辑用户
function updateRoleFormSubmit(){
    var uName=$("#update_roleName").val();
    var rName=$("#update_roleDescription").val();
    if(uName==''|| uName==null){
        alertMessage("角色名称不能为空");
        
        return;
    }
    if(rName==''|| rName==null){
        alertMessage("角色说明不能为空");
        return;
    }
     var options = {    
        success:function(data) {   
            if(data=='true'){
                alertMessage("编辑角色成功");
                winClose();
                getGridRowsData();
            }else{
                alertMessage("编辑角色失败，请重新操作");
                winClose();
            }
        }
      }; 
      $('#updateForm').ajaxSubmit(options);
      return false;
}
//删除角色
function drop(selectedId){
   $.ajax({
        type: 'POST',
        url: '${ctx}/admin/role/delUserRole',
        data:"id="+selectedId,
        success: function(json){
             if(json=='true'){
                 alertMessage("删除成功!");
                 getGridRowsData();
             }else{
                 alertMessage("删除失败！请重新操作。");
             }
        }
    });
}
</script>
</head>

<body onload="doOnLoad()">
<div id="addRole" style=" display:none;text-align:center;padding:50px;line-height:50px">
    <form id="addForm" name="addForm" action="${ctx}/admin/role/saveRole" method="post" autocomplete=off >
            <div style=" margin: 5px;">
                <label for="roleName">角色名称:</label>
                <input type="text" name="name" id="roleName"></input>
            </div>
            <div style=" margin: 5px;">
                <label for="roleDescription">角色说明:</label>
                <input  type="text" name="description" id="roleDescription"></input>
            </div>
            <div style=" margin: 10px; text-align: center">
                <input id="submit_btn"  type="button" onclick="addRolseFormSubmit()" value="提交"/>
            </div>
    </form>
</div>
<div id="updateRole" style=" display:none;text-align:center;padding:50px;line-height:50px">
    <form id="updateForm" name="updateForm" action="${ctx}/admin/role/saveRole" method="post" autocomplete=off >
            <div style=" margin: 5px;">
                <label for="update_roleName">角色名称:</label>
                <input type="hidden" name="id" id="update_roleID" value=""></input>
                <input type="text" name="name" id="update_roleName"></input>
            </div>
            <div style=" margin: 5px;">
                <label for="update_roleDescription">角色说明:</label>
                <input  type="text" name="description" id="update_roleDescription"></input>
            </div>
            <div style=" margin: 10px; text-align: center">
                <input id="submit_btn"  type="button" onclick="updateRoleFormSubmit()" value="提交"/>
            </div>
    </form>
</div>
</body>
</html>
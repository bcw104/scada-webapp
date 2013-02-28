<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
var dhxLayout,toolbar,mygrid,dhxWins,dhxCombo;
window.dhx_globalImgPath = "${ctx}/static/dhtmlx/imgs/";
//加载执行
function doOnLoad(){
	  creatLayout();
	  creatToolbar();  
	  $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/user/findUser',
		  success: function(json){
			var item=jsonManage(json);
			creatGrid(item);
		  }
	  });
        creatCombo();
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
 //提供回调函数，提供提交返回结果的处理   
      
       
   //初始化验证插件，如果提交出错，则弹出对话框，如果正确，则通过ajax提交表单请求。   
    
      

}
function winClose(){
    dhxWins.window('win').hide();
    dhxWins.window('win').setModal(false);
    document.getElementById("addForm").reset();
    document.getElementById("updateForm").reset();
    document.getElementById("passForm").reset();
    document.getElementById("addUser").style.display='none';
    document.getElementById("updateUser").style.display='none';
    document.getElementById("passUser").style.display='none';
}
//json管理
function jsonManage(json){
        var item={rows:[]};
        for(var i=0;i<json.length;i++){
                var it={};
                it.id = json[i].user.id;
                it.data = [];
                it.data.push(0);
                it.data.push(json[i].user.username);
                it.data.push(json[i].realName);
                var sex="";
                if(json[i].gender==1){
                    sex="男";
                }else{
                    sex="女";
                }
                it.data.push(sex);
                it.data.push(json[i].department);
                it.data.push(json[i].address);
                it.data.push(json[i].telphone);
                it.data.push(json[i].email);
                it.data.push(json[i].user.userRole.name);
                item.rows.push(it);
        }
        return item;
}
//创建toolbar
function creatToolbar(){
	toolbar=dhxLayout.cells("a").attachToolbar();
  //toolbar.setIconsPath("imgs/dhxtoolbar_dhx_skyblue/");
	toolbar.addButton("add", 1, "添加用户");
  	toolbar.addButton("update", 2, "编辑用户");
  	toolbar.addButton("pass", 3, "修改密码");
	toolbar.addButton("drop", 4, "删除用户");
        toolbar.attachEvent("onClick", doOnClick);
}
//toolbar按钮调用
function doOnClick(itemId){
    if(itemId=='add'){
        addDiv("addUser","添加用户");
    }else if(itemId=='update'){
        addDiv("updateUser","编辑用户");
    }else if(itemId=='pass'){
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
        alertMessage("请选择用户");
        return;
        }
        addDiv("passUser","修改密码");
    }else if(itemId=='drop'){
        dropMessage();
    }
}
//新建用户
function addDiv(id,title){
     dhxWins.window('win').show();
     dhxWins.window('win').setText(title);
     dhxWins.window('win').setModal(true);
     document.getElementById(id).style.display='block';
     if(id=="addUser"){
       
     }
     dhxWins.window('win').appendObject(id);
}
function creatCombo(){
     dhxCombo=new dhtmlXCombo("combo_zone4","combo_select.gif",100);
        $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/role/list',
		  success: function(json){
                        var temp=[]; 
                        var sid=json[0].id;
			for(var i=0;i<json.length;i++){
                            var item=[];
                            item.push(json[i].id);
                            item.push(json[i].name);
                            temp.push(item);
                        }
                        dhxCombo.addOption(temp);
		  }
	  });
}
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
//删除用户
function drop(selectedId){
    
   $.ajax({
        type: 'POST',
        url: '${ctx}/admin/user/delUserExtInfo',
        data:"userid="+selectedId,
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
//创建布局
function creatLayout(){
	dhxLayout=new dhtmlXLayoutObject(document.body, "1C");
	dhxLayout.cells("a").hideHeader();
}
//创建GRID
function creatGrid(json){
	mygrid=dhxLayout.cells("a").attachGrid(); 
	mygrid.setImagePath("imgs/");
	mygrid.setHeader("序号,用户名,真实姓名,性别,部门,地址,电话,Email,角色");
	mygrid.setInitWidths("50,100,100,100,100,100,100,100,*");
	mygrid.setColAlign("left,left,left,left,left,left,left,left,left");
        mygrid.setColTypes("cntr,txt,txt,txt,txt,txt,txt,txt,txt");
	mygrid.setColSorting("int,str,str,str,str,str,str,str,str");
        mygrid.setEditable(false);
	mygrid.init();
	mygrid.parse(json,'json');
}
function getGridRowsData(){
    	  $.ajax({
		  type: 'POST',
		  url: '${ctx}/admin/user/findUser',
		  success: function(json){
			var item=jsonManage(json);
                        //mygrid.init();
                        mygrid.clearAll();
			mygrid.parse(item,'json');
		  }
	  });
}
//添加新用户
function addUserFormSubmit(){
    var uName=$("#userName").val();
    var rName=$("#relName").val();
    var dption=dhxCombo.getSelectedValue();
    var pass=$("#newPassword").val();
    var rpass=$("#relPassword").val();
    if(uName==''|| uName==null){
        alertMessage("用户名不能为空");
        
        return;
    }
    if(rName==''|| rName==null){
        alertMessage("姓名不能为空");
        return;
    }
    if(dption==''|| dption==null){
        alertMessage("角色不能为空");
        return;
    }else{
        $("#description").val(dption);
    }
    if(pass==''|| pass==null){
        alertMessage("密码不能为空");
        return;
    }
     if(rpass==''|| rpass==null){
        alertMessage("请确认密码！");
        return;
    }
    if(pass!=rpass){
        alertMessage("新设密码与原始密码不相符，请重新输入！");
        return;
    }
     var options = {    
        success:function(data) {   
            if(data=='true'){
                alertMessage("添加用户成功");
                winClose();
                getGridRowsData();
            }
        }
      }; 
      $('#addForm').ajaxSubmit(options);
      return false;
}
//修改密码
function updatePass(){
    var selectedId=mygrid.getSelectedRowId();
    var pass=$("#newPass").val();
    var rpass=$("#rePass").val();
    if(pass==''|| pass==null){
        alertMessage("密码不能为空");
        return;
    }
     if(rpass==''|| rpass==null){
        alertMessage("请确认密码！");
        return;
    }
    if(pass!=rpass){
        alertMessage("新设密码与原始密码不相符，请重新输入！");
        return;
    }
     $.post("${ctx}/admin/user/updatePass",
        {
          newPass:pass,
          rePass:rpass,
          userID:selectedId
        },
        function(data){
          if(data=='true'){
              alertMessage("修改密码成功！");
              winClose();
          }else if(data=='passWorng'){
              alertMessage("新设密码与原始密码不相符，请重新输入！");
          }else{
              alertMessage("操作失败，请重新操作"); 
          }
        });

}
function alertMessage(value){
        dhtmlx.message({
		title: "消息提示",
                type: "alert",
		text: value
        });
}
</script>
</head>

<body onload="doOnLoad()">
<div id="addUser" style=" display:none;line-height:10px">
    <form id="addForm" name="addForm" action="${ctx}/admin/user/addUser" method="post" autocomplete=off >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="text" name="user.username" id="userName"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="realName" id="relName"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">性别：</td>
                <td><input name="gender" type="radio" value="1" checked />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="gender" type="radio" value="0" />女</td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="department" id="department"></input></td>
              </tr>
              <tr >
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="address" id="address"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="email" id="email"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="telphone" id="telphone"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">角色：</td>
                <td valign="middle" style="padding-top:3px"><input type="hidden" name="role_id" id="description" value=""></input><div id="combo_zone4" style="width:100px; height:25px;"></div></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">密码：</td>
                <td><input type="password" name="user.shaPassword" id="newPassword"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">确认密码：</td>
                <td><input type="password" name="relPass" id="relPassword"></input></td>
              </tr>
              <tr>
                  <td colspan="2" height="30" align="center"> <input id="submit_btn"  type="button" onclick="addUserFormSubmit()"  value="提交"/></td>
              </tr>
            </table>
	</form>
</div>
<div id="updateUser" style=" display:none">
     <form id="updateForm" action="${ctx}/register" method="post" autocomplete=off>
<!--            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">用户名：</td>
                <td><input type="text" name="newPass" id="newPass" readonly="true"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">姓名：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">性别：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">部门：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr >
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">地址：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">E-mail：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">电话：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              <tr>
                <td width="40%" height="30" align="right"valign="middle" style="padding-right:10px;">角色：</td>
                <td><input type="text" name="newPass" id="newPass"></input></td>
              </tr>
              
              <tr>
                  <td colspan="2" height="90" align="center"> <input id="submit_btn"  type="button" value="提交"/></td>
              </tr>
            </table>-->
	</form>
</div>
<div id="passUser" style=" display:none;text-align:center;padding:50px;line-height:50px">
    <form id="passForm">
            <div style=" margin: 5px;">
                <label for="newPass">新设密码:</label>
                <input type="hidden" name="userID" id="userid_pass" value="">
                <input type="password" name="newPass" id="newPass"></input>
            </div>
            <div style=" margin: 5px;">
                <label for="rePass">确认密码:</label>
                <input  type="password" name="rePass" id="rePass"></input>
            </div>
            <div style=" margin: 10px; text-align: center">
                <input id="submit_btn"  type="button" onclick="updatePass()" value="提交"/><input id="btn"  type="button" onclick="winClose();" value="取消"/>
            </div>
    </form>
</div>
</body>
</html>
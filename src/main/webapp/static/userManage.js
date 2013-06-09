/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var dhxLayout,toolbar,mygrid,dhxWins,dhxCombo,dhxComboUpdate,userItem;
window.dhx_globalImgPath = objUrl+"/static/dhtmlx/imgs/";
//加载执行
function doOnLoad(){
	  creatLayout();
	  creatToolbar();  
	  $.ajax({
		  type: 'POST',
		  url: objUrl+'/admin/user/findUser',
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
    toolbar.setIconsPath(objUrl+"/static/dhtmlx/imgs/");
	toolbar.addButton("add", 1, "添加用户",'edit_add.png');
  	toolbar.addButton("update", 2, "编辑用户",'pencil.png');
  	toolbar.addButton("pass", 3, "修改密码",'password.png');
	toolbar.addButton("drop", 4, "删除用户",'edit_remove.png');
    toolbar.addButton("permission", 5, "用户权限",'permission.png');
    toolbar.attachEvent("onClick", doOnClick);
}
//toolbar按钮调用
function doOnClick(itemId){
    if(itemId=='add'){
        addDiv("addUser","添加用户");
    }else if(itemId=='update'){
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
            alertMessage("请选择用户");
            return;
        }
        $.post(objUrl+"/admin/user/findUserExtInfoByUserID",
        {
          userID:selectedId
        },
        function(data){
          userItem=data;
            $("#update_userid").val(userItem.user.id);
            $("#update_uName").val(userItem.user.username);
            $("#update_rName").val(userItem.realName);
            $('[name="gender"]:radio').each(
                function() { 
                   if (this.value == userItem.gender) { this.checked = true;} 
            });            
            $("#update_department").val(userItem.department);
            $("#update_address").val(userItem.address);
            $("#update_email").val(userItem.email);
            $("#update_telphone").val(userItem.telphone);
            $("#update_description").val(userItem.user.userRole.id);
            dhxComboUpdate.setComboValue(userItem.user.userRole.id);
            dhxComboUpdate.setComboText(userItem.user.userRole.name);
            
            $('[name="headflg"]:radio').each(
                function() { 
                   if (this.value == userItem.headflg) { this.checked = true;} 
            });    
            $('[name="receiveflg"]:radio').each(
                function() { 
                   if (this.value == userItem.receiveflg) { this.checked = true;} 
            });  
        });
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
    }else if(itemId=='permission'){
        
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
            alertMessage("请选择用户");
            return;
        }
        
        window.location.href= objUrl+ "/admin/user/userPermissionList?id=" + selectedId;
    }
}
//新建用户
function addDiv(id,title){
     dhxWins.window('win').show();
     dhxWins.window('win').setText(title);
     dhxWins.window('win').setModal(true);
     document.getElementById(id).style.display='block';
     if(id=='updateUser'){
       
     }
     dhxWins.window('win').appendObject(id);
}
function creatCombo(){
     dhxCombo=new dhtmlXCombo("combo_zone4","combo_select.gif",100);
     dhxComboUpdate=new dhtmlXCombo("combo_zone5","combo_select.gif",100);
        $.ajax({
		  type: 'POST',
		  url: objUrl+'/admin/role/list',
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
                        dhxComboUpdate.addOption(temp);
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
        url: objUrl+'/admin/user/delUserExtInfo',
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
		  url: objUrl+'/admin/user/findUser',
		  success: function(json){
			var item=jsonManage(json);
                        //mygrid.init();
                        mygrid.clearAll();
			mygrid.parse(item,'json');
		  }
	  });
}
// 添加新用户
function addUserFormSubmit(){
    
    var uName=$("#userName").val();
    var rName=$("#relName").val();
    var dption=dhxCombo.getSelectedValue();
    var pass=$("#newPassword").val();
    var rpass=$("#relPassword").val();
    
    // 用户名
    if(uName==''|| uName==null){        
        alertMessage("用户名不能为空");        
        return;
    }else{
        
        $.post(objUrl+"/admin/user/checkUserName",
            {
              userName:uName
            },
            function(data){
              if(data=='false'){

                  alertMessage("用户名已经存在，请重新输入"); 
                  return;
              }
            }
        );
    }
    // 姓名
    if(rName==''|| rName==null){        
        alertMessage("姓名不能为空");
        return;
    }
    // 角色
    if(dption==''|| dption==null){
        alertMessage("角色不能为空");
        return;
    }else{
        $("#description").val(dption);
    }
    // 密码
    if(pass==''|| pass==null){
        alertMessage("密码不能为空");
        return;
    }
    // 确认密码
    if(rpass==''|| rpass==null){
        alertMessage("请确认密码！");
        return;
    }
    // 密码与确认密码
    if(pass!=rpass){
        alertMessage("密码与确认密码不相符，请重新输入！");
        return;
    }
    // 用户添加
    var options = {    
        success:function(data) {   
            if(data=='true'){
                alertMessage("添加用户成功");
                winClose();
                getGridRowsData();
            }else{
                alertMessage("添加用户失败，请重新操作");
                winClose();
            }
        }
    }; 
    $('#addForm').ajaxSubmit(options);
    return false;
}
//编辑用户
function updateUserFormSubmit(){
    var rName=$("#update_rName").val();
    var dption=dhxComboUpdate.getSelectedValue();
    if(rName==''|| rName==null){
        alertMessage("姓名不能为空");
        return;
    }
    if(dption==''|| dption==null){
        alertMessage("角色不能为空");
        return;
    }else{
        $("#update_description").val(dption);
    }
     var options = {    
        success:function(data) {   
            if(data=='true'){
                alertMessage("编辑用户成功");
                winClose();
                getGridRowsData();
            }else{
                alertMessage("编辑用户失败，请重新操作");
                winClose();
            }
        }
      }; 
      $('#updateForm').ajaxSubmit(options);
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
     $.post(objUrl+"/admin/user/updatePass",
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


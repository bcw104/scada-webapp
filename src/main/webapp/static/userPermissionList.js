/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var dhxLayout,toolbar,tree;
window.dhx_globalImgPath = objUrl+"/static/dhtmlx/imgs/";

//加载执行
function doOnLoad(){
    
    creatLayout();
	creatToolbar(); 
    creatTree();
}

//创建toolbar
function creatToolbar(){
    toolbar=dhxLayout.cells("a").attachToolbar();
    toolbar.setIconsPath(objUrl+"/static/dhtmlx/imgs/");
    toolbar.addText("title",1,"用户名：" + userName);
	toolbar.addButton("save", 2, "保存",'filesave.png');
  	toolbar.addButton("back", 3, "返回",'back.png');
    toolbar.addSpacer("title");
    toolbar.attachEvent("onClick", doOnClick);
}

//toolbar按钮调用
function doOnClick(itemId){
    
    if(itemId == 'save'){
        
        if(tree.getAllCheckedBranches() == null || tree.getAllCheckedBranches() == ''){
            
            alertMessage("请选择组织机构信息！");
            return;
        }else{
//            alertMessage(tree.getAllCheckedBranches());
//            return;
            $.post(
                objUrl + "/admin/user/savePermission",
                {
                    userid:$("#userid").val(),
                    perList:tree.getAllCheckedBranches()
                },
                function(data){
                    if(data=='true'){
                        alertMessage("用户权限设置成功！");
                    }else{
                        alertMessage("操作失败，请重新操作!"); 
                    }
                }
            );
        }        
    }else if(itemId == 'back'){
        
        window.location.href = objUrl + "/admin/user/userManage";
    }
}

//创建布局
function creatLayout(){
	dhxLayout=new dhtmlXLayoutObject(document.body, "1C");
	dhxLayout.cells("a").hideHeader();
    dhxLayout.cells("a").attachObject("treeBox");
}

//创建树
function creatTree(){
	//var tree = new dhtmlXTreeObject("treeBox","100%","100%",0);
    tree = dhxLayout.cells("a").attachTree();
    tree.setImagePath(objUrl+ '/static/dhtmlx/imgs/csh_books/');
    tree.enableCheckBoxes(true);
    tree.enableThreeStateCheckboxes(true);
    tree.loadJSON(objUrl+ "/admin/user/permissionList?id=" + $("#userid").val()); // loading from a script object
}

// 消息提示
function alertMessage(value){
    dhtmlx.message({
        title: "消息提示",
        type: "alert",
        text: value
    });
}
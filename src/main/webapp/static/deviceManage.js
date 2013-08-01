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
        url: objUrl + '/devicepoint/list',
        success: function(json){
          var item=jsonManage(json);
          creatGrid(item);
        }
    });
    //creatCombo();
    dhxWins = new dhtmlXWindows();
    dhxWins.attachViewportTo(document.body);
    var w1=dhxWins.createWindow('win',0,0,450,435);

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

    document.getElementById("pointfrm").style.display='none';

}
//json管理
function jsonManage(json){
        var item={rows:[]};
        for(var i=0;i<json.length;i++){
                var it={};
                it.id = json[i].id;
                it.data = [];
                //it.data.push(0);
                it.data.push(json[i].id);
                it.data.push(json[i].name);
                var deviceType="";
                if(json[i].devicetype=="SJZX"){
                    deviceType="数据中心";
                }else if(json[i].devicetype=="JHJ"){
                    deviceType="交换机";
                }else{
                    deviceType="RTU";
                }
                it.data.push(deviceType);
                it.data.push(json[i].x);
                it.data.push(json[i].y);
                it.data.push(json[i].code);
                it.data.push(json[i].parent);
                item.rows.push(it);
        }
        return item;
}
//创建toolbar
function creatToolbar(){
    toolbar=dhxLayout.cells("a").attachToolbar();
    toolbar.setIconsPath(objUrl+"/static/dhtmlx/imgs/");
	toolbar.addButton("add", 1, "添加",'edit_add.png');
  	toolbar.addButton("update", 2, "编辑",'pencil.png');
	toolbar.addButton("drop", 3, "删除",'edit_remove.png');

    toolbar.attachEvent("onClick", doOnClick);
}
//toolbar按钮调用
function doOnClick(itemId){
    if(itemId=='add'){
        addDiv("pointfrm","添加",'add');
    }else if(itemId=='update'){
        var selectedId=mygrid.getSelectedRowId();
        if(selectedId==null){
            alertMessage("请选择记录");
            return;
        }
        $.post(objUrl+"/admin/device/getbyid",
        {
          id:selectedId
        },
        function(data){
            $('#id').val(data.id);
            $("#deviceName").val(data.name);
            $("#x").val(data.x);
            $("#y").val(data.y);
            $("#endTagCode").val(data.code);
            $("#parent").val(data.parent);
            addDiv("pointfrm","编辑",'upd');
        });
        
    }else if(itemId=='drop'){
        dropMessage();
    }
}
//新建用户
function addDiv(id,title,optype){
     dhxWins.window('win').show();
     dhxWins.window('win').setText(title);
     dhxWins.window('win').setModal(true);
     document.getElementById(id).style.display='block';
     if(optype=='add'){
         $('#id').val(0);
         $("#deviceName").val("");
         $("#x").val("");
         $("#y").val("");
         $("#endTagCode").val("");
         $("#parent").val("");
     }
     dhxWins.window('win').appendObject(id);
}

function dropMessage(){
    var selectedId=mygrid.getSelectedRowId();
    if(selectedId==null){
        alertMessage("请选择记录");
        return;
    }
    dhtmlx.message({ 
        type:"confirm", 
        text:"确定要删除此记录?",
        title:"删除",
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
        url: objUrl+'/admin/device/drop',
        data:"id="+selectedId,
        success: function(json){
             if(json == 0){
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
	mygrid.setImagePath(window.dhx_globalImgPath);
	mygrid.setHeader("ID,名称,类型,X坐标,Y坐标,所属井号,上级ID");
	mygrid.setInitWidths("100,100,100,120,120,100,100");
	mygrid.setColAlign("left,left,left,left,left,left,left");
    mygrid.setColTypes("txt,txt,txt,txt,txt,txt,txt");
	mygrid.setColSorting("str,str,str,str,str,str,str");
    mygrid.setEditable(false);
	mygrid.init();
	mygrid.parse(json,'json');
}
function getGridRowsData(){
    	  $.ajax({
		  type: 'POST',
		  url: objUrl + '/devicepoint/list',
		  success: function(json){
			var item=jsonManage(json);
            //mygrid.init();
            mygrid.clearAll();
			mygrid.parse(item,'json');
		  }
	  });
}

//编辑用户
function saveFormSubmit(){

    var id=$("#id").val();
    var deviceType=$("#deviceType").val();
    var deviceName=$("#deviceName").val();
    var x=$("#x").val();
    var y=$("#y").val();
    var endTagCode = $("#endTagCode").val();
    var parent = $("#parent").val();

    if($.trim(deviceName)==''){        
        alertMessage("名称不能为空");
        return;
    }else if($.trim(x)==''){        
        alertMessage("X坐标不能为空");        
        return;
    // 地址
    }else if($.trim(y)==''){        
        alertMessage("Y坐标不能为空");        
        return;
    }
     var options = {    
        success:function(data) {   
            if(data==0){
                alertMessage("保存成功");
                winClose();
                getGridRowsData();
            }else{
                alertMessage("保存失败，请重新操作");
                winClose();
            }
        }
      }; 
      $('#updateForm').ajaxSubmit(options);
      return false;
}

function alertMessage(value){
        dhtmlx.message({
		title: "消息提示",
                type: "alert",
		text: value
        });
}


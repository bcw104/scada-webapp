/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var dhxLayout,tree,dhxWins;
window.dhx_globalImgPath = objUrl+"/static/dhtmlx/imgs/";

//加载执行
function dooOnLoad(){
    creatLayout();
    createTree();
}
//创建布局
function creatLayout(){
        dhxLayout=new dhtmlXLayoutObject(document.body, "2U");
        dhxLayout.cells("a").hideHeader();
        dhxLayout.cells("b").hideHeader();
        dhxLayout.cells("a").setWidth('200');
        dhxLayout.cells("b").attachObject("addMap");
}
//创建树状控件
function createTree(){
    tree = dhxLayout.cells("a").attachTree();
    tree.setImagePath(objUrl+ '/static/dhtmlx/imgs/csh_books/');
    tree.enableHighlighting(true);
    tree.attachEvent("onClick",tree_click);
    tree.loadJSON(objUrl+ "/admin/map/mapList"); // loading from a script object
}
function tree_click(id){
    if(id.toString().indexOf("j")>=0){
        var sd=id.toString().split('_');
         $.ajax({
                    type: 'POST',
                    url: objUrl + '/endtagpoint/point?id='+sd[1],
                    dateType:'json',
                    success: function(json){
                          $("#pointx").val(json.x);
                          $("#pointy").val(json.y);
                          $("#endtagid").val(json.endTag.id);
                          $("#pointid").val(json.id)
                    }
                });
                
    }
}
//修改坐标
function addMapFormSubmit(){
     var pointx=$("#pointx").val();
     var pointy=$("#pointy").val();
     var endtagid=$("#endtagid").val();
     var pointid=$("#pointid").val();
     $.ajax({
            type: 'POST',
            url: objUrl + '/endtagpoint/savepoint',
            data:encodeURI($.param({id:pointid,pointx:pointx,pointy:pointy,endtagid:endtagid})),
            dateType:'json',
            success: function(json){
                 if(json == 1){
                     alert("保存成功！");
                 }else{
                     alert("保存失败！");
                 }
            }
        });
}

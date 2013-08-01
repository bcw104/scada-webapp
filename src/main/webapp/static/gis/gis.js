// JavaScript Document
$(function() {
    flexOnload();
    getWellLocationData();
});
var solsmap;
//初始化地图
function flexOnload() {
    var swfVersionStr = "11.1.0";
    var xiSwfUrlStr = objUrl + "/static/gis/playerProductInstall.swf";
    var flashvars = {};
    var params = {};
    params.quality = "high";
    params.bgcolor = "#ffffff";
    params.allowscriptaccess = "sameDomain";
    params.allowfullscreen = "true";
    params.wmode = "opaque"; // 注意这里，这里是关键部分
    var attributes = {};
    attributes.id = "sols";
    attributes.name = "sols";
    attributes.align = "middle";
    swfobject.embedSWF(
            objUrl + "/static/gis/showOrderLine.swf", "flashContent",
            "100%", "100%",
            swfVersionStr, xiSwfUrlStr,
            flashvars, params, attributes);
    swfobject.createCSS("#flashContent", "display:block;text-align:left;");
//    solsmap = sols;
}
//记录地图选择控件
var oldmapbtn = "mapdefaultdiv";
//记录地图选择控件样式
var oldmapbtncls = "default";
//改变地图选择控件样式
function changeborder(divname, cname) {
    if (oldmapbtn != "") {
        $('#' + oldmapbtn).toggleClass(oldmapbtncls);
        $('#' + oldmapbtn).toggleClass(oldmapbtncls + "f");
    }
    if (oldmapbtn != divname) {
        oldmapbtn = divname;
        oldmapbtncls = cname;
        $('#' + oldmapbtn).toggleClass(oldmapbtncls);
        $('#' + oldmapbtn).toggleClass(oldmapbtncls + "f");
    } else {
        oldmapbtn = "mapdefaultdiv";
        oldmapbtncls = "default";
    }
    if (oldmapbtn == "mapdefaultdiv") {
        $('#' + oldmapbtn).toggleClass(oldmapbtncls, true);
        $('#' + oldmapbtn).toggleClass(oldmapbtncls + "f", false);
    }
}
//获取地图控件类型
var mouseType;
//记录点击次数
var mouseTag = 0;
//地图控件点击事件
function mouseAll(mouseId) {
    if (mouseTag == 1) {
        sols.swf_mapPanZoomPan();
        mouseTag = 0;
        if (mouseType == mouseId) {
            if (mouseType == "mapdefaultdiv") {
            }
            if (mouseType == "maphanddiv") {
                changeborder('maphanddiv', 'hand');
            }
            mouseType = "";

            return;
        }
    }
    if (mouseId == "mapbigdiv") {
        mouseBig();
        mouseType = mouseId;
        mouseTag = 1;
    } else if (mouseId == "mapsmalldiv") {
        mouseSmall();
        mouseType = mouseId;
        mouseTag = 1;
    } else if (mouseId == "maphanddiv") {
        mouseToFull();
        mouseType = mouseId;
        mouseTag = 1;
    } else if (mouseId == "mapmovediv") {
        mouseMove();
        mouseType = mouseId;
        mouseTag = 1;
    } else if (mouseId == "mapdefaultdiv") {
        mouseDefault();
        mouseType = mouseId;
        mouseTag = 1;
    }
}
//操作地图放大
function mouseBig() {
    sols.swf_mapZoomIn();
    mosBig = 0;
}
//操作地图缩小
var mossmall = 1;
function mouseSmall() {
    sols.swf_mapZoomOut();
    mossmall = 0;
}
//操作地图平移
function mouseMove() {
    sols.swf_mapPanZoomPan();
    mosmove = 0;
}
//操作地图默认
function mouseDefault() {
    //sols.swf_mapZoomPan();
    var aoneWellData= '{"geometry":{"x":117.9770536,"y":24.3147621},"attributes":{"shopid":"123456","shopname":"零售户1","shoptype":"分配线路","type":"shopGraphic"}}';
    sols.swf_selectPoint(aoneWellData);
    //swf_selectPoint
}
//操作地图全景
function mouseToFull() {
    var oneWellData= '{"geometry":{"x":117.9770536,"y":24.3147621},"attributes":{"shopid":"123456","shopname":"零售户1","shoptype":"分配线路","type":"shopGraphic"},  "symbol": {"type": "esriSMS", "style":"esriSMSCircle","color":[76,115,0,255]}}';
    sols.swf_selectPoint(oneWellData);
    sols.swf_mapZoomToInitialExtent();
    changeborder('maphanddiv', 'hand');
}
function mapMoveFlex(flexMapMoveType) {
    if (flexMapMoveType == 'up') {
        sols.swf_mapPanUp();
    } else if (flexMapMoveType == 'down') {
        sols.swf_mapPanDown();
    } else if (flexMapMoveType == 'left') {
        sols.swf_mapPanLeft();
    } else if (flexMapMoveType == 'right') {
        sols.swf_mapPanRight();
    }
}
//通过坐标范围获取点
var shoplocationAll;
function getWellMine(xmin, xmax, ymin, ymax) {
    //shoplocationAll = getWellLocationData(item);
    //sols.swf_showShopLocation(shoplocationAll);
    //alert("xmin:" + xmin + "    xmax:" + xmax + "   ymin:" + ymin +  "    xmax:" + ymax);
    getWellMineText();
}
//通过坐标范围获取点文字
function getWellMineText() {
    var shoplocationdata = [];
    if(!pointData){
        return;
    }
    $.each(pointData,function(key, value){
        var imgName = '';
        if(value.type == 'YOU_JING'){
            switch(value.sub_type){
                case 'LUO_GAN_BENG':
                    imgName = objUrl + '/static/img/5.png';
                    break;
                case 'DIAN_QIAN_BENG':
                    imgName = objUrl + '/static/img/4.png';
                    break;
                case 'GU_LI_JING':
                    imgName = objUrl + '/static/img/1.png';
                    break;
                default:
                    imgName = objUrl + '/static/img/1.png';
            }
        }else{
           switch(value.type){
                case 'SHUI_YUAN_JING':
                    imgName = objUrl + '/static/img/2.png';
                    break;
                case 'TIAN_RAN_QI_JING':
                    imgName = objUrl + '/static/img/10.png';
                    break;
                case 'ZHU_SHUI_JING':
                    imgName = objUrl + '/static/img/11.png';
                    break;
                case 'ZENG_YA_ZHAN':
                    imgName = objUrl + '/static/img/8.png';
                    break;
                case 'ZHU_QI_ZHAN':
                    imgName = objUrl + '/static/img/12.png';
                    break;
                case 'LIAN_HE_ZHAN':
                    imgName = objUrl + '/static/img/7.png';
                    break;
                case 'JIE_ZHUAN_ZHAN':
                    imgName = objUrl + '/static/img/6.png';
                    break;
                case 'ZHU_SHUI_ZHAN':
                    imgName = objUrl + '/static/img/13.png';
                    break;
                case 'JI_LIANG_ZHAN':
                    imgName = objUrl + '/static/img/14.png';
                    break;
                case 'PEI_SHUI_JIAN':
                    imgName = objUrl + '/static/img/15.png';
                    break;
                case 'JI_LIANG_CHE':
                    imgName = objUrl + '/static/img/16.png';
                    break;
                default:
                    imgName = objUrl + '/static/img/1.png';
            } 
        }
        
        
        var itemStr = '';
        itemStr += '{"geometry":{"x":' + value.x + ',"y":' + value.y + '},';
        itemStr += '"attributes":{"shopid":"' + value.id + '||' + value.code + '||' + value.type + '||' + value.sub_type + '||' + value.stage + '","shopname":"' + value.name + '","shoptype":"' + value.sub_type + '","type":"' + value.type 
        
        
        itemStr +='","picurl":"' + imgName + '"}';
        itemStr += '}';
        shoplocationdata.push(itemStr);
    });  
    sols.swf_showShopLocation(shoplocationdata);
    sols.swf_showShopTextLocation(shoplocationdata);
}

//组织数据
var pointData;
function getWellLocationData(){
    $.ajax({
        type: 'POST',
        url: objUrl + '/endtagpoint/list',
        dateType:'json',
        success: function(json){
            pointData = json;
        }
    });
}
//定位单个点
function onWellClick(p_id){
//    alert(p_id);
    $.each(pointData,function(key, value){
        if(value.id == p_id){
            var itemStr = '';
            itemStr += '{"geometry":{"x":' + value.x + ',"y":' + value.y + '},';
            itemStr += '"attributes":{"shopid":"' + value.id + '||' + value.code + '||' + value.type + '||' + value.sub_type + '||' + value.stage + '","shopname":"' + value.name + '","shoptype":"' + value.sub_type + '","type":"' + value.type + '"}';
            itemStr += '}';
            
            sols.swf_selectPoint(itemStr);
            return false;
        }
    });  
//alert("asfdd");
//    var aoneWellData= '{"geometry":{"x":117.9770536,"y":24.3147621},"attributes":{"shopid":"123456","shopname":"零售户1","shoptype":"分配线路","type":"shopGraphic"}}';
//    sols.swf_selectPoint(aoneWellData);
}
//点左键事件
function mouseLeftDoubleClick(id,code){
//    alert("左键双击"+id+"_"+code);
    var wellInfo_Gis = id.split('||');
    if(wellInfo_Gis[2] == 'YOU_JING'){
        switch(wellInfo_Gis[3]){
            case 'LUO_GAN_BENG':
                window.location.href = objUrl + '/main/lgb?id=' + wellInfo_Gis[0];
                break;
            case 'DIAN_QIAN_BENG':
                window.location.href = objUrl + '/main/dqb?id=' + wellInfo_Gis[0];
                break;
            case 'GU_LI_JING':
                window.location.href = objUrl + '/main/glj?id=' + wellInfo_Gis[0];
                break;
            default:
                switch(wellInfo_Gis[4]){
                    case '自喷':
                        window.location.href = objUrl + '/main/zp?id=' + wellInfo_Gis[0];
                        break;
                    case '注汽':
                        window.location.href = objUrl + '/main/zq?id=' + wellInfo_Gis[0];
                        break;
                    case '焖井':
                        window.location.href = objUrl + '/main/mj?id=' + wellInfo_Gis[0];
                        break;
                    default:
                        window.location.href = objUrl + '/main/cyj?id=' + wellInfo_Gis[0];
                }                                                
        }
    }else{
        alert("该井不是油井，请选择其他井。");
    }
}
//function mouseLeftClick(id,code){
//    alert("左键单击"+id+"_"+code);
//}
function mouseRightClick(id,code){
    //alert("右键单击"+id+"_"+code);
}

function mapServerUrl(){
    
    //return "http://192.168.1.6:8399/arcgis/rest/services/zzidp/MapServer";
    return "http://www.arcgisonline.cn/ArcGIS/rest/services/ChinaCities_Community_BaseMap_CHN/jinan_Community_BaseMap_CHN/MapServer";
}

function swfMapCompleteOver(){
    
    if (typeof(wellId_Gis)!="undefined"){
        onWellClick(wellId_Gis);
    }
}
function showScope(){
    return 10000;
}
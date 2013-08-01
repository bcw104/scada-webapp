
// 当前系统时间
var dateSysNow;
$(function () {
     // 获得机构信息
     $.ajax({
        type: 'POST',
        url: objUrl + '/main/logincheck',
        dateType:'json',
        success: function(json){

            if(typeof(json.state) == "undefined" || json.state == "1"){
                window.location.href = objUrl + '/main/';
            }else{
                
                // 获得系统时间
                $.ajax({
                    type: 'POST',
                    url: objUrl + '/alarm/now',
                    dateType:'json',
                    success: function(json){
                        dateSysNow = json;
                        doOnLoad();
                    }
                });
            }
        }
    });
        
    $("#sztitle").html('胜利油田胜利油田胜利油田胜利油田胜利油田');      
    $("#szda").html('欢迎您 ' + username + '，进入管理系统');                
});
/**
 * 定时刷新
 * @returns {undefined}
*/
function reflesh(){       
    if(typeof(refFlag) == "undefined" || refFlag){
        doOnLoad();//alert("asd");
    }
}	
// 每10秒钟刷新一次 
setInterval("reflesh()",600*1000);
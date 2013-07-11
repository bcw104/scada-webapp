/**
 * 定时刷新
 * @returns {undefined}
*/
function reflesh(){               
    doOnLoad();
}	
// 每10秒钟刷新一次 
setTimeout("reflesh()",60*1000);
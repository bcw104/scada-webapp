/**
 * 定时刷新
 * @returns {undefined}
*/
function reflesh(){               
    doOnLoad();
}	
// 每10秒钟刷新一次 
setInterval("reflesh()",600*1000);
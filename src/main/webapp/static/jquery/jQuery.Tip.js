/**
*@author fengxuanming
*DCS工具类 目前暂时封装了 消息提示框
*使用前提：必须引用Jquery文件
*消息提示框调用方法：DCS.util.showTip(type,title,content,isAutomaticClose);
*	type : 提示类型
*	title : 标题
*	content : 提示内容
*	isAutomaticClose : 是否自动关闭
*/
Array.prototype.remove = function(from, to) {
	var rest = this.slice((to || from) + 1 || this.length);
	this.length = from < 0 ? this.length + from : from;
	return this.push.apply(this, rest);
};
var DCS = {};
DCS.util = {
	dcsfengxmcurrentTipindex : 0,
	dcsfengxmcurrentTipindextag : 0,
	dcsfengxmcurrentTipCloseAll : null,//关闭所有层对象
	interval : new Array(),//调度器对象
	intervalTimer : 5000,//显示时间 单位毫秒
	tipWidth : 300,//提示框宽度
	tipHeight : 100,//提示框高度
	dcsfengxmcurrentTipsArray : new Array(),
	getWindowSize : function(){//定义浏览器窗口的宽度和高度
		var size = {
				width: window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth),
				height: window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight)
			};
		return size;
	},
	positionPrompt : function(){//设置消息提示框的位置 只供内部JS调用
		var ie6 = (jQuery.browser.msie && jQuery.browser.version < 7);
		var wsize = DCS.util.getWindowSize();
			var top= 0;
			var tag = 0;
			for(var i=0;i<DCS.util.dcsfengxmcurrentTipsArray.length;i++){
				var o = $(DCS.util.dcsfengxmcurrentTipsArray[i]);
				top = (wsize.height-DCS.util.tipHeight)-(i*DCS.util.tipHeight);
				if(o){
					tag++;
					o.css({ position: (ie6)? "absolute" : "fixed", top: top, left: wsize.width-DCS.util.tipWidth, right: 2, bottom: 0,'z-index' : "99999999" });
				}
			}
			
			if(tag>1){
				if(DCS.util.dcsfengxmcurrentTipCloseAll!=null){
					
					$(DCS.util.dcsfengxmcurrentTipCloseAll).css({ position: (ie6)? "absolute" : "fixed", top: (wsize.height-23)-(tag*DCS.util.tipHeight), left: wsize.width-DCS.util.tipWidth, right: 2, bottom: 0,'z-index' : "99999999" });
					$(DCS.util.dcsfengxmcurrentTipCloseAll).fadeIn(800);
				}
			}else{
				$(DCS.util.dcsfengxmcurrentTipCloseAll).hide();
			}
	},
	getTipType : function(type){//返回消息框类型CSS (未完待续...)
		switch(type){
			case "error" : 
				return "";
			case "warning" : 
				return "";
			case "success" : 
				return "";
		}
	},
	closeTip : function(index){//关闭消息提示框 只供内部JS调用
		DCS.util.dcsfengxmcurrentTipindex --;
		for(var i=0;i<DCS.util.dcsfengxmcurrentTipsArray.length;i++){
			if($("#dcsjqfengxmthiscurrenttips"+index).html()==DCS.util.dcsfengxmcurrentTipsArray[i].html()){
				DCS.util.dcsfengxmcurrentTipsArray.remove(i);
			}
		}
		$("#dcsjqfengxmthiscurrenttips"+index).fadeOut(800,function(){
			DCS.util.positionPrompt();
		});
		
	},
	closeTipByInterval : function(index){
		DCS.util.closeTip(index);
		clearInterval(DCS.util.interval[index]);
	},
	closeAllTip : function(){//关闭所有提示框
		DCS.util.dcsfengxmcurrentTipindex = 0;
		for(var i=0;i<DCS.util.dcsfengxmcurrentTipindextag;i++){
				var tip = $("#dcsjqfengxmthiscurrenttips"+i);
				if(tip)
					tip.hide();
		}
		for(var i=0;i<DCS.util.dcsfengxmcurrentTipsArray.length;i++){
			DCS.util.dcsfengxmcurrentTipsArray.remove(i);
		}
		$(DCS.util.dcsfengxmcurrentTipCloseAll).hide();
		DCS.util.positionPrompt();
	},
	showTip : function(type,title,content,isAutomaticClose){//打开消息提示框
		/************组装提示框开始***************/
		var divobj = $("<div style='z-index:999999; border: #a6b4cf 1px solid;   background-color: #afdcf3; display:none; width:"+DCS.util.tipWidth+"px;height:"+DCS.util.tipHeight+"px;display:none' id='dcsjqfengxmthiscurrenttips"+DCS.util.dcsfengxmcurrentTipindextag+"'></div>");
		var table = $("<table cellspacing=0 cellpadding=0 width='100%' border=0></table>");
		var tr1=$("<tr bgcolor=#6699cc></tr>");
		var td1="<td style='font-size: 12px; color: #0f2c8c' width=30 height=24></td>";
		tr1.append(td1);
		var td2=$("<td style='font-weight: normal; font-size: 12px; color: #ffffff;padding-top: 4px' valign=center width='100%'> "+title+"</td>)");
		tr1.append(td2);
		var closeTd = $("<td style='padding-right: 2px; padding-top: 2px' valign=center align=right width=19></td>");
		var close = $("<span title=关闭 style='cursor: pointer;color:white;font-size:12px;font-weight:bold;margin-right:4px;' class='jqfengxmcurrentindextag"+DCS.util.dcsfengxmcurrentTipindextag+"' onclick='DCS.util.closeTipByInterval("+DCS.util.dcsfengxmcurrentTipindextag+");'>×</span>)");
		closeTd.append(close);
		tr1.append(closeTd);
		table.append(tr1);
		var str="<tr>";
		str+="<td colspan=3  style=\"font-size:12px; line-height:18px; padding:10px;\">";
		str+=content;
		str+="</td>";
		str+="</tr>";
		table.append(str);
		divobj.append(table);
		$("body").append(divobj);
		/************组装提示框结束***************/

		/**************组装关闭所有层开始**********************/
		if(DCS.util.dcsfengxmcurrentTipCloseAll==null){
			var sobj =$("<div style='display:none;width:"+DCS.util.tipWidth+";height:18px;background-color: #afdcf3;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5;border: #a6b4cf 1px solid;z-index:999999;padding-top:5px;'></div>");

			var closeAll=$("<span title=关闭所有 style='float:right;font-size: 12px; color: #0f2c8c;margin-right:5px;cursor:pointer;'>关闭所有</span>");
			closeAll.bind("click",function(){
				DCS.util.closeAllTip();
			});
			sobj.append(closeAll);
			DCS.util.dcsfengxmcurrentTipCloseAll = sobj;
			/**************组装关闭所有层结束**********************/
			$("body").append(sobj);
		}

		DCS.util.dcsfengxmcurrentTipsArray[DCS.util.dcsfengxmcurrentTipindex] = divobj;
		var ie6 = (jQuery.browser.msie && jQuery.browser.version < 7);
		var b = jQuery(document.body);
		var w = jQuery(window);
		var ie6scroll = function(){ 
			divobj.css({ top: getWindowScrollOffset() }); 
		};
		DCS.util.positionPrompt();
		if(ie6) w.scroll(ie6scroll);
		//绑定window的resize事件
		w.resize(DCS.util.positionPrompt);
		$(divobj).fadeIn(800);
		if(isAutomaticClose){
			DCS.util.interval[DCS.util.dcsfengxmcurrentTipindextag] = setInterval("DCS.util.closeTipByInterval('"+DCS.util.dcsfengxmcurrentTipindextag+"')",DCS.util.intervalTimer);
		}
		DCS.util.dcsfengxmcurrentTipindex ++;
		DCS.util.dcsfengxmcurrentTipindextag++;
		
	}
};


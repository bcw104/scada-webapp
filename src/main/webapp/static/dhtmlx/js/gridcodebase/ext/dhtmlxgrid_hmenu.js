//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.enableHeaderMenu=function(a){typeof a=="string"&&(a=a.split(","));this._hm_config=a;var b=this;this.attachEvent("onInit",function(){this.hdr.oncontextmenu=function(a){return b._doHContClick(a||window.event)};this.startColResizeA=this.startColResize;this.startColResize=function(a){return a.button==2||_isMacOS&&a.ctrlKey?this._doHContClick(a):this.startColResizeA(a)};this._chm_ooc=this.obj.onclick;this._chm_hoc=this.hdr.onclick;this.hdr.onclick=function(a){if(a&&(a.button==
2||_isMacOS&&a.ctrlKey))return!1;b._showHContext(!1);return b._chm_hoc.apply(this,arguments)};this.obj.onclick=function(){b._showHContext(!1);return b._chm_ooc.apply(this,arguments)}});dhtmlxEvent(document.body,"click",function(){b._hContext&&b._showHContext(!1)});this.hdr.rows.length&&this.callEvent("onInit",[]);this.enableHeaderMenu=function(){}};
dhtmlXGridObject.prototype._doHContClick=function(a){function b(a){if(a.pageX||a.pageY)return{x:a.pageX,y:a.pageY};var b=_isIE&&document.compatMode!="BackCompat"?document.documentElement:document.body;return{x:a.clientX+b.scrollLeft-b.clientLeft,y:a.clientY+b.scrollTop-b.clientTop}}this._createHContext();var c=b(a);this._showHContext(!0,c.x,c.y);a[_isIE?"srcElement":"target"].oncontextmenu=function(a){(a||event).cancelBubble=!0;return!1};a.cancelBubble=!0;a.preventDefault&&a.preventDefault();return!1};
dhtmlXGridObject.prototype._createHContext=function(){if(this._hContext)return this._hContext;var a=document.createElement("DIV");a.oncontextmenu=function(a){(a||event).cancelBubble=!0;return!1};a.onclick=function(a){return(a||event).cancelBubble=!0};a.className="dhx_header_cmenu";a.style.width=a.style.height="5px";a.style.display="none";var b=[],c=0;if(this._fake)c=this._fake._cCount;for(var g=c;c<this.hdr.rows[1].cells.length;c++){var e=this.hdr.rows[1].cells[c];if(!this._hm_config||this._hm_config[c]&&
this._hm_config[c]!="false"){var f=e.firstChild&&e.firstChild.tagName=="DIV"?e.firstChild.innerHTML:e.innerHTML,f=f.replace(/<[^>]*>/gi,"");b.push("<div class='dhx_header_cmenu_item'><input type='checkbox' column='"+g+"' len='"+(e.colSpan||1)+"' checked='true' />"+f+"</div>")}g+=e.colSpan||1}a.innerHTML=b.join("");for(var d=this,h=function(){var a=this.getAttribute("column");if(!this.checked&&!d._checkLast(a))return this.checked=!0;if(d._realfake)d=d._fake;for(var b=0;b<this.getAttribute("len");b++)d.setColumnHidden(a*
1+b*1,!this.checked);this.checked&&d.getColWidth(a)==0&&d.adjustColumnSize(a)},c=0;c<a.childNodes.length;c++)a.childNodes[c].firstChild.onclick=h;document.body.insertBefore(a,document.body.firstChild);this._hContext=a;a.style.position="absolute";a.style.zIndex=999;a.style.width="auto";a.style.height="auto";a.style.display="block"};dhtmlXGridObject.prototype._checkLast=function(a){for(var b=0;b<this._cCount;b++)if((!this._hrrar||!this._hrrar[b])&&b!=a)return!0;return!1};
dhtmlXGridObject.prototype._updateHContext=function(){for(var a=0;a<this._hContext.childNodes.length;a++){var b=this._hContext.childNodes[a].firstChild,c=b.getAttribute("column");if(this.isColumnHidden(c)||this.getColWidth(c)==0)b.checked=!1}};
dhtmlXGridObject.prototype._showHContext=function(a,b,c){if(a&&this.enableColumnMove)this._hContext.parentNode.removeChild(this._hContext),this._hContext=null;this._createHContext();this._hContext.style.display=a?"block":"none";if(a)this._updateHContext(!0),this._hContext.style.left=b+"px",this._hContext.style.top=c+"px"};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
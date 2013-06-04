//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype._in_header_collapse=function(b,c,d){var a=b.tagName=="TD"?b:b.parentNode,c=a._cellIndexS;if(!this._column_groups)this._column_groups=[];var e=d[1].split(":"),i=parseInt(e[0]);b.innerHTML=d[0]+"<img src='"+this.imgURL+"minus.gif' style='padding-right:10px;'/><span style='position:relative; top:-6px;'>"+(e[1]||"")+"<span>";b.style.paddingBottom="0px";var g=this;this._column_groups[c]=b.getElementsByTagName("IMG")[0];this._column_groups[c].onclick=function(b){(b||event).cancelBubble=
!0;this._cstate=!this._cstate;for(var h=c+1;h<c+i;h++)g.setColumnHidden(h,this._cstate);if(this._cstate){if(a.colSpan&&a.colSpan>0){a._exp_colspan=a.colSpan;var d=Math.max(1,a.colSpan-i);if(!_isFF||window._KHTMLrv)for(var f=0;f<a.colSpan-d;f++){var e=document.createElement("TD");a.nextSibling?a.parentNode.insertBefore(e,a.nextSibling):a.parentNode.appendChild(e)}a.colSpan=d}}else if(a._exp_colspan&&(a.colSpan=a._exp_colspan,!_isFF||window._KHTMLrv))for(f=1;f<a._exp_colspan;f++)a.parentNode.removeChild(a.nextSibling);
this.src=g.imgURL+(this._cstate?"plus.gif":"minus.gif");g.sortImg.style.display!="none"&&g.setSortImgPos()}};dhtmlXGridObject.prototype.collapseColumns=function(b){if(this._column_groups[b])this._column_groups[b]._cstate=!1,this._column_groups[b].onclick({})};dhtmlXGridObject.prototype.expandColumns=function(b){if(this._column_groups[b])this._column_groups[b]._cstate=!0,this._column_groups[b].onclick({})};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
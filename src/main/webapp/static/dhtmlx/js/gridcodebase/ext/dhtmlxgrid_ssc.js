//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.enableAutoSizeSaving=function(b,a){this.attachEvent("onResizeEnd",function(){this.saveSizeToCookie(b,a)})};dhtmlXGridObject.prototype.saveOpenStates=function(b,a){if(!b)b=this.entBox.id;var c=[];this._h2.forEachChild(0,function(a){a.state=="minus"&&c.push(a.id)});var d="gridOpen"+(b||"")+"="+c.join("|")+(a?"; "+a:"");document.cookie=d};
dhtmlXGridObject.prototype.loadOpenStates=function(b){var a=this.getCookie(b,"gridOpen");if(a)for(var a=a.split("|"),c=0;c<a.length;c++){var d=this.getParentId(a[c]);this.getOpenState(d)&&this.openItem(a[c])}};dhtmlXGridObject.prototype.enableAutoHiddenColumnsSaving=function(b,a){this.attachEvent("onColumnHidden",function(){this.saveHiddenColumnsToCookie(b,a)})};
dhtmlXGridObject.prototype.enableSortingSaving=function(b,a){this.attachEvent("onBeforeSorting",function(){var c=this;window.setTimeout(function(){c.saveSortingToCookie(b,a)},1);return!0})};dhtmlXGridObject.prototype.enableOrderSaving=function(b,a){this.attachEvent("onAfterCMove",function(){this.saveOrderToCookie(b,a);this.saveSizeToCookie(b,a)})};dhtmlXGridObject.prototype.enableAutoSaving=function(b,a){this.enableOrderSaving(b,a);this.enableAutoSizeSaving(b,a);this.enableSortingSaving(b,a)};
dhtmlXGridObject.prototype.saveSizeToCookie=function(b,a){var c=this.cellWidthType=="px"?this.cellWidthPX.join(","):this.cellWidthPC.join(","),d=(this.initCellWidth||[]).join(",");this.setCookie(b,a,0,c);this.setCookie(b,a,1,d)};dhtmlXGridObject.prototype.saveHiddenColumnsToCookie=function(b,a){var c=[].concat(this._hrrar||[]);if(this._fake&&this._fake._hrrar)for(var d=0;d<this._fake._cCount;d++)c[d]=this._fake._hrrar[d]?"1":"";this.setCookie(b,a,4,c.join(",").replace(/display:none;/g,"1"))};
dhtmlXGridObject.prototype.loadHiddenColumnsFromCookie=function(b){for(var a=this._getCookie(b,4),c=(a||"").split(","),d=0;d<this._cCount;d++)this.setColumnHidden(d,c[d]?!0:!1)};dhtmlXGridObject.prototype.saveSortingToCookie=function(b,a){this.setCookie(b,a,2,(this.getSortingState()||[]).join(","))};
dhtmlXGridObject.prototype.loadSortingFromCookie=function(b){var a=this._getCookie(b,2),a=(a||"").split(",");a.length>1&&a[0]<this._cCount&&(this.sortRows(a[0],null,a[1]),this.setSortImgState(!0,a[0],a[1]))};dhtmlXGridObject.prototype.saveOrderToCookie=function(b,a){if(!this._c_order){this._c_order=[];for(var c=this._cCount,d=0;d<c;d++)this._c_order[d]=d}this.setCookie(b,a,3,(this._c_order||[]).slice(0,this._cCount).join(","));this.saveSortingToCookie()};
dhtmlXGridObject.prototype.loadOrderFromCookie=function(b){var a=this._getCookie(b,3),a=(a||"").split(",");if(a.length>1&&a.length<=this._cCount)for(var c=0;c<a.length;c++)if(!this._c_order&&a[c]!=c||this._c_order&&a[c]!=this._c_order[c]){var d=a[c];if(this._c_order)for(var e=0;e<this._c_order.length;e++)if(this._c_order[e]==a[c]){d=e;break}this.moveColumn(d*1,c)}};
dhtmlXGridObject.prototype.loadSizeFromCookie=function(b){var a=this._getCookie(b,1);if(a)this.initCellWidth=a.split(",");if((a=this._getCookie(b,0))&&a.length){if(!this._fake&&this._hrrar)for(var c=0;c<a.length;c++)this._hrrar[c]&&(a[c]=0);this.cellWidthType=="px"?this.cellWidthPX=a.split(","):this.cellWidthPC=a.split(",")}this.setSizes();return!0};dhtmlXGridObject.prototype.clearConfigCookie=function(b){if(!b)b=this.entBox.id;var a="gridSettings"+b+"=||||";document.cookie=a};
dhtmlXGridObject.prototype.clearSizeCookie=dhtmlXGridObject.prototype.clearConfigCookie;dhtmlXGridObject.prototype.setCookie=function(b,a,c,d){if(!b)b=this.entBox.id;var e=this.getCookie(b),e=(e||"||||").split("|");e[c]=d;var f="gridSettings"+b+"="+e.join("|")+(a?"; "+a:"");document.cookie=f};
dhtmlXGridObject.prototype.getCookie=function(b,a){if(!b)b=this.entBox.id;var b=(a||"gridSettings")+b,c=b+"=";if(document.cookie.length>0){var d=document.cookie.indexOf(c);if(d!=-1){d+=c.length;var e=document.cookie.indexOf(";",d);if(e==-1)e=document.cookie.length;return document.cookie.substring(d,e)}}};dhtmlXGridObject.prototype._getCookie=function(b,a){return(this.getCookie(b)||"||||").split("|")[a]};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype._updateLine=function(b,a){if(a=a||this.rowsAr[b.id]){var c=a.imgTag;if(c){if(b.state=="blank")return c.src=this.imgURL+"blank.gif";var d=1,d=b.index==0?b.level==0?b.parent.childs.length-1>b.index?3:1:b.parent.childs.length-1>b.index?3:2:b.parent.childs.length-1>b.index?3:2;c.src=this.imgURL+b.state+d+".gif"}}};
dhtmlXGridObject.prototype._updateParentLine=function(b,a){if(a=a||this.rowsAr[b.id]){var c=a.imgTag;if(c)for(var d=b.level;d>0;d--){if(b.id==0)break;c=c.previousSibling;b=b.parent;c.src=b.parent.childs.length-1>b.index?this.imgURL+"line1.gif":this.imgURL+"blank.gif"}}};dhtmlXGridObject.prototype._renderSortA=dhtmlXGridObject.prototype._renderSort;dhtmlXGridObject.prototype._renderSort=function(){this._renderSortA.apply(this,arguments);this._redrawLines(0)};
dhtmlXGridObject.prototype._redrawLines=function(b){this._tgle&&this._h2.forEachChild(b||0,function(a){this._updateLine(a);this._updateParentLine(a)},this)};
dhtmlXGridObject.prototype.enableTreeGridLines=function(){dhtmlXGridObject._emptyLineImg="line";this._updateTGRState=function(b,a){if(!a&&b.update&&b.id!=0)this._tgle&&this._updateLine(b,this.rowsAr[b.id]),b.update=!1};this._tgle=!0;this.attachEvent("onXLE",function(b,a,c){this._redrawLines(c)});this.attachEvent("onOpenEnd",function(b){this._redrawLines(b)});this.attachEvent("onRowAdded",function(b){var a=this._h2.get[b];this._updateLine(a);this._updateParentLine(a);a.index<a.parent.childs.length-
1?(a=a.parent.childs[a.index+1],this._updateLine(a),this._updateParentLine(a)):a.index!=0&&(a=a.parent.childs[a.index-1],this._updateLine(a),this._updateParentLine(a),a.childs.length&&this._h2.forEachChild(a.id,function(a){this._updateParentLine(a)},this))});this.attachEvent("onOpen",function(b,a){if(a)for(var c=this._h2.get[b],d=0;d<c.childs.length;d++)this._updateParentLine(c.childs[d]);return!0});this.attachEvent("onBeforeRowDeleted",function(b){var a=this,c=this._h2.get[b],d=null;c.index!=0&&
(d=c.parent.childs[c.index-1]);c=c.parent;window.setTimeout(function(){if(c=a._h2.get[c.id])a._updateLine(c),a._updateParentLine(c),d&&(a._updateLine(d),d.state=="minus"&&a._h2.forEachChild(d.id,function(b){a._updateParentLine(b)},a))},1);return!0})};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
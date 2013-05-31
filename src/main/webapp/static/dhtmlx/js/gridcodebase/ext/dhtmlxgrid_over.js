//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.mouseOverHeader=function(c){var d=this;dhtmlxEvent(this.hdr,"mousemove",function(b){var b=b||window.event,a=b.target||b.srcElement;a.tagName!="TD"&&(a=d.getFirstParentOfType(a,"TD"));a&&typeof a._cellIndex!="undefined"&&c(a.parentNode.rowIndex,a._cellIndex)})};
dhtmlXGridObject.prototype.mouseOver=function(c){var d=this;dhtmlxEvent(this.obj,"mousemove",function(b){var b=b||window.event,a=b.target||b.srcElement;a.tagName!="TD"&&(a=d.getFirstParentOfType(a,"TD"));a&&typeof a._cellIndex!="undefined"&&c(a.parentNode.rowIndex,a._cellIndex)})};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
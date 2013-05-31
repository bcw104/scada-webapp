//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.post=function(e,c,a,b){this.callEvent("onXLS",[this]);arguments.length==3&&typeof a!="function"&&(b=a,a=null);b=b||"xml";c=c||"";if(!this.xmlFileUrl)this.xmlFileUrl=e;this._data_type=b;this.xmlLoader.onloadAction=function(d,c,e,g,f){f=d["_process_"+b](f);d._contextCallTimer||d.callEvent("onXLE",[d,0,0,f]);a&&(a(),a=null)};this.xmlLoader.loadXML(e,!0,c)};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
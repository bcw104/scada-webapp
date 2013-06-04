//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.startFastOperations=function(){this._disF=["setSizes","callEvent","_fixAlterCss","cells4","forEachRow"];this._disA=[];for(var a=this._disF.length-1;a>=0;a--)this._disA[a]=this[this._disF[a]],this[this._disF[a]]=function(){return!0};this._cellCache=[];this.cells4=function(a){var b=this._cellCache[a._cellIndex];if(!b)b=this._cellCache[a._cellIndex]=this._disA[3].apply(this,[a]),b.destructor=function(){return!0},b.setCValue=function(a){b.cell.innerHTML=a};b.cell=a;b.combo=
a._combo||this.combos[a._cellIndex];return b}};dhtmlXGridObject.prototype.stopFastOperations=function(){if(this._disF){for(var a=this._disF.length-1;a>=0;a--)this[this._disF[a]]=this._disA[a];this.setSizes();this.callEvent("onGridReconstructed",[])}};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_wbut(b){this.cell=b;this.grid=this.cell.parentNode.grid;this.edit=function(){var b=this.getValue().toString();this.obj=document.createElement("INPUT");this.obj.readOnly=!0;this.obj.style.width="60px";this.obj.style.height=this.cell.offsetHeight-(this.grid.multiLine?5:4)+"px";this.obj.style.border="0px";this.obj.style.margin="0px";this.obj.style.padding="0px";this.obj.style.overflow="hidden";this.obj.style.fontSize=_isKHTML?"10px":"12px";this.obj.style.fontFamily="Arial";this.obj.wrap=
"soft";this.obj.style.textAlign=this.cell.align;this.obj.onclick=function(a){(a||event).cancelBubble=!0};this.cell.innerHTML="";this.cell.appendChild(this.obj);this.obj.onselectstart=function(a){a||(a=event);return a.cancelBubble=!0};this.obj.style.textAlign=this.cell.align;this.obj.value=b;this.obj.focus();this.obj.focus();this.cell.appendChild(document.createTextNode(" "));var a=document.createElement("input");_isIE?(a.style.height=this.cell.offsetHeight-(this.grid.multiLine?5:4)+"px",a.style.lineHeight=
"5px"):(a.style.fontSize="8px",a.style.width="10px",a.style.marginTop="-5px");a.type="button";a.name="Lookup";a.value="...";var e=this.obj,f=this.cell.cellIndex,g=this.cell.parentNode.idd,h=this.grid,c=this;this.dhx_m_func=this.grid.getWButFunction(this.cell._cellIndex);a.onclick=function(){c.dhx_m_func(c,c.cell.parentNode.idd,c.cell._cellIndex,b)};this.cell.appendChild(a)};this.detach=function(){this.setValue(this.obj.value);return this.val!=this.getValue()}}eXcell_wbut.prototype=new eXcell;
dhtmlXGridObject.prototype.getWButFunction=function(b){return this._wbtfna?this._wbtfna[b]:function(){}};dhtmlXGridObject.prototype.setWButFunction=function(b,d){if(!this._wbtfna)this._wbtfna=[];this._wbtfna[b]=d};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
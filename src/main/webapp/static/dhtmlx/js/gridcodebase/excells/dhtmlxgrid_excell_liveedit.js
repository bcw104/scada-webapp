//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_liveedit(b){if(b)this.cell=b,this.grid=this.cell.parentNode.grid;this.edit=function(){this.cell.inputObj.focus();this.cell.inputObj.focus()};this.detach=function(){this.setValue(this.cell.inputObj.value)};this.getValue=function(){return this.cell.inputObj?this.cell.inputObj.value:""};this.destructor=function(){};this.onFocus=function(){var a=this.grid.callEvent("onEditCell",[0,this.cell.parentNode.idd,this.cell._cellIndex]);a===!1&&this.cell.inputObj.blur()};this.onBlur=function(){var a=
this.grid.callEvent("onEditCell",[2,this.cell.parentNode.idd,this.cell._cellIndex]);this.detach()};this.onChange=function(){var a=this.grid.callEvent("onCellChanged",[this.cell.parentNode.idd,this.cell._cellIndex,this.cell.inputObj.value]);this.detach()}}eXcell_liveedit.prototype=new eXcell_ed;
eXcell_liveedit.prototype.setValue=function(b){var a=this;this.cell.innerHTML='<input type="text" value="" style="width:100%;" />';this.cell.inputObj=this.cell.firstChild;this.cell.inputObj=this.cell.firstChild;this.cell.inputObj.value=b;this.cell.inputObj.onfocus=function(){a.onFocus()};this.cell.inputObj.onblur=function(){a.onFocus()};this.cell.inputObj.onchange=function(){a.onChange()}};
if(window.eXcell_math)eXcell_liveedit.prototype.setValueA=eXcell_liveedit.prototype.setValue,eXcell_liveedit.prototype.setValue=eXcell_math.prototype._NsetValue;

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
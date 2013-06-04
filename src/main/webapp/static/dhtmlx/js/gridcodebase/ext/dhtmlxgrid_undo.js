//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.enableUndoRedo=function(){var a=this,b=function(){return a._onEditUndoRedo.apply(a,arguments)};this.attachEvent("onEditCell",b);var e=function(b,c,d){return a._onEditUndoRedo.apply(a,[2,b,c,d?1:0,d?0:1])};this.attachEvent("onCheckbox",e);this._IsUndoRedoEnabled=!0;this._UndoRedoData=[];this._UndoRedoPos=-1};dhtmlXGridObject.prototype.disableUndoRedo=function(){this._IsUndoRedoEnabled=!1;this._UndoRedoData=[];this._UndoRedoPos=-1};
dhtmlXGridObject.prototype._onEditUndoRedo=function(a,b,e,f,c){if(this._IsUndoRedoEnabled&&a==2&&c!=f){if(this._UndoRedoPos!==-1&&this._UndoRedoPos!=this._UndoRedoData.length-1)this._UndoRedoData=this._UndoRedoData.slice(0,this._UndoRedoPos+1);else if(this._UndoRedoPos===-1&&this._UndoRedoData.length>0)this._UndoRedoData=[];var d={old_value:c,new_value:f,row_id:b,cell_index:e};this._UndoRedoData.push(d);this._UndoRedoPos++}return!0};
dhtmlXGridObject.prototype.doUndo=function(){if(this._UndoRedoPos===-1)return!1;var a=this._UndoRedoData[this._UndoRedoPos--],b=this.cells(a.row_id,a.cell_index);this.getColType(a.cell_index)=="tree"?b.setLabel(a.old_value):b.setValue(a.old_value)};dhtmlXGridObject.prototype.doRedo=function(){if(this._UndoRedoPos==this._UndoRedoData.length-1)return!1;var a=this._UndoRedoData[++this._UndoRedoPos];this.cells(a.row_id,a.cell_index).setValue(a.new_value)};
dhtmlXGridObject.prototype.getRedo=function(){return this._UndoRedoPos==this._UndoRedoData.length-1?[]:this._UndoRedoData.slice(this._UndoRedoPos+1)};dhtmlXGridObject.prototype.getUndo=function(){return this._UndoRedoPos==-1?[]:this._UndoRedoData.slice(0,this._UndoRedoPos+1)};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
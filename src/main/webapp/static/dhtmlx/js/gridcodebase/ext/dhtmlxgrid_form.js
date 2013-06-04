//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.attachHeaderA=dhtmlXGridObject.prototype.attachHeader;
dhtmlXGridObject.prototype.attachHeader=function(){this.attachHeaderA.apply(this,arguments);if(this._realfake)return!0;this.formAutoSubmit();typeof this.FormSubmitOnlyChanged=="undefined"&&this.submitOnlyChanged(!0);typeof this._submitAR=="undefined"&&this.submitAddedRows(!0);var a=this;this._added_rows=[];this._deleted_rows=[];this.attachEvent("onRowAdded",function(b){a._added_rows.push(b);a.forEachCell(b,function(a){a.cell.wasChanged=!0});return!0});this.attachEvent("onBeforeRowDeleted",function(b){a._deleted_rows.push(b);
return!0});this.attachHeader=this.attachHeaderA};dhtmlXGridObject.prototype.formAutoSubmit=function(){this.parentForm=this.detectParentFormPresent();if(this.parentForm===!1)return!1;if(!this.formEventAttached){this.formInputs=[];var a=this;dhtmlxEvent(this.parentForm,"submit",function(){a.entBox&&a.parentFormOnSubmit()});this.formEventAttached=!0}};dhtmlXGridObject.prototype.parentFormOnSubmit=function(){this.formCreateInputCollection();if(!this.callEvent("onBeforeFormSubmit",[]))return!1};
dhtmlXGridObject.prototype.submitOnlyChanged=function(a){this.FormSubmitOnlyChanged=convertStringToBoolean(a)};dhtmlXGridObject.prototype.submitColumns=function(a){typeof a=="string"&&(a=a.split(this.delim));this._submit_cols=a};
dhtmlXGridObject.prototype.setFieldName=function(a){a=a.replace(/\{GRID_ID\}/g,"'+a1+'");a=a.replace(/\{ROW_ID\}/g,"'+a2+'");a=a.replace(/\{ROW_INDEX\}/g,"'+this.getRowIndex(a2)+'");a=a.replace(/\{COLUMN_INDEX\}/g,"'+a3+'");a=a.replace(/\{COLUMN_ID\}/g,"'+this.getColumnId(a3)+'");this._input_mask=Function("a1","a2","a3","return '"+a+"';")};dhtmlXGridObject.prototype.submitSerialization=function(a){this.FormSubmitSerialization=convertStringToBoolean(a)};
dhtmlXGridObject.prototype.submitAddedRows=function(a){this._submitAR=convertStringToBoolean(a)};dhtmlXGridObject.prototype.submitOnlySelected=function(a){this.FormSubmitOnlySelected=convertStringToBoolean(a)};dhtmlXGridObject.prototype.submitOnlyRowID=function(a){this.FormSubmitOnlyRowID=convertStringToBoolean(a)};
dhtmlXGridObject.prototype.createFormInput=function(a,b){var c=document.createElement("input");c.type="hidden";c.name=this._input_mask&&typeof a!="string"?this._input_mask.apply(this,a):((this.globalBox||this.entBox).id||"dhtmlXGrid")+"_"+a;c.value=b;this.parentForm.appendChild(c);this.formInputs.push(c)};
dhtmlXGridObject.prototype.createFormInputRow=function(a){for(var b=(this.globalBox||this.entBox).id,c=0;c<this._cCount;c++){var d=this.cells3(a,c);if((!this.FormSubmitOnlyChanged||d.wasChanged())&&(!this._submit_cols||this._submit_cols[c]))this.createFormInput(this._input_mask?[b,a.idd,c]:a.idd+"_"+c,d.getValue())}};
dhtmlXGridObject.prototype.formCreateInputCollection=function(){if(this.parentForm==!1)return!1;for(var a=0;a<this.formInputs.length;a++)this.parentForm.removeChild(this.formInputs[a]);this.formInputs=[];if(this.FormSubmitSerialization)this.createFormInput("serialized",this.serialize());else if(this.FormSubmitOnlySelected)if(this.FormSubmitOnlyRowID)this.createFormInput("selected",this.getSelectedId());else for(a=0;a<this.selectedRows.length;a++)this.createFormInputRow(this.selectedRows[a]);else this._submitAR&&
(this._added_rows.length&&this.createFormInput("rowsadded",this._added_rows.join(",")),this._deleted_rows.length&&this.createFormInput("rowsdeleted",this._deleted_rows.join(","))),this.forEachRow(function(a){this.getRowById(a);this.createFormInputRow(this.rowsAr[a])})};dhtmlXGridObject.prototype.detectParentFormPresent=function(){for(var a=!1,b=this.entBox;b&&b.tagName&&b!=document.body;)if(b.tagName.toLowerCase()=="form"){a=b;break}else b=b.parentNode;return a};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
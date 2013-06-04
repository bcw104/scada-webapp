//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_passw(b){if(b)this.cell=b,this.grid=this.cell.parentNode.grid;this.edit=function(){this.cell.innerHTML="";this.cell.atag="INPUT";this.val=this.getValue();this.obj=document.createElement(this.cell.atag);this.obj.style.height=this.cell.offsetHeight-(_isIE?6:4)+"px";this.obj.className="dhx_combo_edit";this.obj.type="password";this.obj.wrap="soft";this.obj.style.textAlign=this.cell.align;this.obj.onclick=function(a){(a||event).cancelBubble=!0};this.obj.onmousedown=function(a){(a||event).cancelBubble=
!0};this.obj.value=this.cell._rval||"";this.cell.appendChild(this.obj);if(_isFF&&(this.obj.style.overflow="visible",this.grid.multiLine&&this.obj.offsetHeight>=18&&this.obj.offsetHeight<40))this.obj.style.height="36px",this.obj.style.overflow="scroll";this.obj.onselectstart=function(a){a||(a=event);return a.cancelBubble=!0};this.obj.focus();this.obj.focus()};this.getValue=function(){return this.cell._rval};this.setValue=function(a){var b="*****";this.cell.innerHTML=b;this.cell._rval=a};this.detach=
function(){this.setValue(this.obj.value);return this.val!=this.getValue()}}eXcell_passw.prototype=new eXcell;

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
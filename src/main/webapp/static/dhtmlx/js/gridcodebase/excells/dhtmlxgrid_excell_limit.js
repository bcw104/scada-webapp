//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_limit(b){if(b)this.cell=b,this.grid=this.cell.parentNode.grid;this.edit=function(){this.cell.atag=!this.grid.multiLine&&(_isKHTML||_isMacOS||_isFF)?"INPUT":"TEXTAREA";this.val=this.getValue();this.obj=document.createElement(this.cell.atag);this.obj.style.height=this.cell.offsetHeight-(_isIE?6:4)+"px";this.obj.className="dhx_combo_edit";this.obj.wrap="soft";this.obj.style.textAlign=this.cell.align;this.obj.onclick=function(a){(a||event).cancelBubble=!0};this.obj.onmousedown=function(a){(a||
event).cancelBubble=!0};this.obj.value=this.val;this.cell.innerHTML="";this.cell.appendChild(this.obj);if(_isFF&&(this.obj.style.overflow="visible",this.grid.multiLine&&this.obj.offsetHeight>=18&&this.obj.offsetHeight<40))this.obj.style.height="36px",this.obj.style.overflow="scroll";this.obj.onkeypress=function(){if(this.value.length>=15)return!1};this.obj.onselectstart=function(a){a||(a=event);return a.cancelBubble=!0};this.obj.focus();this.obj.focus()};this.getValue=function(){return this.cell.firstChild&&
this.cell.atag&&this.cell.firstChild.tagName==this.cell.atag?this.cell.firstChild.value:this.cell.innerHTML.toString()._dhx_trim()};this.setValue=function(a){this.cell.innerHTML=a.length>15?a.substring(0,14):a};this.detach=function(){this.setValue(this.obj.value);return this.val!=this.getValue()}}eXcell_limit.prototype=new eXcell;

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
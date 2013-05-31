//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_clist(a){try{this.cell=a,this.grid=this.cell.parentNode.grid}catch(b){}this.edit=function(){this.val=this.getValue();var a=this.cell._combo||this.grid.clists[this.cell._cellIndex];if(a){this.obj=document.createElement("DIV");for(var b=this.val.split(","),e="",c=0;c<a.length;c++){for(var g=!1,f=0;f<b.length;f++)a[c]==b[f]&&(g=!0);e+=g?"<div><input type='checkbox' checked='true' /><label>"+a[c]+"</label></div>":"<div><input type='checkbox' id='ch_lst_"+c+"'/><label>"+a[c]+"</label></div>"}e+=
"<div><input type='button' value='Apply' style='width:100px; font-size:8pt;' onclick='this.parentNode.parentNode.editor.grid.editStop();'/></div>";this.obj.editor=this;this.obj.innerHTML=e;document.body.appendChild(this.obj);this.obj.style.position="absolute";this.obj.className="dhx_clist";this.obj.onclick=function(a){return(a||event).cancelBubble=!0};var h=this.grid.getPosition(this.cell);this.obj.style.left=h[0]+"px";this.obj.style.top=h[1]+this.cell.offsetHeight+"px";this.obj.getValue=function(){for(var a=
"",b=0;b<this.childNodes.length-1;b++)this.childNodes[b].childNodes[0].checked&&(a&&(a+=","),a+=this.childNodes[b].childNodes[1].innerHTML);return a}}};this.getValue=function(){return this.cell._clearCell?"":this.cell.innerHTML.toString()._dhx_trim()};this.detach=function(){if(this.obj)this.setValue(this.obj.getValue()),this.obj.editor=null,this.obj.parentNode.removeChild(this.obj),this.obj=null;return this.val!=this.getValue()}}eXcell_clist.prototype=new eXcell;
eXcell_clist.prototype.setValue=function(a){if(typeof a=="object"){var b=this.grid.xmlLoader.doXPath("./option",a);if(b.length)this.cell._combo=[];for(var d=0;d<b.length;d++)this.cell._combo.push(b[d].firstChild?b[d].firstChild.data:"");a=a.firstChild.data}a===""||a===this.undefined?(this.setCTxtValue(" ",a),this.cell._clearCell=!0):(this.setCValue(a),this.cell._clearCell=!1)};
dhtmlXGridObject.prototype.registerCList=function(a,b){if(!this.clists)this.clists=[];typeof b!="object"&&(b=b.split(","));this.clists[a]=b};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
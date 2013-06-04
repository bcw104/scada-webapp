//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_ra_str(a){if(a)this.base=eXcell_ra,this.base(a),this.grid=a.parentNode.grid}eXcell_ra_str.prototype=new eXcell_ch;
eXcell_ra_str.prototype.setValue=function(a){this.cell.style.verticalAlign="middle";if(a&&(a=a.toString()._dhx_trim(),a=="false"||a=="0"))a="";if(a){if(this.grid.rowsAr[this.cell.parentNode.idd])for(var b=0;b<this.grid._cCount;b++)if(b!==this.cell._cellIndex){var c=this.grid.cells(this.cell.parentNode.idd,b);(c.cell._cellType||this.grid.cellType[c.cell._cellIndex])=="ra_str"&&c.getValue()&&c.setValue("0")}a="1";this.cell.chstate="1"}else a="0",this.cell.chstate="0";this.setCValue("<img src='"+this.grid.imgURL+
"radio_chk"+a+".gif' onclick='new eXcell_ra_str(this.parentNode).changeState()'>",this.cell.chstate)};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
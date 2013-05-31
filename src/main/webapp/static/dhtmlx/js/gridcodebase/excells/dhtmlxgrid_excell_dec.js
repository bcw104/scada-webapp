//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_dec(c){if(c)this.cell=c,this.grid=this.cell.parentNode.grid;this.getValue=function(){return parseFloat(this.cell.innerHTML.replace(/,/g,""))};this.setValue=function(a){var f="0,000.00";if(a=="0")this.setCValue(f.replace(/.*(0\.[0]+)/,"$1"),a);else{for(var c=f.substr(f.indexOf(".")+1).length,a=Math.round(a*Math.pow(10,c)).toString(),b="",d=0,g=!1,e=a.length-1;e>=0;e--)d++,b=a.charAt(e)+b,!g&&d==c&&(b="."+b,d=0,g=!0),g&&d==3&&e!=0&&a.charAt(e-1)!="-"&&(b=","+b,d=0);this.setCValue(b,
a)}}}eXcell_dec.prototype=new eXcell_ed;

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
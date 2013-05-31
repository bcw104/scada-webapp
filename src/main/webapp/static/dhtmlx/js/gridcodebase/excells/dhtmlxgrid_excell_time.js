//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
function eXcell_time(f){this.base=eXcell_ed;this.base(f);this.getValue=function(){return this.cell.innerHTML.toString()};this.setValue=function(a){var b=/ /i,a=a.replace(b,":");if(a=="")a="00:00";else{var b=/[a-zA-Z]/i,e=a.match(b);if(e)a="00:00";else if(b=/[0-9]+[\.\/;\-,_\]\[\?\: ][0-9]+/i,e=a.search(b),e!=-1)b=/[\./\;\-\,\_\]\[ \?]/i,a=a.replace(b,":");else if(b=/[^0-9]/i,res1=a.search(b),e=a.match(b))a="00:00";else if(a.length==1)a="00:0"+a;else if(parseInt(a)<60)a="00:"+a;else if(a.length<5){var c=
parseInt(a),d=Math.floor(c/60);c-=60*d;d=d.toString();for(c=c.toString();d.length<2;)d="0"+d;for(;c.length<2;)c="0"+c;a=d+":"+c}}this.cell.innerHTML=a}}eXcell_time.prototype=new eXcell_ed;

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
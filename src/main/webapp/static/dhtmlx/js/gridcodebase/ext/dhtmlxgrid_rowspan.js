//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.setRowspan=function(b,d,e){var a=this[this._bfs_cells?"_bfs_cells":"cells"](b,d).cell,c=this.rowsAr[b];if(a.rowSpan&&a.rowSpan!=1)for(var f=c.nextSibling,g=1;g<a.rowSpan;g++){var i=f.childNodes[f._childIndexes[a._cellIndex+1]],h=document.createElement("TD");h.innerHTML="&nbsp;";h._cellIndex=a._cellIndex;h._clearCell=!0;i?i.parentNode.insertBefore(h,i):f.parentNode.appendChild(h);this._shiftIndexes(f,a._cellIndex,-1);f=f.nextSibling}a.rowSpan=e;for(var c=this._h2?this.rowsAr[this._h2.get[c.idd].parent.childs[this._h2.get[c.idd].index+
1].id]:c.nextSibling||this.rowsCol[this.rowsCol._dhx_find(c)+1],k=[],g=1;g<e;g++){var j=null,j=this._fake&&!this._realfake?this._bfs_cells3(c,d).cell:this.cells3(c,d).cell;this._shiftIndexes(c,a._cellIndex,1);j&&j.parentNode.removeChild(j);k.push(c);this._h2?(c=this._h2.get[c.idd].parent.childs[this._h2.get[c.idd].index+1])&&(c=this.rowsAr[c.id]):c=c.nextSibling||this.rowsCol[this.rowsCol._dhx_find(c)+1]}this.rowsAr[b]._rowSpan=this.rowsAr[b]._rowSpan||{};this.rowsAr[b]._rowSpan[d]=k;this._fake&&
!this._realfake&&d<this._fake._cCount&&this._fake.setRowspan(b,d,e)};dhtmlXGridObject.prototype._shiftIndexes=function(b,d,e){if(!b._childIndexes){b._childIndexes=[];for(var a=0;a<b.childNodes.length;a++)b._childIndexes[a]=a}for(a=0;a<b._childIndexes.length;a++)a>d&&(b._childIndexes[a]-=e)};
dhtmlXGridObject.prototype.enableRowspan=function(){this._erspan=!0;this.enableRowspan=function(){};this.attachEvent("onAfterSorting",function(){if(!this._dload){for(var b=1;b<this.obj.rows.length;b++)if(this.obj.rows[b]._rowSpan){var d=this.obj.rows[b],e;for(e in d._rowSpan)for(var a=d,c=a._rowSpan[e],f=0;f<c.length;f++){a.nextSibling?a.parentNode.insertBefore(c[f],a.nextSibling):a.parentNode.appendChild(c[f]);if(this._fake){var g=this._fake.rowsAr[a.idd],i=this._fake.rowsAr[c[f].idd];g.nextSibling?
g.parentNode.insertBefore(i,g.nextSibling):g.parentNode.appendChild(i);this._correctRowHeight(a.idd)}a=a.nextSibling}}var h=this.rowsCol.stablesort;this.rowsCol=new dhtmlxArray;this.rowsCol.stablesort=h;for(b=1;b<this.obj.rows.length;b++)this.rowsCol.push(this.obj.rows[b])}});this.attachEvent("onXLE",function(){for(var b=0;b<this.rowsBuffer.length;b++)for(var d=this.render_row(b),e=d.childNodes,a=0;a<e.length;a++)e[a]._attrs.rowspan&&this.setRowspan(d.idd,a,e[a]._attrs.rowspan)})};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
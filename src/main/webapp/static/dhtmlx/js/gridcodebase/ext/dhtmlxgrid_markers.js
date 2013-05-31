//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
dhtmlXGridObject.prototype.enableMarkedCells=function(a){this.markedRowsArr=new dhtmlxArray(0);this.markedCellsArr=[];this.lastMarkedColumn=this.lastMarkedRow=null;this.markedCells=!0;this.lastMarkMethod=0;if(arguments.length>0&&!convertStringToBoolean(a))this.markedCells=!1};
dhtmlXGridObject.prototype.doMark=function(a,b){var c=a.parentNode.idd;this.setActive(!0);if(c){this.editStop();this.cell=a;this.row=a.parentNode;var d=a._cellIndex;b||(b=0);if(b==0)this.unmarkAll();else if(b==1){if(this.lastMarkedRow)for(var h=Math.min(this.getRowIndex(c),this.getRowIndex(this.lastMarkedRow)),i=Math.max(this.getRowIndex(c),this.getRowIndex(this.lastMarkedRow)),j=Math.min(d,this.lastMarkedColumn),k=Math.max(d,this.lastMarkedColumn),e=h;e<i+1;e++)for(var f=j;f<k+1;f++)this.mark(this.getRowId(e),
f,!0)}else if(b==2&&this.markedRowsArr._dhx_find(c)!=-1)for(var g=0;g<this.markedCellsArr[c].length;g++)if(this.markedCellsArr[c][g]==d)return this.mark(c,d,!1),!0;this.markedCellsArr[c]||(this.markedCellsArr[c]=new dhtmlxArray(0));b!=1&&this.mark(c,d);this.moveToVisible(this.cells(c,d).cell);this.lastMarkedRow=c;this.lastMarkedColumn=d;this.lastMarkMethod=b}};
dhtmlXGridObject.prototype.mark=function(a,b,c){if(arguments.length>2&&!convertStringToBoolean(c)){this.cells(a,b).cell.className=this.cells(a,b).cell.className.replace(/cellselected/g,"");if(this.markedRowsArr._dhx_find(a)!=-1){var d=this.markedCellsArr[a]._dhx_find(b);d!=-1&&(this.markedCellsArr[a]._dhx_removeAt(d),this.markedCellsArr[a].length==0&&this.markedRowsArr._dhx_removeAt(this.markedRowsArr._dhx_find(a)),this.callEvent("onCellUnMarked",[a,b]))}return!0}this.cells(a,b).cell.className+=" cellselected";
this.markedRowsArr._dhx_find(a)==-1&&(this.markedRowsArr[this.markedRowsArr.length]=a);this.markedCellsArr[a]||(this.markedCellsArr[a]=new dhtmlxArray(0));this.markedCellsArr[a]._dhx_find(b)==-1&&(this.markedCellsArr[a][this.markedCellsArr[a].length]=b,this.callEvent("onCellMarked",[a,b]))};
dhtmlXGridObject.prototype.unmarkAll=function(){if(this.markedRowsArr){for(var a=0;a<this.markedRowsArr.length;a++)for(var b=this.markedRowsArr[a],c=0;c<this.markedCellsArr[b].length;c++)this.callEvent("onCellUnMarked",[b,this.markedCellsArr[b][c]]),this.cells(b,this.markedCellsArr[b][c]).cell.className=this.cells(b,this.markedCellsArr[b][c]).cell.className.replace(/cellselected/g,"");this.markedRowsArr=new dhtmlxArray(0);this.markedCellsArr=[]}return!0};
dhtmlXGridObject.prototype.getMarked=function(){var a=[];if(this.markedRowsArr)for(var b=0;b<this.markedRowsArr.length;b++)for(var c=this.markedRowsArr[b],d=0;d<this.markedCellsArr[c].length;d++)a[a.length]=[c,this.markedCellsArr[c][d]];return a};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
To use this component please contact sales@dhtmlx.com to obtain license
*/
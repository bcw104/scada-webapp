
if(!window.console) {
    window.console = {};
    window.console.log = function(str) {};
    window.console.dir = function(str) {};
}
if (window.console.debug == undefined) {
    window.console.debug = window.console.info =
    window.console.warn = window.console.error = window.console.log
}
//alert(console.debug)

$(document).ready(function() {
	
	var asyncHttpStatistics = {
		transportType: 'N/A',
		responseState: 'N/A',
		numberOfTotalMessages: 0,
		numberOfErrors: 0
	};

	function refresh() {

		//alert("Refreshing data tables...");

		$('#transportType').html(asyncHttpStatistics.transportType);
		$('#responseState').html(asyncHttpStatistics.responseState);
		$('#numberOfCallbackInvocations').html(asyncHttpStatistics.numberOfTotalMessages);
		$('#numberOfErrors').html(asyncHttpStatistics.numberOfErrors);

	}

	function onMessage(response) {
		asyncHttpStatistics.numberOfTotalMessages++;
		refresh();
		var message = response.responseBody;
		if(message) {
            console.info(message);
			$('#latestMessage').html(message);
/*			var result;
	
			try {
				result =  $.parseJSON(message);
				$('#latestMessage').html(result);
			} catch (e) {
				asyncHttpStatistics.numberOfErrors++;
				alert("An error ocurred while parsing the JSON Data: " + message.data + "; Error: " + e);
				return;
			}*/
		}

	}
    function add(a,b,s,d){
//        alert(b);
	DCS.util.showTip(a,b,s,d);
}

    $.comet.init().subscribe("/" + username, function(msg){
//        alert(msg);
//        console.log(msg);
//        var txt = $('#latestMessage').html() + "," + msg;
//        $('#latestMessage').html(txt);
//        add('','报警提示' + msg,msg,false);
        $.ajax({
            type: 'POST',
            url: objUrl + '/alarm/getAlarmById',
            data:{id:msg},
            dateType:'json',
            success: function(json){
//               alert(json.info + '----' + json.endTag.name);
                var strHtml = json.endTag.name + " 产生报警<br />报警原因：" + json.info + '<br />' 
                        + '<a href="' + objUrl + '/alarmpage">查看</a>&nbsp;&nbsp;' 
                        + '<a id="confirmLink' + msg + '" href="javascript:void(0);" >回复</a> ';
//                $.messager.show('预警提示', strHtml, 0);
                
                
                add('','报警提示',strHtml,false);
                $('#confirmLink' + msg).bind('click', function(){confirmMessageShow(msg)});
            }
        });
    });
    


        function confirmMessageShow(p_alarmId){
//        alert('dd');
        $.ajax({
            type: 'POST',
            url: objUrl + '/alarm/confirm',
            data:{alarmId:p_alarmId, user:username, type:'confirm'},
            dateType:'json',
            success: function(json){
                $('#confirmLink' + p_alarmId).hide();                
            }
        });
    }
});


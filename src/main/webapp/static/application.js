
$(document).ready(function() {
	
	var asyncHttpStatistics = {
		transportType: 'N/A',
		responseState: 'N/A',
		numberOfTotalMessages: 0,
		numberOfErrors: 0
	};

	function refresh() {

		//alert("Refreshing data tables...");

		//$('#transportType').html(asyncHttpStatistics.transportType);
		//$('#responseState').html(asyncHttpStatistics.responseState);
		//$('#numberOfCallbackInvocations').html(asyncHttpStatistics.numberOfTotalMessages);
		//$('#numberOfErrors').html(asyncHttpStatistics.numberOfErrors);

	}

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

	function onMessage(response) {
		asyncHttpStatistics.numberOfTotalMessages++;
		refresh();
		var message = response.responseBody;

        $.ajax({
            type: 'POST',
            url: objUrl + '/alarm/getAlarmById',
            data:{id:message},
            dateType:'json',
            success: function(json){
//               alert(json.info + '----' + json.endTag.name);
                var strHtml = json.endTag.name + "产生报警,错误信息：<br />" + json.endTag.name + '<br />' 
                        + '<a href="' + objUrl + '/alarmpage">查看</a>&nbsp;&nbsp;' 
                        + '<a id="confirmLink' + message + '" href="javascript:void(0);" >回复</a> ';
                $.messager.show('预警提示', strHtml, 0);
                $('#confirmLink' + message).bind('click', function(){confirmMessageShow(message)});
            }
        });


        


		//if(message) {
			//$('#latestMessage').html(message);
/*			var result;
	
			try {
				result =  $.parseJSON(message);
				$('#latestMessage').html(result);
			} catch (e) {
				asyncHttpStatistics.numberOfErrors++;
				alert("An error ocurred while parsing the JSON Data: " + message.data + "; Error: " + e);
				return;
			}*/
		//}

	}
		
	var socket = $.atmosphere;
	var subSocket;
	var transport = 'websocket';
	var websocketUrl = "${fn:replace(r.requestURL, r.requestURI, '')}${r.contextPath}/websockets/";

	var request = {
		url: "alarm/listening?username=admin",
		contentType : "application/json",
		logLevel : 'debug',
		//shared : 'true',
		transport : transport ,
		fallbackTransport: 'long-polling',
		reconnectInterval: 2000,
		//callback: callback,
		onMessage: onMessage,
		onOpen: function(response) {
			//alert('Atmosphere onOpen: Atmosphere connected using ' + response.transport);
			transport = response.transport;
			asyncHttpStatistics.transportType = response.transport;
			refresh();
	    },
		onReconnect: function (request, response) {
			//alert("Atmosphere onReconnect: Reconnecting");
	    },
		onClose: function(response) {
			//alert('Atmosphere onClose executed');
		},

		onError: function(response) {
			//alert('Atmosphere onError: Sorry, but there is some problem with your '+ 'socket or the server is down');
		}
	};

	subSocket = socket.subscribe(request);
});
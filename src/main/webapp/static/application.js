
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

function add(a,b,s,d){
//        alert("你好");
	DCS.util.showTip(a,b,s,d);
}

	function onMessage(response) {//alert("dd");
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
                var strHtml = json.endTag.name + "产生报警<br />错误信息：" + json.endTag.name + '<br />' 
                        + '<a href="' + objUrl + '/alarmpage">查看</a>&nbsp;&nbsp;' 
                        + '<a id="confirmLink' + message + '" href="javascript:void(0);" >回复</a> ';
//                $.messager.show('预警提示', strHtml, 0);
                
                
                add('','预警提示',strHtml,true);
                $('#confirmLink' + message).bind('click', function(){confirmMessageShow(message)});
            }
        });
	}
		
	var socket = $.atmosphere;
	var subSocket;
	var transport = 'long-polling';
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
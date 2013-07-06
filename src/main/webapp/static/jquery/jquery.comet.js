/**
 * Created with IntelliJ IDEA.
 * User: 薄成文
 * Date: 13-7-1
 * Time: 上午9:07
 * To change this template use File | Settings | File Templates.
 */

jQuery.comet = {
    running: true,
    channels: [],
    channelListeners : {},
    init : function() {
        this.running = true;
        var self = this;
        (function poll(){

            if (!self.running) {
                return;
            }

            var params = {channels: self.channels.join(",")};
            self.channels = [];
            $.ajax({
                url: "/_rt",
                data: params,
                dataType:'json',
                complete:setTimeout( poll, 1000),
                cache: false,
                timeout: 3000,
                success: function(json){
                    //$.comet.onMessage(json);
                    if (json) {
                        for (var i = 0; i < json.length; i++) {
                            var listener = self.channelListeners[json[i].channel];
                            if (typeof(listener) == 'function') {
                                listener(json[i].message);
                            }
                        }
                    }
                },
                error: function() {
                    self.subscribeNexttime = true;
                    self.channels = [];
                    for (var channel in self.channelListeners) {
                        self.channels.push(channel);
                    }
                }
            });
        })();
        return this;
    },
    subscribe: function(channel, onMessage){
        this.channels.push(channel);
        this.channelListeners[channel] = onMessage;
        return this;
    },
//    onMessage: function(json) {
//        if (json) {
//            for (var i = 0; i < json.length; i++) {
//                var listener = this.channelListeners[json[i].channel];
//                if (typeof(listener) == 'function') {
//                    listener(json[i].message);
//                }
//            }
//        }
//    },
    stop: function() {
        this.running = false;
    }
}


JEStat = {


    /*!
     *  指定appkey
     *
     *  @param key  百度统计appkey
     *
     */
    startWithAppId: function(key) {
        return Cordova.exec(null, null, "JEStat", "startWithAppId", [key])
    },
    BaiduMobStat: (function() {
        var invokeNatvieMethod = function(action, obj) {
            console.info("invokeNatvieMethod");

            // call native method
            var cmd = {
                action: action,
                obj: obj
            }

            var iFrame = document.createElement("iframe");
            iFrame.setAttribute("src", "bmtj:" + JSON.stringify(cmd));
            iFrame.setAttribute("style", "display:none;");
            iFrame.setAttribute("height", "0px");
            iFrame.setAttribute("width", "0px");
            iFrame.setAttribute("frameborder", "0");

            document.body.appendChild(iFrame);

            // 发起请求后这个iFrame就没用了，所以把它从dom上移除掉
            iFrame.parentNode.removeChild(iFrame);
            iFrame = null;
        }

        return {
            onPageStart: function(page) {
                var obj = {
                    page: page
                };

                // invokeNatvieMethod('onPageStart', obj);
                Cordova.exec(null, null, "JEStat", "onPageStart", [page])
            },
            onPageEnd: function(page) {
                var obj = {
                    page: page
                };

                Cordova.exec(null, null, "JEStat", "onPageEnd", [page])
                // invokeNatvieMethod('onPageEnd', obj);
            },
            onEvent: function(id, label) {
                var obj = {
                    event_id: id,
                    label: label,
                };
                // invokeNatvieMethod('onEvent', obj);
                Cordova.exec(null, null, "JEStat", "onEvent", [id, label])
            },
            onEventStart: function(id, label) {
                var obj = {
                    event_id: id,
                    label: label
                };

                // invokeNatvieMethod('onEventStart', obj);
                Cordova.exec(null, null, "JEStat", "onEventStart", [id, label])
            },
            onEventEnd: function(id, label) {
                var obj = {
                    event_id: id,
                    label: label
                };

                // invokeNatvieMethod('onEventEnd', obj);
                Cordova.exec(null, null, "JEStat", "onEventEnd", [id, label])
            },
            onEventDuration: function(id, label, duration) {
                var obj = {
                    event_id: id,
                    label: label,
                    duration: typeof duration === 'number' ? duration : 0
                };

                // invokeNatvieMethod('onEventDuration', obj);
                Cordova.exec(null, null, "JEStat", "onEventDuration", [id, label, duration || 0])
            }
        };
    }())
}
module.exports = JEStat;

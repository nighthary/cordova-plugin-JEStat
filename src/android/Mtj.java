package com.baidu.mtj;

import com.baidu.mobstat.StatService;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;


/**
 * Created by HuangLi on 2017/3/6.
 */
public class Mtj extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		
        if(action.equals("onPageStart")) {
            StatService.onPageStart(cordova.getActivity(),args.getString(0));
        }else if (action.equals("onPageEnd")){
            StatService.onPageEnd(cordova.getActivity(),args.getString(0));
        }else if (action.equals("onEventStart")){
            StatService.onEvent(cordova.getActivity(),args.getString(0),args.getString(1));
        }else if (action.equals("onEventEnd")){
            StatService.onEventEnd(cordova.getActivity(),args.getString(0),args.getString(1));
        }else if (action.equals("onEvent")){
            StatService.onEvent(cordova.getActivity(),args.getString(0),args.getString(1));
        }else if (action.equals("onEventDuration")){
            StatService.onEventDuration(cordova.getActivity(),args.getString(0),args.getString(1),args.getLong(2));
        }
        return super.execute(action, args, callbackContext);
    }
   
}

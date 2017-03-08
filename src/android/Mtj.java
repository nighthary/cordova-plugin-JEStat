package com.baidu.mtj;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;  

/**
 * Created by HuangLi on 2017/3/6.
 */
public class Mtj extends CordovaPlugin {

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        
    } 
	
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		
        if(action.equals("startNavi")) {
			
        }
        return super.execute(action, args, callbackContext);
    }
   
}

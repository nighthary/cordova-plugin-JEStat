
	
> 注意:android需要在添加插件时手动将APPKEY添加到插件中;

----

> ios直接在前端代码中调用startWithAppId进行初始化
	
###使用插件

> 具体提供的方法请参考插件www目录下的JEStat.js中提供的方法,下面给出简单的用法:

```
	JEStat.BaiduMobStat.onPageStart('我要买车');
	JEStat.BaiduMobStat.onEvent('eventId', 'eventName');
		
```

###事件定义配置

	-|事件ID|事件名称|
	----|-------|---------|
	-|eventID|eventName|
	例子|carlist|我要买车|
	
**说明:事件可以配置事件点击,事件开始,事件结束,事件经历时间这四种情况,但是一个事件ID只对应一个事件名称**	

**所有需要的事件需要预先定义再到移动端的代码中埋点事件统计才会生效**

```
	onEvent(eventId, eventName)
	onEventStart(eventId, eventName)
	onEventEnd(eventId, eventName)
	onEventDuration(eventId, eventName, duration)
```

**注意:事件别名不可以传递对象，只能是字符串**



------


>     /*若应用是基于iOS 9系统开发，需要在程序的info.plist文件中添加一项参数配置，确保日志正常发送，配置如下：
        NSAppTransportSecurity(NSDictionary):
            NSAllowsArbitraryLoads(Boolen):YES
     */

# cordova-plugin-JEStat

插件实现了cordova iOS应用添加百度统计，通过JS调用百度统计的API

# Installation

	cordova plugin add https://github.com/nighthary/cordova-plugin-JEStat.git --variable STAT_ID=ANDROID_APPKEY

# Supported Platforms

* iOS

# API Reference

* startWithAppId 
* BaiduMobStat
	* onPageStart
	* onPageEnd
	* onEvent
	* onEventStart
	* onEventEnd
	* onEventDuration

## startWithAppId
设置百度统计的appkey

## BaiduMobStat

请参考百度移动统计API文档

[http://mtj.baidu.com/](http://mtj.baidu.com/)


//
//  JEStat.m
//  HelloCordova
//

#import "JEStat.h"
#import "BaiduMobStat.h"

@implementation JEStat

- (void)startWithAppId:(CDVInvokedUrlCommand *)command{

    //判断appkey
    if (command.arguments.count && [[command.arguments firstObject] isKindOfClass:[NSString class]]) {

        NSString *appkey = (NSString *)[command.arguments firstObject];

        BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
        // 此处(startWithAppId之前)可以设置初始化的可选参数，具体有哪些参数，可详见BaiduMobStat.h文件，例如：
        statTracker.shortAppVersion  = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        [statTracker startWithAppId:appkey];

        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"初始化成功"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];


    }else{
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"初始化失败"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

-(void)onEvent:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] logEvent:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


-(void)onEventDuration:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 3) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event, label and duration"];
    }
    else {
        [[BaiduMobStat defaultStat] logEventWithDurationTime:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1] durationTime:(unsigned long)[command argumentAtIndex:2 withDefault:0]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

-(void)onEventStart:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] eventStart:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}


-(void)onEventEnd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] eventEnd:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


-(void)onPageStart:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 1) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass page name"];
    }
    else {
        [[BaiduMobStat defaultStat] pageviewStartWithName:[command argumentAtIndex:0]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }

    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

-(void)onPageEnd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;

    if (args.count != 1) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass page name"];
    }
    else {
        [[BaiduMobStat defaultStat] pageviewEndWithName:[command argumentAtIndex:0]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    }
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}
@end

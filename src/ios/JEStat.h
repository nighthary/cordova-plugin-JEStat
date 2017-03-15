//
//  JEStat.h
//  HelloCordova
//


#import <Cordova/CDVPlugin.h>
#import "BaiduMobStat.h"

@interface JEStat : CDVPlugin

- (void)startWithAppId:(CDVInvokedUrlCommand *)command;
-(void)onEvent:(CDVInvokedUrlCommand*)command;
-(void)onEventDuration:(CDVInvokedUrlCommand *)command;
-(void)onEventStart:(CDVInvokedUrlCommand *)command;
-(void)onEventEnd:(CDVInvokedUrlCommand *)command;
-(void)onPageStart:(CDVInvokedUrlCommand *)command;
-(void)onPageEnd:(CDVInvokedUrlCommand *)command;
@end

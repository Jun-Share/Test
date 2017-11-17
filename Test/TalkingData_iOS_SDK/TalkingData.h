//
//  TalkingData.h
//  __MyProjectName__
//
//  Created by Biao Hou on 11-11-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


// 以下枚举用于WatchApp页面追踪
typedef enum {
    TDPageTypeGlance = 1,
    TDPageTypeNotification = 2,
    TDPageTypeWatchApp = 3
} TDPageType;

@interface TalkingData: NSObject

/**
 *  @method getDeviceID
 *  获取SDK所使用的DeviceID
 *  @return DeviceID
 */
+ (NSString *)getDeviceID;

/**
 *  @method setLogEnabled
 *  统计日志开关（可选）
 *  @param  enable      默认是开启状态
 */
+ (void)setLogEnabled:(BOOL)enable;

/**
 *  @method setExceptionReportEnabled
 *  是否捕捉程序崩溃记录（可选）
    如果需要记录程序崩溃日志，请将值设成YES，并且在调用sessionStarted:withChannelId:之前调用此函数
 *  @param  enable      默认是 NO
 */
+ (void)setExceptionReportEnabled:(BOOL)enable;

/**
 *  @method setSignalReportEnabled
 *  是否捕捉异常信号（可选）
    如果需要开启异常信号捕捉功能，请将值设成YES，并且在调用sessionStarted:withChannelId:之前调用此函数
 *  @param  enable      默认是NO
 */
+ (void)setSignalReportEnabled:(BOOL)enable;


/**
 *  @method setLatitude:longitude:
 *  设置位置信息（可选）
 *  @param  latitude    维度
 *  @param  longitude   经度
 */
+ (void)setLatitude:(double)latitude longitude:(double)longitude;

/**
 *  @method	sessionStarted:withChannelId:
 *  初始化统计实例，请在application:didFinishLaunchingWithOptions:方法里调用
 *  @param  appKey      应用的唯一标识，统计后台注册得到
 *  @param  channelId   渠道名，如“app store”（可选）
 */
+ (void)sessionStarted:(NSString *)appKey withChannelId:(NSString *)channelId;

/**
 *  @method	initWithWatch:
 *  初始化WatchApp统计实例，请在每个入口类的init方法里调用
 *  @param  appKey      应用的唯一标识，统计后台注册得到
 */
+ (void)initWithWatch:(NSString *)appKey;







@end

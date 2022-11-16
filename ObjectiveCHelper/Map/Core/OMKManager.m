//
//  OMKManager.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKManager.h"
#import "OMKConfig.h"

#import <AMapFoundationKit/AMapFoundationKit.h>//高德地图Bae
#import <MAMapKit/MAMapKit.h>

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//百度地图Base
#import <BMKLocationkit/BMKLocationComponent.h>//百度定位

#import <QMapKit/QMapKit.h>//腾讯地图
#import <QMapKit/QMSSearchKit.h>

@interface OMKManager () <BMKLocationAuthDelegate, BMKGeneralDelegate>

@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类

@end

@implementation OMKManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _isInit = false;
    }
    return self;
}

+ (instancetype)sharesInstance {
    static OMKManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OMKManager alloc] init];
    });
    
    return manager;
}

- (void)initWithConfig:(OMKConfig *)config {
    if (!_isInit) {
        [self setupAMapWithKey:config.aMapKey];
        [self setupBaiduMapWithKey:config.baiduMapKey];
        [self setupTencentMapWithKey:config.tencentMapKey];
        _isInit = YES;
    }
}

#pragma mark - 高德地图
- (void)setupAMapWithKey:(NSString *)key {
    //在构造MAMapView（MAOfflineMap，MAOfflineMapViewController,MATraceManager等）之前必须进行合规检查，设置接口之前保证隐私政策合规
    [MAMapView updatePrivacyShow:AMapPrivacyShowStatusDidShow privacyInfo:AMapPrivacyInfoStatusDidContain];
    [MAMapView updatePrivacyAgree:AMapPrivacyAgreeStatusDidAgree];
    [AMapServices sharedServices].apiKey = key;
}

#pragma mark - 百度地图
/**
 *@brief 百度地图初始化
 *@param key 应用AK
 */
- (void)setupBaiduMapWithKey:(NSString *)key {
    //从地图SDK6.5.1版本起增加隐私合规接口，开发者需要调用接口通知百度地图用户是否已经同意隐私政策。隐私政策官网链接： https://lbsyun.baidu.com/index.php?title=openprivacy
    [[BMKLocationAuth sharedInstance] setAgreePrivacy:YES];

    // 初始化定位SDK
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:key authDelegate:self];
    //要使用百度地图，请先启动BMKMapManager
    [BMKMapManager setAgreePrivacy:YES];
    self.mapManager = [[BMKMapManager alloc] init];
    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
#if DEBUG
        NSLog(@"百度地图 经纬度类型设置成功");
#endif
    } else {
#if DEBUG
        NSLog(@"百度地图 经纬度类型设置失败");
#endif
    }
    
    //启动引擎并设置AK并设置delegate
    if ([self.mapManager start:key generalDelegate:self]) {
#if DEBUG
        NSLog(@"百度地图 启动引擎成功");
#endif
    } else {
#if DEBUG
        NSLog(@"百度地图 启动引擎失败");
#endif
    }
}

#pragma mark - BMKLocationAuthDelegate
/**
 *@brief 返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKLocationAuthErrorCode
 */
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
    if (0 == iError) {
#if DEBUG
        NSLog(@"百度定位 授权成功");
#endif
    } else {
#if DEBUG
        NSLog(@"百度定位 授权失败：%ld", (long)iError);
#endif
    }
}

#pragma mark - BMKGeneralDelegate

/**
 *返回网络错误
 *@param iError 错误号
 */
- (void)onGetNetworkState:(int)iError {
    if (0 == iError) {
#if DEBUG
        NSLog(@"百度地图 授权成功");
#endif
    } else {
#if DEBUG
        NSLog(@"百度地图 授权失败：%d", iError);
#endif
    }
}

/**
 *返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKPermissionCheckResultCode
 */
- (void)onGetPermissionState:(int)iError {
    if (0 == iError) {
#if DEBUG
        NSLog(@"百度地图 联网成功");
#endif
    } else {
#if DEBUG
        NSLog(@"百度地图 联网失败：%d", iError);
#endif
    }
}

#pragma mark - 腾讯地图
- (void)setupTencentMapWithKey:(NSString *)key {
    //隐私合规接口, 必须在地图初始化前调用, 默认为false
    //在构造QMapView之前，开发者应向用户展示授权弹窗，并提示用户授权前请仔细阅读腾讯位置服务隐私协议内容: https://lbs.qq.com/userAgreements/agreements/privacy，如果用户拒绝授权则无法正常显示地图页面。
    [[QMapServices sharedServices] setPrivacyAgreement:YES];
    
    //在使用地图SDK时，需要对应用做Key机制验证，如果地图不添加key，地图将显示鉴权失败,请检查你的Key的错误信息，控制台也同时会显示key 鉴权失败:xxx的错误日志和原因。
    [QMapServices sharedServices].APIKey = key;
    [[QMSSearchServices sharedServices] setApiKey:key];
}

@end

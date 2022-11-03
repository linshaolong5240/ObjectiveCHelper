//
//  AppDelegate.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "AppDelegate.h"
#import "OCHTabbarViewController.h"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <QMapKit/QMapKit.h>

#import <BMKLocationkit/BMKLocationComponent.h>

@interface AppDelegate () <BMKLocationAuthDelegate, BMKGeneralDelegate>
@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //高德地图
    [AMapServices sharedServices].apiKey = @"6b84213157c7640fd007c800ac20ecf4";
    //end
    
    //百度地图
    // 初始化定位SDK
    [[BMKLocationAuth sharedInstance] setAgreePrivacy:YES];
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"qCfINkbXjt4D2PwngcczywFRHjvqcM7b" authDelegate:self];
    //要使用百度地图，请先启动BMKMapManager
    [BMKMapManager setAgreePrivacy:YES];
    _mapManager = [[BMKMapManager alloc] init];
    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
        NSLog(@"经纬度类型设置成功");
    } else {
        NSLog(@"经纬度类型设置失败");
    }
    
    //启动引擎并设置AK并设置delegate
    BOOL result = [_mapManager start:@"qCfINkbXjt4D2PwngcczywFRHjvqcM7b" generalDelegate:self];
    if (!result) {
        NSLog(@"启动引擎失败");
    }
    //end
    
    //腾讯地图
    [[QMapServices sharedServices] setPrivacyAgreement:YES];
    [QMapServices sharedServices].APIKey = @"6LDBZ-OG3C6-7GGSW-EPAJH-NN6S5-3JFVQ";
    //end

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UIViewController *rootViewController = OCHTabbarViewController.new;
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
}

/**
 联网结果回调

 @param iError 联网结果错误码信息，0代表联网成功
 */
- (void)onGetNetworkState:(int)iError {
    if (0 == iError) {
        NSLog(@"联网成功");
    } else {
        NSLog(@"联网失败：%d", iError);
    }
}

/**
 鉴权结果回调

 @param iError 鉴权结果错误码信息，0代表鉴权成功
 */
- (void)onGetPermissionState:(int)iError {
    if (0 == iError) {
        NSLog(@"授权成功");
    } else {
        NSLog(@"授权失败：%d", iError);
    }
}

/**
 *@brief 返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKLocationAuthErrorCode
 */
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError {
    if (0 == iError) {
        NSLog(@"定位授权成功");
    } else {
        NSLog(@"定位授权失败：%d", iError);
    }
}



//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end

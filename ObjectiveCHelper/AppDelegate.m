//
//  AppDelegate.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "AppDelegate.h"
#import "OCHTabbarViewController.h"
#import "OMKConfig.h"
#import "OMKManager.h"

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
    OMKConfig *mapConfig = [[OMKConfig alloc] init];
    mapConfig.aMapKey = OCHAppConfig.aMapKey;
    mapConfig.baiduMapKey = OCHAppConfig.baiduMapKey;
    mapConfig.tencentMapKey = OCHAppConfig.tencentMapKey;
    
    [[OMKManager sharesInstance] initWithConfig:mapConfig];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UIViewController *rootViewController = OCHTabbarViewController.new;
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];

    return YES;
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

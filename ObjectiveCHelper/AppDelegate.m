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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UIViewController *rootViewController = OCHTabbarViewController.new;
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    [AMapServices sharedServices].apiKey = @"6b84213157c7640fd007c800ac20ecf4";
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [mapManager start:@"qCfINkbXjt4D2PwngcczywFRHjvqcM7b" generalDelegate:nil];
    if (!ret) {
        NSLog(@"启动引擎失败");
    }
    [QMapServices sharedServices].APIKey = @"6LDBZ-OG3C6-7GGSW-EPAJH-NN6S5-3JFVQ";
    [[QMapServices sharedServices] setPrivacyAgreement:YES];


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

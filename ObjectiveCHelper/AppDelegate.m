//
//  AppDelegate.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "AppDelegate.h"
#import "OCHTabbarViewController.h"
#import "TestA.h"
#import "TestB.h"
//#import <OneMapKit/OneMapKit.h>
#import "OCHStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#ifdef __HAS_AMap_FRAMEWORK__
    //高德地图
    [[OMKAManager sharesInstance] setPrivacyAgreement:YES];
    [[OMKAManager sharesInstance] setApiKey:@"6b84213157c7640fd007c800ac20ecf4"];
#endif
    
#ifdef __HAS_BaiduMap_FRAMEWORK__
    //百度地图
    [[OMKBManager sharesInstance] setPrivacyAgreement:YES];
    [[OMKBManager sharesInstance] setApiKey:@"qCfINkbXjt4D2PwngcczywFRHjvqcM7b"];
#endif

#ifdef __HAS_TencentMap_FRAMEWORK__
    //腾讯地图
    [[OMKQManager sharesInstance] setPrivacyAgreement:YES];
    [[OMKQManager sharesInstance] setApiKey:@"6LDBZ-OG3C6-7GGSW-EPAJH-NN6S5-3JFVQ"];
#endif

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UIViewController *rootViewController = OCHTabbarViewController.new;
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
#if DEBUG
    TestA *testA = [[TestA alloc] init];
    TestB *testB = [[TestB alloc] init];
    TestA *testC = (TestA *)testB;
    NSLog(@"TestA resuseIdentifier: %@", testA.reuseIdentifier);
    NSLog(@"TestB resuseIdentifier: %@", testB.reuseIdentifier);
    NSLog(@"TestC resuseIdentifier: %@", testC.reuseIdentifier);
#endif
    [OCHStore.sharedInstance didFinishLaunch];
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

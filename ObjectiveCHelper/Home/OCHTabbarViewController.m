//
//  OCHTabbarViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHTabbarViewController.h"
#import "OCHPreviewController.h"
#import "OCHFeatureViewController.h"
#import "FrameworkViewController.h"
#import "OCHThirdPartyViewController.h"

@interface OCHTabbarViewController ()

@end

@implementation OCHTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureTabBar];
    
}

- (void)configureTabBar {
    UIViewController *vc0 = [self makeTabBarViewController:[OCHPreviewController new] title:@"Preview" image:nil selectedImage:nil];
    UIViewController *vc1 = [self makeTabBarViewController:[OCHFeatureViewController new] title:@"Feature" image:nil selectedImage:nil];
    UIViewController *vc2 = [self makeTabBarViewController:[FrameworkViewController new] title:@"Framework" image:nil selectedImage:nil];
    UIViewController *vc3 = [self makeTabBarViewController:[OCHThirdPartyViewController new] title:@"OCHThirdPartyViewController" image:nil selectedImage:nil];
    self.viewControllers = @[vc0, vc1, vc2, vc3];
}

- (UIViewController *)makeTabBarViewController:(UIViewController *)viewController title:(nullable NSString *)title image:(nullable UIImage *)image selectedImage:(nullable UIImage *)selectedImage {
    UIViewController *vc = [[UINavigationController alloc] initWithRootViewController:viewController];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    vc.tabBarItem = tabBarItem;
    return vc;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
//
//  OCHPreviewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreviewController.h"
#import "OCHPreview.h"
#import "UIButtonDemoViewController.h"
#import "OCHValueStepper.h"
#import "OCHPageViewController.h"
#import "ReactiveObjCDemoViewController.h"

@interface OCHPreviewController ()

@end

@implementation OCHPreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    UIView *v = [OCHPreview new];
    //    [self.contentView addSubview:v];
    //    [v mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.contentView);
    //    }];
    
//    OCHPageViewController *vc = [OCHPageViewController new];
//    vc.cycleScrollEnabled = true;
//
//    [self addChildViewController:vc];
//    [self.contentView addSubview:vc.view];
//    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView);
//    }];
//
//    UIViewController *vc1 = [UIViewController new];
//    vc1.view.backgroundColor = UIColor.redColor;
//    UIViewController *vc2 = [UIViewController new];
//    vc2.view.backgroundColor = UIColor.orangeColor;
//    UIViewController *vc3 = [UIViewController new];
//    vc3.view.backgroundColor = UIColor.blueColor;
//    vc.controllers = @[vc1, vc2, vc3];
//    [vc setViewControllers:@[vc1] direction:(UIPageViewControllerNavigationDirectionForward) animated:NO completion:^(BOOL finished) {
//
//    }];
    
    ReactiveObjCDemoViewController *vc = [ReactiveObjCDemoViewController new];

    [self addChildViewController:vc];
    [self.contentView addSubview:vc.view];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
        
//    OCHValueStepper *v = [OCHValueStepper new];
//    v.value = 0;
//    [self.contentView addSubview:v];
//    [v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.width.equalTo(self.contentView);
//        make.height.equalTo(@44);
//    }];
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

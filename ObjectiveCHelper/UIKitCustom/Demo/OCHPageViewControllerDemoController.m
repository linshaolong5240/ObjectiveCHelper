//
//  OCHPageViewControllerDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHPageViewControllerDemoController.h"
#import "OCHPageViewController.h"

@interface OCHPageViewControllerDemoController ()

@end

@implementation OCHPageViewControllerDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OCHPageViewController";
    OCHPageViewController *vc = [OCHPageViewController new];
    vc.cycleScrollEnabled = YES;
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = UIColor.redColor;
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = UIColor.orangeColor;
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = UIColor.blueColor;
    vc.controllers = @[vc1, vc2, vc3];
    [vc setViewControllers:@[vc1] direction:(UIPageViewControllerNavigationDirectionForward) animated:NO completion:^(BOOL finished) {

    }];
}

@end

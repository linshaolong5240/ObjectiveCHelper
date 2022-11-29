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

@property(nonatomic, strong, readonly) UIPageControl *pageControl;

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
    
    _pageControl = [[UIPageControl alloc] init];
    [self configurePageControl];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pageControl.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
}

- (void)configurePageControl {
    self.pageControl.currentPage = 10;//self.currentPage;
    self.pageControl.numberOfPages = 5;//self.controllers.count;
    [self.pageControl addTarget:self action:@selector(pageControlValueDidChanged:event:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:self.pageControl];
    [self pageControlValueDidChanged:self.pageControl event:(UIControlEventValueChanged)];
}

- (void)pageControlValueDidChanged:(UIPageControl *)pageControl event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s, currentPage: %ld", __PRETTY_FUNCTION__, (long)pageControl.currentPage);
#endif
    self.view.backgroundColor = UIColor.colorItems[pageControl.currentPage];
}

@end

//
//  UIPageControlDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIPageControlDemoViewController.h"

@interface UIPageControlDemoViewController ()

@property(nonatomic, strong) UIPageControl *pageControl;

@end

@implementation UIPageControlDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIPageControl";
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 10;
    self.pageControl.currentPage = 5;
    [self.pageControl addTarget:self action:@selector(pageControlValueDidChanged:event:) forControlEvents:(UIControlEventValueChanged)];
    [self pageControlValueDidChanged:self.pageControl event:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pageControl.frame = CGRectMake(0, 100, self.view.frame.size.width, 44);
}

- (void)pageControlValueDidChanged:(UIPageControl *)pageControl event:(UIControlEvents)event {
    NSLog(@"%s, currentPage: %ld", __PRETTY_FUNCTION__, (long)pageControl.currentPage);
    self.view.backgroundColor = UIColor.colorItems[pageControl.currentPage];
}

@end

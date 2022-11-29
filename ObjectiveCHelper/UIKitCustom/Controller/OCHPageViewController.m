//
//  OCHPageViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHPageViewController.h"

@interface OCHPageViewController ()

@end

@implementation OCHPageViewController

#pragma mark - Override

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(NSDictionary<UIPageViewControllerOptionsKey,id> *)options {
    self = [super initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
    if (self) {
        _currentPage = 0;
        _controllers = [NSArray array];
        _cycleScrollEnabled = false;
        _pageControl = [[UIPageControl alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self;
    self.delegate = self;
    [self configurePageControl];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pageControl.frame = CGRectMake(0, 100, self.view.frame.size.width, 44);
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
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^)(BOOL))completion {
    [super setViewControllers:viewControllers direction:direction animated:animated completion:completion];
    
    UIViewController *vc = viewControllers.firstObject;
    if (!vc) {
        return;
    }
    NSInteger index = [self.controllers indexOfObject:vc];
    if (index == NSNotFound) {
        return;
    }
    self.currentPage = index;
#if DEBUG
    NSLog(@"current page: %@", @(self.currentPage));
#endif
}

#pragma mark - Getter / Setter

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    self.pageControl.currentPage = currentPage;
}

- (void)setControllers:(NSArray<__kindof UIViewController *> *)controllers {
    _controllers = controllers;
    self.pageControl.numberOfPages = controllers.count;
}

#pragma mark - UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (self.controllers.count == 0) {
        return nil;
    }
    
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    return index > 0 ? self.controllers[index - 1] : (self.cycleScrollEnabled ? self.controllers.lastObject : nil);
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (self.controllers.count == 0) {
        return nil;
    }
    
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    return index < self.controllers.count -1 ? self.controllers[index + 1] : (self.cycleScrollEnabled ? self.controllers.firstObject : nil);
}

#pragma mark - UIPageViewControllerDelegate

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (!completed) {
        return;
    }
    UIViewController *vc = self.viewControllers.firstObject;
    if (!vc) {
        return;
    }
    NSInteger index = [self.controllers indexOfObject:vc];
    if (index == NSNotFound) {
        return;
    }
    self.currentPage = index;
#if DEBUG
    NSLog(@"current page: %@", @(self.currentPage));
#endif
}

@end

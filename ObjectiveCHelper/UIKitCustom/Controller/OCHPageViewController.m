//
//  OCHPageViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHPageViewController.h"

@interface OCHPageViewController ()

@property(nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation OCHPageViewController

#pragma mark - Override

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _curentPage = 0;
        _controllers = [NSArray array];
        _cycleScrollEnabled = false;
        _pageViewController = [[UIPageViewController alloc] init];
        _pageControl = [[UIPageControl alloc] init];
    }
    return self;
}

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(nullable NSDictionary<UIPageViewControllerOptionsKey, id> *)options {
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:style navigationOrientation:navigationOrientation options:options];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configurePageViewController];
    [self configurePageControl];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pageViewController.view.frame = self.view.frame;
    self.pageControl.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
}

- (void)configurePageViewController {
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self.view addSubview:self.pageViewController.view];
}

- (void)configurePageControl {
    [self.pageControl addTarget:self action:@selector(pageControlValueDidChanged:event:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:self.pageControl];
}

- (void)setViewControllers:(nullable NSArray<UIViewController *> *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion {
    [self.pageViewController setViewControllers:viewControllers direction:direction animated:animated completion:completion];
}

- (void)setPage:(NSInteger)page animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion {
    if (page < 0 || page > self.controllers.count - 1) {
        return;
    }
    [self.pageViewController setViewControllers:@[self.controllers[page]] direction:(page > self.curentPage ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse) animated:animated completion:completion];
    self.curentPage = page;
}

- (void)pageControlValueDidChanged:(UIPageControl *)pageControl event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s, currentPage: %ld", __PRETTY_FUNCTION__, (long)pageControl.currentPage);
#endif
    [self setPage:pageControl.currentPage animated:YES completion:nil];
}

- (void)updateCurrentPage {
    UIViewController *vc = self.pageViewController.viewControllers.firstObject;
    if (!vc) {
        return;
    }
    NSInteger index = [self.controllers indexOfObject:vc];
    if (index == NSNotFound) {
        return;
    }
    self.curentPage = index;
    self.pageControl.currentPage = index;
#if DEBUG
    NSLog(@"current page: %@", @(self.curentPage));
#endif
}

#pragma mark - Getter / Setter

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
    [self updateCurrentPage];
}

@end

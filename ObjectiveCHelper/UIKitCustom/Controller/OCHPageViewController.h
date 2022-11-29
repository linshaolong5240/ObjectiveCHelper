//
//  OCHPageViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, strong) NSArray<__kindof UIViewController *> *controllers;
@property(nonatomic, assign) BOOL cycleScrollEnabled;
@property(nonatomic, strong, readonly) UIPageControl *pageControl;

- (instancetype)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation options:(nullable NSDictionary<UIPageViewControllerOptionsKey, id> *)options;

- (void)setViewControllers:(nullable NSArray<UIViewController *> *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC;
- (void)setPage:(NSInteger)page animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC;

@end

NS_ASSUME_NONNULL_END

//
//  OCHPageViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHPageViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property(nonatomic, assign) NSInteger currentPage;
@property(nonatomic, strong) NSArray<__kindof UIViewController *> *controllers;
@property(nonatomic, assign) BOOL cycleScrollEnabled;
@property(nonatomic, strong, readonly) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
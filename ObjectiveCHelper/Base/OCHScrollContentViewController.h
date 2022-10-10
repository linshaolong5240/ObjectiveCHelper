//
//  OCHScrollContentViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "OCHBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCHScrollContentViewController : OCHBaseViewController

@property(nonatomic, strong, readonly) UIScrollView* scrollView;
@property(nonatomic, strong, readonly) UIStackView* scrollContentView;

@end

NS_ASSUME_NONNULL_END

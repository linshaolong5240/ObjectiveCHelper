//
//  OCHScrollViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "OCHBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCHScrollViewController : OCHBaseViewController

@property(nonatomic, strong, readonly) UIStackView *contentView;

@property(nonatomic, strong, readonly) UIScrollView* scrollView;

@end

NS_ASSUME_NONNULL_END

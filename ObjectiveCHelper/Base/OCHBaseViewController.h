//
//  OCHBaseViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHBaseViewController : UIViewController

@property(nonatomic, strong, readonly) UIStackView *contentView;

- (void)addSafeAreaBottomView:(UIView *)contentView backgroundColor:(UIColor *)backgroundColor height:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END

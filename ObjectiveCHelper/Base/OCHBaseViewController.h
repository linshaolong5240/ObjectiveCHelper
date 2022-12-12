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

-(void)setNavigationBarLight;
-(void)setNavigationBarDark;

- (void)addSafeAreaBottomView:(UIView *)contentView height:(CGFloat)height backgroundColor:(UIColor *)backgroundColor;

@end

NS_ASSUME_NONNULL_END

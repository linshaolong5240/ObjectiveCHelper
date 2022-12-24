//
//  OCHBaseViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHBaseViewController : UIViewController

-(void)setNavigationBarLight;
-(void)setNavigationBarDark;

- (void)addSafeAreaBottomView:(UIView *)contentView height:(CGFloat)height backgroundColor:(UIColor *)backgroundColor;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END

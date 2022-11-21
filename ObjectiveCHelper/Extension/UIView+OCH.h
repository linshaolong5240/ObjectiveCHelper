//
//  UIView+Extension.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (OCH)

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated; // Uses a horizontal slide transition. Has no effect if the view controller is already in the stack.

@end

NS_ASSUME_NONNULL_END

//
//  UIView+Extension.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import "UIView+OCH.h"

@implementation UIView (OCH)

- (void)removeAllSubviews {
    for(UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIResponder *responser = [self nextResponder];
    while (![responser isKindOfClass:[UIViewController class]] && responser != nil) {
        responser = [responser nextResponder];
    }
    UIViewController *superController = (UIViewController*)responser;
    [superController.navigationController pushViewController:viewController animated:YES];
}

@end

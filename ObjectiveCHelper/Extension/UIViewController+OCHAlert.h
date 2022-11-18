//
//  UIViewController+OCHAlert.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (OCHAlert)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END

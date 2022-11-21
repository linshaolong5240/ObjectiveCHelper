//
//  UIViewController+OCHAlert.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIViewController+OCH.h"

@implementation UIViewController (OCH)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alerController addAction:okAction];
    [self presentViewController:alerController animated:YES completion:nil];
}

@end

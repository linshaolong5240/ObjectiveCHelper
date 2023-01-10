//
//  OUIAlertController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OUIAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUIAlertController : UIViewController

@property (nonatomic, readonly) NSMutableArray<OUIAlertAction *> *actions;

@property (nonatomic, readonly) UILabel *titleLabel;

@property (nonatomic, readonly) UILabel *messageLabel;

@property (nonatomic, readonly) NSMutableArray<UITextField *> *textFields;

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

- (void)addAction:(OUIAlertAction *)action;

- (void)addTextFieldWithConfigurationHandler:(void (^ __nullable)(UITextField *textField))configurationHandler;

@end

NS_ASSUME_NONNULL_END

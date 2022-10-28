//
//  OCHValueStepper.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHValueStepper : UIView

@property(nonatomic, assign) double value;
@property(nonatomic, assign) double minimumValue;
@property(nonatomic, assign) double maximumValue;
@property(nonatomic, assign) double stepValue;

@property(nonatomic, assign) UIEdgeInsets contentInsets;
@property(nonatomic, strong, readonly) UITextField *valueField;
@property(nonatomic, strong, readonly) UIButton *subButton;
@property(nonatomic, strong, readonly) UIButton *addButton;

@end

NS_ASSUME_NONNULL_END

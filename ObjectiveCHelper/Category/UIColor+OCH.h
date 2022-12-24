//
//  UIColor+Extension.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (OCH)

@property(class, nonatomic, readonly) UIColor *accentColor;
@property(class, nonatomic, readonly) NSArray<UIColor*> *colorItems;

// MARK: - Background Color
@property(class, nonatomic, readonly) UIColor *controllerBackgroundColor;
+ (UIColor *)panelColor;

// MARK: - Text Color
+ (UIColor *)mainTextColor;
+ (UIColor *)secondaryTextColor;

// MARK: - Text Field Color
+ (UIColor *)textFieldBackgroundColor;
+ (UIColor *)textFieldLabelBackgroundColor;

// MARK: - Category Color
+ (UIColor *)categoryIndicatorLineColorColor;

@end

NS_ASSUME_NONNULL_END

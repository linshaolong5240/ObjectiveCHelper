//
//  UIColor+Extension.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

+(NSArray<UIColor *> *)colorItems;

// MARK: - Background Color
+ (UIColor *)background;
+ (UIColor *)panelBackground;

// MARK: - Text Color
+ (UIColor *)mainText;
+ (UIColor *)secondaryText;

// MARK: - Text Field Color
+ (UIColor *)textFieldBackground;
+ (UIColor *)textFieldLabelBackground;

// MARK: - Category Color
+ (UIColor *)categoryIndicatorLineColor;

@end

NS_ASSUME_NONNULL_END

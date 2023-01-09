//
//  OUIColor.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OUIColor : UIColor

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@property(nonatomic, class, readonly) UIColor *controllerBackgroundColor;

@property(nonatomic, class, readonly) UIColor *controllerBackgroundColorDark;

@property(nonatomic, class, readonly) UIColor *presentedControllerBackgroundColor;

@property(nonatomic, class, readonly) UIColor *panelColor;

@property(nonatomic, class, readonly) UIColor *panelColorDark;

@property(nonatomic, class, readonly) UIColor *mainTintColor;

@property(nonatomic, class, readonly) UIColor *mainTintColorDark;

@property(nonatomic, class, readonly) UIColor *secondaryTintColor;

@property(nonatomic, class, readonly) UIColor *secondaryTintColorDark;

@property(nonatomic, class, readonly) UIColor *mainTextColor;

@property(nonatomic, class, readonly) UIColor *mainTextColorDark;

@property(nonatomic, class, readonly) UIColor *secondaryTextColor;

@property(nonatomic, class, readonly) UIColor *secondaryTextColorDark;

@property(nonatomic, class, readonly) UIColor *dividerColor;

@property(nonatomic, class, readonly) UIColor *inputFieldBackgroundColor;

@property(nonatomic, class, readonly) UIColor *blueColor;

@property(nonatomic, class, readonly) UIColor *orangeColor;

@end

NS_ASSUME_NONNULL_END

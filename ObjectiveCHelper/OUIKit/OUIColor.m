//
//  OUIColor.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIColor.h"

@implementation OUIColor

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [OUIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)controllerBackgroundColor {
    return [OUIColor colorWithRed:246 green:247 blue:249];
}

+ (UIColor *)controllerBackgroundColorDark {
    return [OUIColor colorWithRed:45 green:46 blue:54];
}

+ (UIColor *)presentedControllerBackgroundColor {
    return [OUIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
}

+ (UIColor *)panelColor {
    return [OUIColor colorWithRed:255 green:255 blue:255];
}

+ (UIColor *)panelColorDark {
    return [OUIColor colorWithRed:33 green:34 blue:42];
}

+ (UIColor *)mainTintColor {
    return [OUIColor colorWithRed:255 green:205 blue:50];
}

+ (UIColor *)mainTintColorDark {
    return [OUIColor colorWithRed:100 green:83 blue:255];
}

+ (UIColor *)secondaryTintColor {
    return [OUIColor colorWithRed:100 green:83 blue:255];
}

+ (UIColor *)secondaryTintColorDark {
    return [OUIColor colorWithRed:61 green:62 blue:106];
}

+ (UIColor *)mainTextColor {
    return [OUIColor colorWithRed:51 green:51 blue:51];
}

+ (UIColor *)mainTextColorDark {
    return [OUIColor colorWithRed:129 green:134 blue:158];
}

+ (UIColor *)secondaryTextColor {
    return [OUIColor colorWithRed:102 green:102 blue:102];
}

+ (UIColor *)secondaryTextColorDark {
    return [OUIColor colorWithRed:153 green:153 blue:153];
}

+ (UIColor *)dividerColor {
    return [OUIColor colorWithRed:238 green:238 blue:238];
}

+ (UIColor *)inputFieldBackgroundColor {
    return [OUIColor colorWithRed:245 green:247 blue:251];
}

+ (UIColor *)blueColor {
    return [OUIColor colorWithRed:79 green:122 blue:253];
}

+ (UIColor *)orangeColor {
    return [OUIColor colorWithRed:254 green:169 blue:2];
}


@end

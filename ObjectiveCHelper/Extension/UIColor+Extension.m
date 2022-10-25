//
//  UIColor+Extension.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+(NSArray<UIColor *> *)colorItems {
    return @[UIColor.blackColor, UIColor.darkGrayColor, UIColor.lightGrayColor, UIColor.whiteColor, UIColor.grayColor, UIColor.redColor, UIColor.greenColor, UIColor.blueColor, UIColor.cyanColor, UIColor.yellowColor, UIColor.magentaColor, UIColor.orangeColor, UIColor.purpleColor, UIColor.brownColor, UIColor.clearColor, UIColor.systemRedColor];
}

// MARK: - Background Color
+ (UIColor *)backgroundColor {
    return [UIColor colorWithRed:246/255.0 green:247/255.0 blue:249/255.0 alpha:1.0];
}

+ (UIColor *)panelColor {
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
}

// MARK: - Text Color
+ (UIColor *)mainTextColor {
    return [[UIColor alloc] initWithRed:51/255 green:51/255 blue:51/255 alpha:1.0];
}

+ (UIColor *)secondaryTextColor {
    return [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
}

// MARK: - Text Field Color
+ (UIColor *)textFieldBackgroundColor {
    return [UIColor colorWithRed:246/255.0 green:247/255.0 blue:249/255.0 alpha:1.0];
}

+ (UIColor *)textFieldLabelBackgroundColor {
    return [UIColor colorWithRed:228/255.0 green:232/255.0 blue:241/255.0 alpha:1.0];
}

// MARK: - Category Color
+ (UIColor *)categoryIndicatorLineColorColor {
    return UIColor.systemBlueColor;
}

@end

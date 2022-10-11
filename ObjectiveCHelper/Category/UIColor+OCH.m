//
//  UIColor+OCH.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "UIColor+OCH.h"

@implementation UIColor (OCH)
+ (UIColor *)mainText {
    return [[UIColor alloc] initWithRed:51/255 green:51/255 blue:51/255 alpha:1.0];
}

+(NSArray<UIColor *> *)colorItems {
    return @[UIColor.blackColor, UIColor.darkGrayColor, UIColor.lightGrayColor, UIColor.whiteColor, UIColor.grayColor, UIColor.redColor, UIColor.greenColor, UIColor.blueColor, UIColor.cyanColor, UIColor.yellowColor, UIColor.magentaColor, UIColor.orangeColor, UIColor.purpleColor, UIColor.brownColor, UIColor.clearColor, UIColor.systemRedColor];
}

@end

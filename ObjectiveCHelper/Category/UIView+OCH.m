//
//  UIView+OCH.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/29.
//

#import "UIView+OCH.h"

@implementation UIView (OCH)
+ (NSString *)reusedIdentifer {
    return NSStringFromClass([self class]);
}
@end

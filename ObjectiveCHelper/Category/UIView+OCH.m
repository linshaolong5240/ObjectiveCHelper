//
//  UIView+OCH.m
//  ObjectiveCHelper
//
//  Created by Apple on 2022/9/29.
//

#import "UIView+OCH.h"

@implementation UIView (OCH)
+ (NSString *)reusedIdentif {
    return NSStringFromClass([self class]);
}
@end

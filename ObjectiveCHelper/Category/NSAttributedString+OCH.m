//
//  NSAttributedString+Extension.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/20.
//

#import "NSAttributedString+OCH.h"

@implementation NSAttributedString (OCH)


+ (NSAttributedString *)attributedStringWithLabel:(NSString *)label labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor value:(NSString *)value valueFont:(UIFont *)valueFont valueColor:(UIColor *)valueColor {
    NSDictionary<NSAttributedStringKey, id> *prefixAttr = @{
        NSFontAttributeName:labelFont,
        NSForegroundColorAttributeName:labelColor,
    };
    NSDictionary<NSAttributedStringKey, id> *valueAttr = @{
        NSFontAttributeName:valueFont,
        NSForegroundColorAttributeName:valueColor,
    };
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] init];
    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:label attributes:prefixAttr]];
    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:value attributes:valueAttr]];
    return attrString;
}

@end

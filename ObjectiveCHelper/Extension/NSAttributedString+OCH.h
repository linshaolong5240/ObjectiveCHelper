//
//  NSAttributedString+Extension.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (OCH)

+ (NSAttributedString *)attributedStringWithLabel:(NSString *)label labelFont:(UIFont *)labelFont labelColor:(UIColor *)labelColor value:(NSString *)value valueFont:(UIFont *)valueFont valueColor:(UIColor *)valueColor;

@end

NS_ASSUME_NONNULL_END

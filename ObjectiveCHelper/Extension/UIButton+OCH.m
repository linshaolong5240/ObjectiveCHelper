//
//  UIButton+OCH.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/21.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIButton+OCH.h"

@implementation UIButton (OCH)

- (void)alignVerticalImageTextWithSpacing:(CGFloat)spacing {
    if (!self.imageView) {
        return;
    }
    if (!self.titleLabel) {
        return;
    }
    if (!self.titleLabel.text) {
        return;
    }
    CGSize titleSize;
    NSDictionary *attr = @{
        NSFontAttributeName: self.titleLabel.font,
    };
    titleSize = [self.titleLabel.text sizeWithAttributes:attr];
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0, 0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(spacing, -self.imageView.frame.size.width, -self.imageView.frame.size.height, 0);
}

- (void)alignVerticalImageText {
    [self alignVerticalImageTextWithSpacing:6];
}


@end

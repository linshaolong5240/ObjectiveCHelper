//
//  UIStackView+OUIKit.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/2.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "UIStackView+OUIKit.h"

@implementation UIStackView (OUIKit)

+ (UIStackView *)stackWithArrangedView:(NSArray<__kindof UIView *> *)views axis:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:views];
    stackView.axis = axis;
    stackView.spacing = spacing;
    stackView.distribution = distribution;
    return stackView;
}

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    return [YIMStackView stackWithArrangedView:views axis:UILayoutConstraintAxisVertical spacing:spacing distribution:distribution];
}

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing {
    return [YIMStackView hstackWithArrangedView:views spacing:spacing distribution:UIStackViewDistributionFill];
}

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views {
    return [YIMStackView hstackWithArrangedView:views spacing:0];
}

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    return [YIMStackView stackWithArrangedView:views axis:UILayoutConstraintAxisVertical spacing:spacing distribution:distribution];
}

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing {
    return [YIMStackView vstackWithArrangedView:views spacing:spacing distribution:UIStackViewDistributionFill];
}

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views {
    return [YIMStackView vstackWithArrangedView:views spacing:0];
}

@end

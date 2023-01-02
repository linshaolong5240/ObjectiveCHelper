//
//  UIStackView+OUIKit.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/2.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "UIStackView+OUIKit.h"

@implementation UIStackView (OUIKit)

+ (instancetype)stackWithArrangedView:(NSArray<__kindof UIView *> *)views axis:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:views];
    stackView.axis = axis;
    stackView.spacing = spacing;
    stackView.distribution = distribution;
    return stackView;
}

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    return [UIStackView stackWithArrangedView:views axis:UILayoutConstraintAxisVertical spacing:spacing distribution:distribution];
}

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing {
    return [UIStackView hstackWithArrangedView:views spacing:spacing distribution:UIStackViewDistributionFill];
}

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views {
    return [UIStackView hstackWithArrangedView:views spacing:0];
}

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution {
    return [UIStackView stackWithArrangedView:views axis:UILayoutConstraintAxisVertical spacing:spacing distribution:distribution];
}

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing {
    return [UIStackView vstackWithArrangedView:views spacing:spacing distribution:UIStackViewDistributionFill];
}

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views {
    return [UIStackView vstackWithArrangedView:views spacing:0];
}

@end

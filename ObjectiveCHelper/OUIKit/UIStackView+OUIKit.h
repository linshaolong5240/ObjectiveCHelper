//
//  UIStackView+OUIKit.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/2.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStackView (OUIKit)

+ (UIStackView *)stackWithArrangedView:(NSArray<__kindof UIView *> *)views axis:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing;

+ (UIStackView *)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views;

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing;

+ (UIStackView *)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views;

@end

NS_ASSUME_NONNULL_END

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

+ (instancetype)stackWithArrangedView:(NSArray<__kindof UIView *> *)views axis:(UILayoutConstraintAxis)axis spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing;

+ (instancetype)hstackWithArrangedView:(NSArray<__kindof UIView *> *)views;

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing distribution:(UIStackViewDistribution)distribution;

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views spacing:(CGFloat)spacing;

+ (instancetype)vstackWithArrangedView:(NSArray<__kindof UIView *> *)views;

@end

NS_ASSUME_NONNULL_END

//
//  OCHLinearGradientView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/13.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OCHLinearGradientPostion) {
    OCHLinearGradientPostionTop,
    OCHLinearGradientPostionBottom,
    OCHLinearGradientPostionLeft,
    OCHLinearGradientPostionRight,
    OCHLinearGradientPostionTopLeft,
    OCHLinearGradientPostionTopRight,
    OCHLinearGradientPostionBottomLeft,
    OCHLinearGradientPostionBottomRight,
};

@interface OCHLinearGradientView : UIView

@property(nonatomic, readonly) CAGradientLayer *gradientLayer;

@property(nonatomic, assign) OCHLinearGradientPostion start;

@property(nonatomic, assign) OCHLinearGradientPostion end;

@property(nonatomic, copy) NSArray<UIColor *> *colors;

@property(nonatomic, copy) NSArray<NSNumber *> *locations;

- (instancetype)initWithFrame:(CGRect)frame start:(OCHLinearGradientPostion)start end:(OCHLinearGradientPostion)end colors:(nullable NSArray<UIColor *> *)colors locations:(nullable NSArray<NSNumber *> *)locations;

@end

NS_ASSUME_NONNULL_END

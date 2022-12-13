//
//  OCHLinearGradientView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/13.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHLinearGradientView.h"

CGPoint CGPointFrom(OCHLinearGradientPostion position) {
    switch (position) {
        case OCHLinearGradientPostionTop:
            return CGPointMake(0.5, 0);
            break;
        case OCHLinearGradientPostionBottom:
            return CGPointMake(0.5, 1.0);
            break;
        case OCHLinearGradientPostionLeft:
            return CGPointMake(0, 0.5);
            break;
        case OCHLinearGradientPostionRight:
            return CGPointMake(1.0, 0.5);
            break;
        case OCHLinearGradientPostionTopLeft:
            return CGPointMake(0.0, 0.0);
            break;
        case OCHLinearGradientPostionTopRight:
            return CGPointMake(1.0, 0.0);
            break;
        case OCHLinearGradientPostionBottomLeft:
            return CGPointMake(0.0, 1.0);
            break;
        case OCHLinearGradientPostionBottomRight:
            return CGPointMake(1.0, 1.0);
            break;
    }
}

@implementation OCHLinearGradientView

- (instancetype)initWithFrame:(CGRect)frame start:(OCHLinearGradientPostion)start end:(OCHLinearGradientPostion)end colors:(nullable NSArray<UIColor *> *)colors locations:(nullable NSArray<NSNumber *> *)locations {
    self = [super initWithFrame:frame];
    if (self) {
        _gradientLayer = [[CAGradientLayer alloc] init];
        _start = start;
        _end = end;
        _colors = colors;
        _locations = locations;
        [self configureView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame start:(OCHLinearGradientPostionTopLeft) end:(OCHLinearGradientPostionBottomRight) colors:nil locations:nil];
    if (self) {
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

- (void)configureView {
    self.gradientLayer.colors = [[self.colors.rac_sequence map:^id _Nullable(UIColor * _Nullable value) {
        return (id)value.CGColor;
    }] array];
    self.gradientLayer.locations = self.locations;
    self.gradientLayer.startPoint = CGPointFrom(self.start);
    self.gradientLayer.endPoint = CGPointFrom(self.end);
    [self.layer addSublayer:self.gradientLayer];
}

@end

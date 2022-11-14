//
//  OMKBaiduAnnotationContainerView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduAnnotationContainerView.h"
#import "OMKAnnotationView.h"

@interface OMKBaiduAnnotationContainerView ()

@property(nonatomic, strong) OMKAnnotationView *omkAnnotationView;

@end

@implementation OMKBaiduAnnotationContainerView

- (instancetype)initWithView:(__kindof OMKAnnotationView *)view {
    self = [super initWithAnnotation:(id<BMKAnnotation>)view.annotation reuseIdentifier:view.annotation.reuseViewIdentifier];
    if (self) {
        _omkAnnotationView = view;
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
#if DEBUG
    NSLog(@"OMKBaiduAnnotationView frame: %@", NSStringFromCGRect(self.frame));
    NSLog(@"OMK:%@", NSStringFromCGRect(self.omkAnnotationView.frame));
#endif
}

- (void)setupView {
    self.bounds = self.omkAnnotationView.frame;
    [self addSubview:self.omkAnnotationView];
}

@end

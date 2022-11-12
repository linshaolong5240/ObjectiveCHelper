//
//  OMKTencentPointAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKTencentPointAnnotationView.h"
#import "OMKAnnotationView.h"

@interface OMKTencentPointAnnotationView ()

@property(nonatomic, strong) OMKAnnotationView *omkAnnotationView;

@end

@implementation OMKTencentPointAnnotationView

- (instancetype)initWithView:(__kindof OMKAnnotationView *)view {
    self = [super initWithAnnotation:(id<QAnnotation>)view.annotation reuseIdentifier:view.annotation.reuseIdentifier];
    if (self) {
        _omkAnnotationView = view;
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
#if DEBUG
    NSLog(@"OMKTencentAnnotationView frame: %@", NSStringFromCGRect(self.frame));
    NSLog(@"OMK frame:%@", NSStringFromCGRect(self.omkAnnotationView.frame));
#endif
}

- (void)setupView {
    self.bounds = self.omkAnnotationView.frame;
    [self addSubview:self.omkAnnotationView];
}

@end

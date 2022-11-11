//
//  OMKBaiduPointAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduPointAnnotationView.h"
#import "OMKBaiduPointAnnotation.h"
#import "OMKAnnotationView.h"

@interface OMKBaiduPointAnnotationView ()

@property(nonatomic, strong) OMKAnnotationView *omkAnnotationView;

@end

@implementation OMKBaiduPointAnnotationView

- (instancetype)initWithView:(__kindof OMKAnnotationView *)view annotation:(id <BMKAnnotation>)annotation {
    self = [super initWithAnnotation:annotation reuseIdentifier:view.reuseIdentifier];
    if (self) {
        _omkAnnotationView = view;
        [self configureView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
#if DEBUG
    NSLog(@"OMKBaiduAnnotationView: %@", NSStringFromCGRect(self.frame));
    NSLog(@"omk:%@", NSStringFromCGRect(self.omkAnnotationView.frame));
#endif
}

- (void)configureView {
    self.frame = self.omkAnnotationView.bounds;
    [self addSubview:self.omkAnnotationView];
//    self.backgroundColor = UIColor.greenColor;
//    self.frame = CGRectMake(0, 0, 100, 100);
}

@end

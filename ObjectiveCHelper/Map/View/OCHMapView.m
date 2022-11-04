//
//  OCHMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHMapView.h"
#import "OCHAMapView.h"
#import "OCHBaiduMapView.h"
#import "OCHTencentMapView.h"

typedef NS_ENUM(NSUInteger, OCHMapUserTrackingMode) {
    OCHMapUserTrackingModeNone,                    ///< 不追踪用户的location更新
    OCHMapUserTrackingModeLocation,                ///< 追踪用户的location更新
    OCHMapUserTrackingModeLocationWithHeading,     ///< 追踪用户的location与heading更新
};

@interface OCHMapView ()

@property(nonatomic, strong) id<OCHMapSource> source;

@end

@implementation OCHMapView

- (instancetype)initWithFrame:(CGRect)frame mapProvider:(OCHMapProvider) provider {
    self = [super initWithFrame:frame];
    if (self) {
        _provider = provider;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    switch (self.provider) {
        case OCHMapProviderAMap:
            self.source = [[OCHAMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderBaidu:
            self.source = [[OCHBaiduMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderTencent:
            self.source = [[OCHTencentMapView alloc] initWithFrame:self.bounds];
            break;
        default:
            break;
    }
    [self addSubview:self.source.mapSourceView];
}

@end

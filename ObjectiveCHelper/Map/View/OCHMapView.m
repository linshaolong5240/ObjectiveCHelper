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
    id<OCHMapViewSource> mapViewSource;
    switch (self.provider) {
        case OCHMapProviderAMap:
            mapViewSource = [[OCHAMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderBaidu:
            mapViewSource = [[OCHBaiduMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderTencent:
            mapViewSource = [[OCHTencentMapView alloc] initWithFrame:self.bounds];
            break;
        default:
            break;
    }
    [self addSubview:mapViewSource.mapSourceView];
}

@end

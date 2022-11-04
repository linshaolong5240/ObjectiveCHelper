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

@property(nonatomic, strong) id<OCHMapProvider> provider;

@end

@implementation OCHMapView

- (instancetype)initWithFrame:(CGRect)frame providerType:(OCHMapProviderType) providerType {
    self = [super initWithFrame:frame];
    if (self) {
        _providerType = providerType;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    switch (self.providerType) {
        case OCHMapProviderTypeAMap:
            self.provider = [[OCHAMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderTypeBaidu:
            self.provider = [[OCHBaiduMapView alloc] initWithFrame:self.bounds];
            break;
        case OCHMapProviderTypeTencent:
            self.provider = [[OCHTencentMapView alloc] initWithFrame:self.bounds];
            break;
        default:
            break;
    }
    [self addSubview:self.provider.providerView];
}

@end

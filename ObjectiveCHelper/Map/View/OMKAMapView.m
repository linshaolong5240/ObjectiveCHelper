//
//  OMKAMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapView.h"
#import <MAMapKit/MAMapKit.h>

@interface OMKAMapView () <MAMapViewDelegate>

@property(nonatomic, strong) MAMapView *mapView;

@end

@implementation OMKAMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.mapView];
}

#pragma mark - OCHMapProvider

- (BOOL)showsUserLocation {
    return self.mapView.showsUserLocation;
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation {
    self.mapView.showsUserLocation = showsUserLocation;
}

- (void)setUserTrackingMode:(OMKUserTrackingMode)userTrackingMode {
    _userTrackingMode = userTrackingMode;
    switch (userTrackingMode) {
        case OCHMapUserTrackingModeNone:
            self.mapView.userTrackingMode = MAUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            self.mapView.userTrackingMode = MAUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            self.mapView.userTrackingMode = MAUserTrackingModeFollowWithHeading;
            break;
        default:
            break;
    }
}

#pragma mark - Getter / Setter

- (MAMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
    }
    return _mapView;
}


@end

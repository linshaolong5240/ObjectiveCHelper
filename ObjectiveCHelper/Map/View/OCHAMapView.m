//
//  OCHAMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHAMapView.h"
#import <MAMapKit/MAMapKit.h>

@interface OCHAMapView () <MAMapViewDelegate>

@property(nonatomic, strong) MAMapView *mapView;

@end

@implementation OCHAMapView

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

#pragma mark - OCHMapViewSource

- (UIView *)mapSourceView {
    return self;
}

#pragma mark - Getter / Setter

- (MAMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:self.bounds];
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
        _mapView.delegate = self;
    }
    return _mapView;
}


@end

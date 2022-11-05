//
//  OCHTencentMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHTencentMapView.h"
#import <QMapKit/QMapKit.h>

@interface OCHTencentMapView () <QMapViewDelegate>

@property(nonatomic, strong) QMapView *mapView;

@end

@implementation OCHTencentMapView

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

- (UIView *)providerView {
    return self;
}

- (BOOL)showsUserLocation {
    return self.mapView.showsUserLocation;
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation {
    self.mapView.showsUserLocation = showsUserLocation;
}

- (void)setUserTrackingMode:(OCHMapUserTrackingMode)userTrackingMode {
    _userTrackingMode = userTrackingMode;
    switch (userTrackingMode) {
        case OCHMapUserTrackingModeNone:
            self.mapView.userTrackingMode = QUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            self.mapView.userTrackingMode = QUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            self.mapView.userTrackingMode = QUserTrackingModeFollowWithHeading;
            break;
        default:
            break;
    }
}

#pragma mark - Gettset / Setter

- (QMapView *)mapView {
    if (!_mapView) {
        _mapView = [[QMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
    }
    return _mapView;
}

#pragma mark - QMapViewDelegate

// <QMapViewDelegate>中的定位回调函数
- (void)mapViewWillStartLocatingUser:(QMapView *)mapView
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)mapViewDidStopLocatingUser:(QMapView *)mapView
{
    NSLog(@"%s", __FUNCTION__);
}

/**
 * @brief 用户位置更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 新的用户位置
 * @param fromHeading 是否为heading 变化触发，如果为location变化触发,则为NO
 */
- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading
{
    NSLog(@"%s fromHeading = %d, location = %@, heading = %@", __FUNCTION__, fromHeading, userLocation.location, userLocation.heading);
}

/**
 * @brief  定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(QMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"%s error = %@", __FUNCTION__, error);
}

/**
 * @brief 定位时的userTrackingMode 改变时delegate调用此函数
 * @param mapView 地图View
 * @param mode QMUserTrackingMode
 * @param animated 是否有动画
 */
- (void)mapView:(QMapView *)mapView didChangeUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated
{
    NSLog(@"%s mode = %ld, animated = %d", __FUNCTION__, (long)mode, animated);
}

@end

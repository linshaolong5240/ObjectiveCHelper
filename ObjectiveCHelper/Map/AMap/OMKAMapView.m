//
//  OMKAMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapView.h"
#import <MAMapKit/MAMapKit.h>
//OMK Support
#import "OMKAMapAnnotationContainerView.h"

MAUserTrackingMode MAUserTrackingModeFromOMKUserTrackingMode(OMKUserTrackingMode mode) {
    switch (mode) {
        case OCHMapUserTrackingModeNone:
            return MAUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            return MAUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            return MAUserTrackingModeFollowWithHeading;
            break;
    }
}

OMKUserTrackingMode OMKUserTrackingModeFromMAUserTrackingMode(MAUserTrackingMode mode) {
    switch (mode) {
        case MAUserTrackingModeNone:
            return OCHMapUserTrackingModeNone;
            break;
        case MAUserTrackingModeFollow:
            return OCHMapUserTrackingModeFollow;
            break;
        case MAUserTrackingModeFollowWithHeading:
            return OCHMapUserTrackingModeFollowWithHeading;
            break;
    }
}


@interface OMKAMapView () <MAMapViewDelegate>

@property(nonatomic, strong) MAMapView *mapView;
@property(nonatomic, strong) MAPointAnnotation *userLocationAnnotation;

@end

@implementation OMKAMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
        
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.mapView];
}

#pragma mark - MAMapViewDelegate - Location

/**
 * @brief 在地图View将要启动定位时，会调用此函数
 * @param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(MAMapView *)mapView {
    
}

/**
 * @brief 在地图View停止定位后，会调用此函数
 * @param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(MAMapView *)mapView {
    
}

/**
 * @brief 位置或者设备方向更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 用户定位信息(包括位置与设备方向等数据)
 * @param updatingLocation 标示是否是location数据更新, YES:location数据更新 NO:heading数据更新
 */
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    //    if (!_userLocationAnnotation) {
    //        _userLocationAnnotation = [[MAPointAnnotation alloc] init];
    //        _userLocationAnnotation.title = @"title";
    //        _userLocationAnnotation.subtitle = @"subtitle";
    //        [mapView addAnnotation:_userLocationAnnotation];
    //    }
    //    self.userLocationAnnotation.coordinate = userLocation.coordinate;
}

/**
 *  @brief 当plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription，并且[CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined，会调用代理的此方法。
 此方法实现调用后台权限API即可（ 该回调必须实现 [locationManager requestAlwaysAuthorization] ）; since 6.8.0
 *  @param locationManager  地图的CLLocationManager。
 */
- (void)mapViewRequireLocationAuth:(CLLocationManager *)locationManager {
    
}

/**
 * @brief 定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error {
    
}

#pragma mark - QMapViewDelegate - Annotation

/**
 * @brief 根据anntation生成对应的View。
 
 注意：
 1、5.1.0后由于定位蓝点增加了平滑移动功能，如果在开启定位的情况先添加annotation，需要在此回调方法中判断annotation是否为MAUserLocation，从而返回正确的View。
 if ([annotation isKindOfClass:[MAUserLocation class]]) {
 return nil;
 }
 
 2、请不要在此回调中对annotation进行select和deselect操作，此时annotationView还未添加到mapview。
 
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAUserLocation class]]) {
        return nil;
    } else if ([annotation isKindOfClass:[OMKAMapPointAnnotation class]]) {
        OMKAMapPointAnnotation *omkAnnotation = (OMKAMapPointAnnotation *)annotation;
        //dequeueReusableAnnotationViewWithIdentifier
        OMKAMapAnnotationContainerView *annotationView = (OMKAMapAnnotationContainerView *)[mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            OMKAnnotationView *view = [self.delegate mapView:self viewForAnnotation:omkAnnotation];
            annotationView = [[OMKAMapAnnotationContainerView alloc] initWithView:view];
            annotationView.canShowCallout = NO;
        }
        return annotationView;
    }
    return nil;
}

- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)]) {
        [self.delegate mapView:self didChangeUserTrackingMode:OMKUserTrackingModeFromMAUserTrackingMode(mode) animated:animated];
    }
}

#pragma mark - OMKMapProvider

- (BOOL)showsUserLocation {
    return self.mapView.showsUserLocation;
}

- (void)setShowsUserLocation:(BOOL)showsUserLocation {
    self.mapView.showsUserLocation = showsUserLocation;
}

- (void)setUserTrackingMode:(OMKUserTrackingMode)userTrackingMode {
    _userTrackingMode = userTrackingMode;
    self.mapView.userTrackingMode = MAUserTrackingModeFromOMKUserTrackingMode(userTrackingMode);
}

- (void)addAnnotation:(id<OMKAnnotation, MAAnnotation>)annotation {
    [self.mapView addAnnotation:annotation];
}

- (void)removeAnnotation:(id<OMKAnnotation, MAAnnotation>)annotation {
    NSUInteger index;
    
    index = [self.mapView.annotations indexOfObjectPassingTest:^BOOL(id<MAAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == annotation) {
#if DEBUG
            NSLog(@"%@", @(idx));
#endif
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    if (index != NSNotFound) {
        id<MAAnnotation> amapAnnotation = self.mapView.annotations[index];
        [self.mapView removeAnnotation:amapAnnotation];
    }
}

@end

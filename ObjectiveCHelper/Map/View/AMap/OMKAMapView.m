//
//  OMKAMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapView.h"
#import <MAMapKit/MAMapKit.h>
#import "OMKAMapAnnotationView.h"

@interface OMKAMapView () <MAMapViewDelegate>

@property(nonatomic, strong) MAMapView *mapView;
@property(nonatomic, strong) MAPointAnnotation *userLocationAnnotation;

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

#pragma mark - Getter / Setter

- (MAMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
    }
    return _mapView;
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
    }
}

- (void)addAnnotation:(OMKPointAnnotation *)annotation {
    MAPointAnnotation *pointAnntation = [[MAPointAnnotation alloc] init];
    pointAnntation.coordinate = annotation.coordinate;
    pointAnntation.title = annotation.title;
    pointAnntation.subtitle = annotation.subtitle;
    
    [self.mapView addAnnotation:pointAnntation];
}

#pragma mark - MAMapViewDelegate

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
    } else if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAAnnotationView *annotationView = (MAAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil) {
            annotationView = [[OMKAMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        return annotationView;
    }
    return nil;
}

@end

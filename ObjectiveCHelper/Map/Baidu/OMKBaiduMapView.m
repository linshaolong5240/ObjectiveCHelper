//
//  OMKBaiduMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BMKLocationKit/BMKLocationManager.h>
//OMK Support
#import "OMKBPointAnnotationView.h"
#import "OMKBCustomerLocationAnnotationView.h"


BMKUserTrackingMode BMKUserTrackingModeFromOMKUserTrackingMode(OMKUserTrackingMode mode) {
    switch (mode) {
        case OCHMapUserTrackingModeNone:
            return BMKUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            return BMKUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            return BMKUserTrackingModeFollowWithHeading;
            break;
    }
}

OMKUserTrackingMode OMKUserTrackingModeFromBMKUserTrackingMode(BMKUserTrackingMode mode) {
    switch (mode) {
        case BMKUserTrackingModeNone:
            return OCHMapUserTrackingModeNone;
            break;
        case BMKUserTrackingModeHeading:
            return OCHMapUserTrackingModeNone;
            break;
        case BMKUserTrackingModeFollow:
            return OCHMapUserTrackingModeFollow;
            break;
        case BMKUserTrackingModeFollowWithHeading:
            return OCHMapUserTrackingModeFollowWithHeading;
            break;
    }
}

@interface OMKBaiduMapView () <BMKMapViewDelegate, BMKLocationManagerDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, strong) BMKUserLocation *userLocation; ///<当前位置对象
@property (nonatomic, strong) BMKPointAnnotation *userLocationAnnotation;
@property (nonatomic, strong) BMKLocationManager *locationManager; //定位对象
@end

@implementation OMKBaiduMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _mapView = [[BMKMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
        
        _locationManager = [[BMKLocationManager alloc] init];
        //设置定位管理类实例的代理
        _locationManager.delegate = self;
        //设定定位坐标系类型，默认为 BMKLocationCoordinateTypeGCJ02
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设定定位精度，默认为 kCLLocationAccuracyBest
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设定定位类型，默认为 CLActivityTypeAutomotiveNavigation
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //指定定位是否会被系统自动暂停，默认为NO
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        /**
         是否允许后台定位，默认为NO。只在iOS 9.0及之后起作用。
         设置为YES的时候必须保证 Background Modes 中的 Location updates 处于选中状态，否则会抛出异常。
         由于iOS系统限制，需要在定位未开始之前或定位停止之后，修改该属性的值才会有效果。
         */
        _locationManager.allowsBackgroundLocationUpdates = NO;
        /**
         指定单次定位超时时间,默认为10s，最小值是2s。注意单次定位请求前设置。
         注意: 单次定位超时时间从确定了定位权限(非kCLAuthorizationStatusNotDetermined状态)
         后开始计算。
         */
        _locationManager.locationTimeout = 10;
        
        [self configureView];
    }
    return self;
}

- (void)configureView {
    [self addSubview:self.mapView];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - BMKLocationManagerDelegate

/**
 *  @brief 为了适配app store关于新的后台定位的审核机制（app store要求如果开发者只配置了使用期间定位，则代码中不能出现申请后台定位的逻辑），当开发者在plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription时，需要在该delegate中调用后台定位api：[locationManager requestAlwaysAuthorization]。开发者如果只配置了NSLocationWhenInUseUsageDescription，且只有使用期间的定位需求，则无需在delegate中实现逻辑。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param locationManager 系统 CLLocationManager 类 。
 *  @since 1.6.0
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager doRequestAlwaysAuthorization:(CLLocationManager * _Nonnull)locationManager {
    
}

/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error {
    
}

/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error {
    if (error) {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    }
    if (!location) {
        return;
    }
    if (!self.userLocation) {
        self.userLocation = [[BMKUserLocation alloc] init];
    }
    
    //    if (!self.userLocationAnnotation) {
    //        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    //        annotation.coordinate = location.location.coordinate;
    //        annotation.title = @"北京";
    //        //副标题
    //        annotation.subtitle = @"天安门";
    //        self.userLocationAnnotation = annotation;
    //        [self.mapView addAnnotation:self.userLocationAnnotation];
    //    }
    //    self.userLocationAnnotation.coordinate = location.location.coordinate;
    
    self.userLocation.location = location.location;
    [self.mapView updateLocationData:self.userLocation];
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_DEPRECATED_WITH_REPLACEMENT("-BMKLocationManagerDidChangeAuthorization", ios(4.2, 14.0)) {
    
}

/**
 *  @brief authorizationStatus或者accuracyAuthorization有变化时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 */
- (void)BMKLocationManagerDidChangeAuthorization:(BMKLocationManager * _Nonnull)manager {
    
}

/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例。
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager {
    return YES;
}

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading {
    
}

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
     didUpdateNetworkState:(BMKLocationNetworkState)state orError:(NSError * _Nullable)error {
    
}

#pragma mark - BMKMapViewDelegate - Annotation
/// 根据anntation生成对应的View
/// @param mapView 地图View
/// @param annotation 指定的标注
/// @return 生成的标注View
- (nullable __kindof BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[OMKBPointAnnotation class]]) {
        OMKBPointAnnotation *omkAnnotation = (OMKBPointAnnotation *)annotation;
        OMKBAnnotationView *annotationView = (OMKBAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[OMKBPointAnnotationView alloc] initWithAnnotation:omkAnnotation reuseIdentifier:omkAnnotation.reuseIdentifier];
        }
        return annotationView;
    }
    else if ([annotation isKindOfClass:[OMKBCustomerLocationAnnotation class]]) {
        OMKBCustomerLocationAnnotation *omkAnnotation = (OMKBCustomerLocationAnnotation *)annotation;
        OMKBAnnotationView *annotationView = (OMKBAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[OMKBCustomerLocationAnnotationView alloc] initWithAnnotation:omkAnnotation reuseIdentifier:omkAnnotation.reuseIdentifier];
        }
        return annotationView;
    }
    
    return nil;
}

/// 当选中一个annotation views时，调用此接口
/// 当BMKAnnotation的title为nil，BMKAnnotationView的canShowCallout为NO时，不显示气泡，点击BMKAnnotationView会回调此接口。
/// 当气泡已经弹出，点击BMKAnnotationView不会继续回调此接口。
/// @param mapView 地图View
/// @param view 选中的annotation views
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    if (![self.delegate respondsToSelector:@selector(mapView:didSelectAnnotationView:)]) {
        return;
    }
    if (![view conformsToProtocol:@protocol(OMKAnnotationView)]) {
        return;
    }
    id<OMKAnnotationView> omkAnnotationView = (id<OMKAnnotationView>)view;
    [self.delegate mapView:self didSelectAnnotationView:omkAnnotationView];
    
    //OMKBaiduPointAnnotationView一直响应 @selector(mapView:didSelectAnnotationView:)
    if ([view isKindOfClass:[OMKBPointAnnotationView class]]) {
        [self.mapView deselectAnnotation:view.annotation animated:NO];
    }
}

/// 当取消选中一个annotation views时，调用此接口
/// @param mapView 地图View
/// @param view 取消选中的annotation views
- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
    if (![self.delegate respondsToSelector:@selector(mapView:didDeselectAnnotationView:)]) {
        return;
    }
    if (![view conformsToProtocol:@protocol(OMKAnnotationView)]) {
        return;
    }
    id<OMKAnnotationView> omkAnnotationView = (id<OMKAnnotationView>)view;
    [self.delegate mapView:self didDeselectAnnotationView:omkAnnotationView];
}

- (__kindof BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
    if ([overlay isKindOfClass:[BMKCircle class]]){
        BMKCircleView* circleView = [[BMKCircleView alloc] initWithOverlay:overlay];
        circleView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
        circleView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        circleView.lineWidth = 10.0;

        return circleView;
    }
    return nil;
}

/// 切换定位模式会调用此接口
/// @param mapView 地图View
/// @param mode 切换后的定位模式
- (void)mapView:(BMKMapView *)mapView didChangeUserTrackingMode:(BMKUserTrackingMode)mode {
    if (![self.delegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)]) {
        return;
    }
    [self.delegate mapView:self didChangeUserTrackingMode:OMKUserTrackingModeFromBMKUserTrackingMode(mode) animated:NO];

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
    self.mapView.userTrackingMode = BMKUserTrackingModeFromOMKUserTrackingMode(userTrackingMode);
}

- (void)addAnnotation:(id<OMKAnnotation, BMKAnnotation>)annotation {
    [self.mapView addAnnotation:annotation];
}

- (void)removeAnnotation:(id<OMKAnnotation, BMKAnnotation>)annotation {
    NSUInteger index;
    
    index = [self.mapView.annotations indexOfObjectPassingTest:^BOOL(id<BMKAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
        id<BMKAnnotation> baiduAnnotation = self.mapView.annotations[index];
        [self.mapView removeAnnotation:baiduAnnotation];
    }
}

- (void)addOverlay:(id <OMKOverlay, BMKOverlay>)overlay {
    [self.mapView addOverlay:overlay];
}

- (void)removeOverlay:(id <OMKOverlay, BMKOverlay>)overlay {
    [self.mapView removeOverlay:overlay];
}

@end

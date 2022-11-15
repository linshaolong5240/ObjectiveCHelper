//
//  OMKTencentMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKTencentMapView.h"
#import <QMapKit/QMapKit.h>
//Annotation
#import "OMKQPointAnnotationView.h"
#import "OMKQCustomerLocationAnnotationView.h"
#import "OMKQEmployeeLocationAnnotationView.h"

QUserTrackingMode QUserTrackingModeFromOMKUserTrackingMode(OMKUserTrackingMode mode) {
    switch (mode) {
        case OCHMapUserTrackingModeNone:
            return QUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            return QUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            return QUserTrackingModeFollowWithHeading;
            break;
    }
}

OMKUserTrackingMode OMKUserTrackingModeFromQUserTrackingMode(QUserTrackingMode mode) {
    switch (mode) {
        case QUserTrackingModeNone:
            return OCHMapUserTrackingModeNone;
            break;
        case QUserTrackingModeFollow:
            return OCHMapUserTrackingModeFollow;
            break;
        case QUserTrackingModeFollowWithHeading:
            return OCHMapUserTrackingModeFollowWithHeading;
            break;
    }
}

@interface OMKTencentMapView () <QMapViewDelegate>

@property(nonatomic, strong) QMapView *mapView;
@property (nonatomic, strong) QPointAnnotation *userLocationAnnotation;

@end

@implementation OMKTencentMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _mapView = [[QMapView alloc] initWithFrame:self.bounds];
        _mapView.delegate = self;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.mapView];
}

#pragma mark - QMapViewDelegate - Location

// <QMapViewDelegate>中的定位回调函数
- (void)mapViewWillStartLocatingUser:(QMapView *)mapView
{
#if DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
}

- (void)mapViewDidStopLocatingUser:(QMapView *)mapView
{
#if DEBUG
    NSLog(@"%s", __FUNCTION__);
#endif
}

/**
 * @brief 用户位置更新后，会调用此函数
 * @param mapView 地图View
 * @param userLocation 新的用户位置
 * @param fromHeading 是否为heading 变化触发，如果为location变化触发,则为NO
 */
- (void)mapView:(QMapView *)mapView didUpdateUserLocation:(QUserLocation *)userLocation fromHeading:(BOOL)fromHeading
{
#if DEBUG
    NSLog(@"%s fromHeading = %d, location = %@, heading = %@", __FUNCTION__, fromHeading, userLocation.location, userLocation.heading);
#endif
    
//    if (!self.userLocationAnnotation) {
//        self.userLocationAnnotation = [[QPointAnnotation alloc] init];
//        self.userLocationAnnotation.coordinate = userLocation.location.coordinate;
//        self.userLocationAnnotation.title = @"我的位置";
//        self.userLocationAnnotation.subtitle = @"我的位置";
//        [mapView addAnnotation:self.userLocationAnnotation];
//    }
}

/**
 * @brief  定位失败后，会调用此函数
 * @param mapView 地图View
 * @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(QMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
#if DEBUG
    NSLog(@"%s error = %@", __FUNCTION__, error);
#endif
}

#pragma mark - QMapViewDelegate - Annotation

/**
 * @brief 根据anntation生成对应的View
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id <QAnnotation>)annotation {
    if ([annotation isKindOfClass:[OMKQPointAnnotation class]]) {
        OMKQPointAnnotation *omkAnnotation = (OMKQPointAnnotation *)annotation;
        OMKQAnnotationView *annotationView = (OMKQAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[OMKQPointAnnotationView alloc] initWithAnnotation:omkAnnotation reuseIdentifier:omkAnnotation.reuseIdentifier];
        }
        return annotationView;
    }
    else if ([annotation isKindOfClass:[OMKQCustomerLocationAnnotation class]]) {
        OMKQCustomerLocationAnnotation *omkAnnotation = (OMKQCustomerLocationAnnotation *)annotation;
        OMKQAnnotationView *annotationView = (OMKQAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[OMKQCustomerLocationAnnotationView alloc] initWithAnnotation:omkAnnotation reuseIdentifier:omkAnnotation.reuseIdentifier];
        }
        return annotationView;
    }
    else if ([annotation isKindOfClass:[OMKQEmployeeLocationAnnotation class]]) {
        OMKQEmployeeLocationAnnotation *omkAnnotation = (OMKQEmployeeLocationAnnotation *)annotation;
        OMKQAnnotationView *annotationView = (OMKQAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[OMKQEmployeeLocationAnnotationView alloc] initWithAnnotation:omkAnnotation reuseIdentifier:omkAnnotation.reuseIdentifier];
        }
        return annotationView;
    }
    
    return nil;
}

/**
 * @brief  当选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 选中的annotation view
 */
- (void)mapView:(QMapView *)mapView didSelectAnnotationView:(QAnnotationView *)view {
    if (![self.delegate respondsToSelector:@selector(mapView:didSelectAnnotationView:)]) {
        return;
    }
    if (![view conformsToProtocol:@protocol(OMKAnnotationView)]) {
        return;
    }
    id <OMKAnnotationView> omkAnnotationView = (id <OMKAnnotationView>)view;
    [self.delegate mapView:self didSelectAnnotationView:omkAnnotationView];
    
    //OMKTencentPointAnnotationView一直响应 @selector(mapView:didSelectAnnotationView:)
    if ([view isKindOfClass:[OMKQPointAnnotationView class]]) {
        [self.mapView deselectAnnotation:view.annotation animated:NO];
    }
}

/**
 * @brief  当取消选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 取消选中的annotation view
 */
- (void)mapView:(QMapView *)mapView didDeselectAnnotationView:(QAnnotationView *)view {
    if (![self.delegate respondsToSelector:@selector(mapView:didDeselectAnnotationView:)]) {
        return;
    }
    if (![view conformsToProtocol:@protocol(OMKAnnotationView)]) {
        return;
    }
    id <OMKAnnotationView> omkAnnotationView = (id <OMKAnnotationView>)view;
    [self.delegate mapView:self didDeselectAnnotationView:omkAnnotationView];
}

#pragma mark - QMapViewDelegate - Overlay

- (QOverlayView *)mapView:(QMapView *)mapView viewForOverlay:(id <QOverlay>)overlay {
    if ([overlay isKindOfClass:[OMKQCircle class]])
    {
        QCircleView *circleView = [[QCircleView alloc] initWithCircle:overlay];
        circleView.lineWidth   = 3;
        circleView.strokeColor = [UIColor colorWithRed:.2 green:.1 blue:.1 alpha:.8];
        circleView.fillColor   = [[UIColor blueColor] colorWithAlphaComponent:0.2];
        
        return circleView;
    }
    
    return nil;
}

/**
 * @brief 定位时的userTrackingMode 改变时delegate调用此函数
 * @param mapView 地图View
 * @param mode QMUserTrackingMode
 * @param animated 是否有动画
 */
- (void)mapView:(QMapView *)mapView didChangeUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated {
    if (![self.delegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)]) {
        return;
    }
    [self.delegate mapView:self didChangeUserTrackingMode:OMKUserTrackingModeFromQUserTrackingMode(mode) animated:animated];
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
            self.mapView.userTrackingMode = QUserTrackingModeNone;
            break;
        case OCHMapUserTrackingModeFollow:
            self.mapView.userTrackingMode = QUserTrackingModeFollow;
            break;
        case OCHMapUserTrackingModeFollowWithHeading:
            self.mapView.userTrackingMode = QUserTrackingModeFollowWithHeading;
            break;
    }
}

- (void)addAnnotation:(id <OMKAnnotation, QAnnotation>)annotation {
    [self.mapView addAnnotation:annotation];
}

- (void)addAnnotations:(NSArray<id <OMKAnnotation, QAnnotation>> *)annotations {
    [self.mapView addAnnotations:annotations];
}

- (void)removeAnnotation:(id <OMKAnnotation, QAnnotation>)annotation {
    [self.mapView removeAnnotation:annotation];
}

- (void)removeAnnotations:(NSArray<id <OMKAnnotation, QAnnotation>> *)annotations {
    [self.mapView removeAnnotations:annotations];
}

- (void)addOverlay:(id <OMKOverlay, QOverlay>)overlay {
    [self.mapView addOverlay:overlay];
}

- (void)addOverlays:(NSArray<id <OMKOverlay, QOverlay>> *)overlays {
    [self.mapView addOverlays:overlays];
}

- (void)removeOverlay:(id <OMKOverlay, QOverlay>)overlay {
    [self.mapView removeOverlay:overlay];
}

- (void)removeOverlays:(NSArray<id <OMKOverlay, QOverlay>> *)overlays {
    [self.mapView removeOverlays:overlays];
}

@end

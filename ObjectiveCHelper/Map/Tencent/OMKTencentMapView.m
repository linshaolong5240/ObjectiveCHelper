//
//  OMKTencentMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKTencentMapView.h"
#import <QMapKit/QMapKit.h>
//OMK Support
#import "OMKTencentAnnotationContainerView.h"

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

#pragma mark - QMapViewDelegate

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
- (QAnnotationView *)mapView:(QMapView *)mapView viewForAnnotation:(id<QAnnotation>)annotation {
    if ([annotation isKindOfClass:[OMKTencentPointAnnotation class]]) {
        OMKTencentPointAnnotation *omkAnnotation = (OMKTencentPointAnnotation *)annotation;
        OMKTencentAnnotationContainerView *annotationView = (OMKTencentAnnotationContainerView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:omkAnnotation.reuseIdentifier];
        if (annotationView == nil) {
            OMKAnnotationView *view = [self.delegate mapView:self viewForAnnotation:omkAnnotation];
            annotationView = [[OMKTencentAnnotationContainerView alloc] initWithView:view];
            annotationView.canShowCallout = NO;
        }
        return annotationView;
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
    if ([self.delegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)]) {
        [self.delegate mapView:self didChangeUserTrackingMode:OMKUserTrackingModeFromQUserTrackingMode(mode) animated:animated];
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

- (void)addAnnotation:(id<OMKAnnotation, QAnnotation>)annotation {
    [self.mapView addAnnotation:annotation];
}

- (void)removeAnnotation:(id<OMKAnnotation, QAnnotation>)annotation {
    NSUInteger index;
    
    index = [self.mapView.annotations indexOfObjectPassingTest:^BOOL(id<QAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
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
        id<QAnnotation> tencentAnnotation = self.mapView.annotations[index];
        [self.mapView removeAnnotation:tencentAnnotation];
    }
}

@end

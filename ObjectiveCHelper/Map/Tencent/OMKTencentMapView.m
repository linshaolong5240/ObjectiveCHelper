//
//  OMKTencentMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKTencentMapView.h"
#import <QMapKit/QMapKit.h>
#import "OMKTencentPointAnnotationView.h"

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

/**
 * @brief 定位时的userTrackingMode 改变时delegate调用此函数
 * @param mapView 地图View
 * @param mode QMUserTrackingMode
 * @param animated 是否有动画
 */
- (void)mapView:(QMapView *)mapView didChangeUserTrackingMode:(QUserTrackingMode)mode animated:(BOOL)animated
{
#if DEBUG
    NSLog(@"%s mode = %ld, animated = %d", __FUNCTION__, (long)mode, animated);
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
    if ([annotation isKindOfClass:[QPointAnnotation class]]) {
        static NSString *annotationIdentifier = @"pointAnnotation";
        OMKTencentPointAnnotationView *pinView = (OMKTencentPointAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
        if (pinView == nil) {
            pinView = [[OMKTencentPointAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
        }
        return pinView;
    }
    return nil;
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

- (void)addAnnotation:(__kindof OMKAnnotation *)annotation {
    QPointAnnotation *pointAnnotation = [[QPointAnnotation alloc] init];
    pointAnnotation.coordinate = annotation.coordinate;
    pointAnnotation.title = annotation.title;
    pointAnnotation.subtitle = annotation.subtitle;
    
    [self.mapView addAnnotation:pointAnnotation];
}

- (void)removeAnnotation:(__kindof OMKAnnotation *)annotation {
//    NSUInteger index;
//
//    index = [self.mapView.annotations indexOfObjectPassingTest:^BOOL(id<BMKAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[QPointAnnotation class]]) {
//            QPointAnnotation *baiduAnnotation = (QPointAnnotation *)obj;
//            if (baiduAnnotation.omkAnnotation == annotation) {
//                NSLog(@"%@", @(idx));
//                *stop = YES;
//                return YES;
//            }
//        }
//        return NO;
//    }];
//
//    if (index != NSNotFound) {
//        id<BMKAnnotation> baiduAnnotation = self.mapView.annotations[index];
//        [self.mapView removeAnnotation:baiduAnnotation];
//    }
}

@end

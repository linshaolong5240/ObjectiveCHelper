//
//  OCHMapSource.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMKPointAnnotation.h"
#import "OMKPointAnnotationView.h"

typedef NS_ENUM(NSUInteger, OMKMapType) {
    OMKMapTypeAMap,
    OMKMapTypeBaidu,
    OMKMapTypeTencent,
    OMKMapTypeNumber,
};

typedef NS_ENUM(NSUInteger, OMKUserTrackingMode) {
    OCHMapUserTrackingModeNone,                 ///< 不追踪用户的location更新
    OCHMapUserTrackingModeFollow,               ///< 追踪用户的location更新
    OCHMapUserTrackingModeFollowWithHeading,    ///< 追踪用户的location与heading更新
};

NSString *NSStringFromOMKMapType(OMKMapType type);
NSString *NSStringFromOMKUserTrackingMode(OMKUserTrackingMode mode);

@protocol OMKMapViewProvider;

typedef UIView<OMKMapViewProvider> OMKMapView;

@protocol OMKMapViewDelegate <NSObject>

@required

@optional

/**
 * @brief 根据anntation生成对应的View
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (__kindof OMKAnnotationView *)mapView:(OMKMapView *)mapView viewForAnnotation:(id<OMKAnnotation>)annotation;

/**
 * @brief  当选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 选中的annotation view
 */
- (void)mapView:(OMKMapView *)mapView didSelectAnnotationView:(id<OMKAnnotationView>)view;

/**
 * @brief  当取消选中一个annotation view时，调用此接口
 * @param mapView 地图View
 * @param view 取消选中的annotation view
 */
- (void)mapView:(OMKMapView *)mapView didDeselectAnnotationView:(id<OMKAnnotationView>)view;

/**
 *  @brief 定位时的userTrackingMode 改变时delegate调用此函数
 *  @param mapView 地图View
 *  @param mode QMUserTrackingMode
 *  @param animated 是否有动画
 */
- (void)mapView:(OMKMapView *)mapView didChangeUserTrackingMode:(OMKUserTrackingMode)mode animated:(BOOL)animated;

@end

@protocol OMKMapViewProvider <NSObject>

@required
@property(nonatomic, weak) id<OMKMapViewDelegate> delegate;

@property(nonatomic, assign) BOOL showsUserLocation;
@property(nonatomic, assign) OMKUserTrackingMode userTrackingMode;

/**
 * @brief 向地图窗口添加标注，需要实现MAMapViewDelegate的-mapView:viewForAnnotation:函数来生成标注对应的View
 * @param annotation 要添加的标注
 */
- (void) addAnnotation:(id<OMKAnnotation>)annotation;

- (void) removeAnnotation:(id<OMKAnnotation>)annotation;

@optional

@end

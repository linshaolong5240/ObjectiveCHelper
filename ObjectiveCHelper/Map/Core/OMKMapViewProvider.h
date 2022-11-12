//
//  OCHMapSource.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OMKAnnotationView.h"
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

@protocol OMKMapViewProvider;

@protocol OMKMapViewDelegate <NSObject>

@required

@optional

- (__kindof OMKAnnotationView *)mapView:(UIView<OMKMapViewProvider> *)mapView viewForAnnotation:(id<OMKAnnotation>)annotation;

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

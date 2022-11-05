//
//  OCHMapSource.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, OMKMapType) {
    OMKMapTypeAMap,
    OMKMapTypeBaidu,
    OMKMapTypeTencent,
    OMKMapTypeNumber,
};

typedef NS_ENUM(NSUInteger, OCHMapUserTrackingMode) {
    OCHMapUserTrackingModeNone,                 ///< 不追踪用户的location更新
    OCHMapUserTrackingModeFollow,               ///< 追踪用户的location更新
    OCHMapUserTrackingModeFollowWithHeading,    ///< 追踪用户的location与heading更新
};

NSString *NSStringFromYCMapItem(OMKMapType type);

@protocol OCHMapViewDelegate <NSObject>

@required

@optional

@end

@protocol OMKMapViewProvider <NSObject>

@required
@property(nonatomic, weak) id<OCHMapViewDelegate> delegate;

- (UIView *)providerView;

@property(nonatomic, assign) BOOL showsUserLocation;
@property(nonatomic, assign) OCHMapUserTrackingMode userTrackingMode;

@optional

@end

NS_ASSUME_NONNULL_BEGIN



NS_ASSUME_NONNULL_END

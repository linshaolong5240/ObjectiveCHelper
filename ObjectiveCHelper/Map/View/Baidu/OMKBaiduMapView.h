//
//  OMKBaiduMapView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMKMapViewProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKBaiduMapView : UIView <OMKMapViewProvider>

@property(nonatomic, weak) id<OMKMapViewDelegate> delegate;

@property (nonatomic, assign) BOOL showsUserLocation;
@property(nonatomic, assign) OMKUserTrackingMode userTrackingMode;

@end

NS_ASSUME_NONNULL_END

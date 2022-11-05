//
//  OMKTencentMapView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMKProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKTencentMapView : UIView <OMKProvider>

@property(nonatomic, weak) id<OCHMapProviderDelegate> delegate;

@property (nonatomic, assign) BOOL showsUserLocation;
@property(nonatomic, assign) OCHMapUserTrackingMode userTrackingMode;

@end

NS_ASSUME_NONNULL_END

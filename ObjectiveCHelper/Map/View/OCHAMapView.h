//
//  OCHAMapView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCHMapProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCHAMapView : UIView <OCHMapProvider>

@property(nonatomic, weak) id<OCHMapProviderDelegate> mapProviderDeletegate;

@property (nonatomic, assign) BOOL showsUserLocation;
@property(nonatomic, assign) OCHMapUserTrackingMode userTrackingMode;

@end

NS_ASSUME_NONNULL_END

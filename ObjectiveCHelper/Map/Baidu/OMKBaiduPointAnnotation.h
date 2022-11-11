//
//  OMKBaiduPointAnnotation.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "OMKAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKBaiduPointAnnotation : BMKPointAnnotation <OMKAnnotation>

@property(nonatomic, strong) OMKAnnotation * omkAnnotation;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithAnnotation:(__kindof OMKAnnotation *) annotation NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

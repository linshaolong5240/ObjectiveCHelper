//
//  OMKBOverlay.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/14.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "OMKCircleOverlay.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKBOverlay : BMKCircle <OMKCircleOverlay>

@property (nonatomic, readonly,copy) NSString *reuseIdentifier;

@end

NS_ASSUME_NONNULL_END

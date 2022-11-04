//
//  OCHMapView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHMapView.h"

typedef NS_ENUM(NSUInteger, OCHMapSource) {
    OCHMapSourceAMap,
    OCHMapSourceBaidu,
    OCHMapSourceTencent,
};

typedef NS_ENUM(NSUInteger, OCHMapUserTrackingMode) {
    OCHMapUserTrackingModeNone,                    ///< 不追踪用户的location更新
    OCHMapUserTrackingModeLocation,                ///< 追踪用户的location更新
    OCHMapUserTrackingModeLocationWithHeading,     ///< 追踪用户的location与heading更新
};

@implementation OCHMapView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

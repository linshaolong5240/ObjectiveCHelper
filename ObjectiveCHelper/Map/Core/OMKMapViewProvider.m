//
//  OMKMapViewProvider.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKMapViewProvider.h"

NSString *NSStringFromOMKMapType(OMKMapType type) {
    switch (type) {
        case OMKMapTypeAMap:
            return @"A Map";
        case OMKMapTypeBaidu:
            return @"Baidu Map";
            break;
        case OMKMapTypeTencent:
            return @"Tencent Map";
            break;
        case OMKMapTypeNumber:
            return @"";
            break;
    }
}

NSString *NSStringFromOMKUserTrackingMode(OMKUserTrackingMode mode) {
    switch (mode) {
        case OCHMapUserTrackingModeNone:                 ///< 不追踪用户的location更新
            return @"OCHMapUserTrackingModeNone";
            break;
        case OCHMapUserTrackingModeFollow:               ///< 追踪用户的location更新
            return @"OCHMapUserTrackingModeFollow";
            break;
        case OCHMapUserTrackingModeFollowWithHeading:    ///< 追踪用户的location与heading更新
            return @"OCHMapUserTrackingModeFollowWithHeading";
            break;
    }
}

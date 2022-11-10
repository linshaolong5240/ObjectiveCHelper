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

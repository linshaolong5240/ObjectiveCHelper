//
//  OMKMapView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/5.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMKAMapView.h"
#import "OMKBaiduMapView.h"
#import "OMKTencentMapView.h"

typedef UIView<OMKMapViewProvider> OMKMapView;
typedef NSObject<OMKAnnotation> OMKPointAnnotation;
typedef NSObject<OMKCustomerLocationmAnnotation> OMKCustomerAnnotation;

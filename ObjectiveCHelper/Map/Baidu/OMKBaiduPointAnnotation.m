//
//  OMKBaiduPointAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduPointAnnotation.h"

@interface OMKBaiduPointAnnotation () <OMKAnnotationDelegate>

@end

@implementation OMKBaiduPointAnnotation

- (instancetype)initWithAnnotation:(__kindof OMKAnnotation *) annotation {
    self = [super init];
    if (self) {
        _omkAnnotation = annotation;
        _omkAnnotation.delegate = self;
        self.coordinate = annotation.coordinate;
        self.title = annotation.title;
        self.subtitle = annotation.subtitle;
    }
    
    return self;
}

- (void)annotation:(OMKAnnotation *)annotation didChangedCoordinate:(CLLocationCoordinate2D)coordinate {
    [self setCoordinate:coordinate];
}

@end

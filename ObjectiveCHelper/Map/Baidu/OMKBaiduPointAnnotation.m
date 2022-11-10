//
//  OMKBaiduPointAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduPointAnnotation.h"

@implementation OMKBaiduPointAnnotation

- (instancetype)initWithAnnotation:(id<OMKAnnotation>) annotation {
    self = [super init];
    if (self) {
        _omkAnnotation = annotation;
        self.coordinate = annotation.coordinate;
        self.title = annotation.title;
        self.subtitle = annotation.subtitle;
    }
    
    return self;
}

@end

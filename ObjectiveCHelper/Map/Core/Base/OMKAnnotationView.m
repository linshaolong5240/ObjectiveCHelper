//
//  OMKAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAnnotationView.h"
#import "OMKAnnotation.h"

@implementation OMKAnnotationView

- (instancetype)initWithAnnotation:(id<OMKAnnotation>)annotation {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _annotation = annotation;
    }
    
    return self;
}

@end

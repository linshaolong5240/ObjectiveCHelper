//
//  OMKAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAnnotation.h"

@implementation OMKAnnotation

- (instancetype)init {
    self = [super init];
    if (self) {
        _coordinate = CLLocationCoordinate2DMake(39.915, 116.404);
        _title = @"";
        _subtitle = @"";
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    [copy setCoordinate:self.coordinate];// = self.coordinate;
    [copy setTitle:self.title];
    [copy setSubtitle:self.subtitle];
    
    return copy;
}

@end

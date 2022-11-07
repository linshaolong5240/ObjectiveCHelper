//
//  OMKPointAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/5.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKPointAnnotation.h"

@implementation OMKPointAnnotation

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    [copy setCoordinate:self.coordinate];// = self.coordinate;
    [copy setTitle:self.title];
    [copy setSubtitle:self.subtitle];
    
    return copy;
}

@end

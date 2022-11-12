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

    }
    return self;
}

- (void)dealloc {
#if DEBUG
    NSLog(@"dealloc: %@, title: %@, subtitle: %@, coordinate", NSStringFromClass([self class]), self.title, self.subtitle);
#endif
}

- (id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    [copy setCoordinate:self.coordinate];
    [copy setTitle:self.title];
    [copy setSubtitle:self.subtitle];
    return copy;
}

-(NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end

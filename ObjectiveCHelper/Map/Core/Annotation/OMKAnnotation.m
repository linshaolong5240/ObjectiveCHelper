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

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate {
    _coordinate = coordinate;
    if ([self.delegate respondsToSelector:@selector(annotation:didChangedCoordinate:)]) {
        [self.delegate annotation:self didChangedCoordinate:coordinate];
    }
}

@end

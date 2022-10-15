//
//  ClassC.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import "ClassC.h"

@implementation ClassC

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    _b = [ClassB new];
    
    return self;
}

- (void)test {
    [self.b helloWorld];
}

@end

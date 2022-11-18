//
//  OCHStore.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHStore.h"

@implementation OCHStore

+ (instancetype)sharesInstance {
    static OCHStore *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[OCHStore alloc] init];
    });
    
    return shared;
}

@end

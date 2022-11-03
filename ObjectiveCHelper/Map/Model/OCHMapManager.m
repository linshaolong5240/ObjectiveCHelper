//
//  OCHMapManager.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHMapManager.h"

@implementation OCHMapManager

+ (instancetype)sharesInstance {
    static OCHMapManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OCHMapManager alloc] init];
    });
    
    return manager;
}

@end

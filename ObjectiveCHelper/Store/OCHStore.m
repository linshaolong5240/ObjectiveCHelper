//
//  OCHStore.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHStore.h"

@implementation OCHStore

static OCHStore *_sharedInstance = nil;

- (instancetype)init {
    self = [super init];
    if (self) {
        _listeners = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[OCHStore alloc] init];
    });
    
    return _sharedInstance;
}

- (void)addListener:(id<OCHStoreDelegate>)listener
{
    if (![self.listeners containsObject:listener]) {
        [self.listeners addObject:listener];
    }
}

- (void)removeListener:(id<OCHStoreDelegate>)listener
{
    if ([self.listeners containsObject:listener]) {
        [self.listeners removeObject:listener];
    }
}

@end

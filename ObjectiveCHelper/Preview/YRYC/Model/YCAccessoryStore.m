//
//  YCAccessoryStore.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import "YCAccessoryStore.h"

@implementation YCAccessoryStore

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    self.name = @"";
    self.locationString = @"";
    
    return self;
}

+ (YCAccessoryStore *)storeWithName:(NSString *)name locationString:(NSString*)locationString {
    YCAccessoryStore *store = [YCAccessoryStore new];
    if (!self) return nil;
    
    store.name = name;
    store.locationString = locationString;

    return store;
}

@end

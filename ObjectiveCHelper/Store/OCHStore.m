//
//  OCHStore.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHStore.h"

@interface OCHStore ()

@property (nonatomic, strong) NSHashTable *listeners;

@end

@implementation OCHStore

static OCHStore *_sharedInstance = nil;

// MARK: - Public

- (instancetype)init {
    self = [super init];
    if (self) {
        _listeners = [NSHashTable weakObjectsHashTable];
        _appState = [[OCHAppState alloc] init];
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

- (void)addListener:(id <OCHStoreListener>)listener {
    if (![self.listeners containsObject:listener]) {
        [self.listeners addObject:listener];
    }
}

- (void)removeListener:(id <OCHStoreListener>)listener {
    if ([self.listeners containsObject:listener]) {
        [self.listeners removeObject:listener];
    }
}

- (void)didFinishLaunch {
    self.appState.launchCount += 1;
    [self listenrsDidChangeAppState:self.appState.copy];
}

// MARK: - Private

- (void)listenrsDidChangeAppState:(OCHAppState *)state {
    for (id <OCHStoreListener> listener in self.listeners) {
        if ([listener respondsToSelector:@selector(store:didChangeAppState:)]) {
            [listener store:self didChangeAppState:state];
        }
    }
}

@end

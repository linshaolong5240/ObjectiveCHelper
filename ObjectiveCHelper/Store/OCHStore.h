//
//  OCHStore.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCHAppState.h"

NS_ASSUME_NONNULL_BEGIN

@class OCHStore;

@protocol OCHStoreListener <NSObject>

@optional

- (void)store:(OCHStore*)store didChangeAppState:(OCHAppState *)state;

@end

@interface OCHStore : NSObject

@property (nonatomic, readonly, strong) OCHAppState *appState;

+ (instancetype)sharedInstance;

- (void)addListener:(id<OCHStoreListener>)listener;
- (void)removeListener:(id<OCHStoreListener>)listener;
- (void)didFinishLaunch;

@end

NS_ASSUME_NONNULL_END

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

@protocol OCHStoreDelegate <NSObject>

@optional

@end

@interface OCHStore : NSObject

@property (nonatomic, strong) NSHashTable *listeners;

@property (nonatomic, readonly, strong) OCHAppState *appState;

+ (instancetype)sharedInstance;

- (void)addListener:(id<OCHStoreDelegate>)listener;
- (void)removeListener:(id<OCHStoreDelegate>)listener;

- (void)didFinishLaunch;

@end

NS_ASSUME_NONNULL_END

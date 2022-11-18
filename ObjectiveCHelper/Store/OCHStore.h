//
//  OCHStore.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class OCHStore;

@protocol OCHStoreDelegate <NSObject>

@optional

@end

@interface OCHStore : NSObject

@property (nonatomic, strong) NSHashTable *listeners;

+ (instancetype)sharedInstance;

- (void)addListener:(id<OCHStoreDelegate>)listener;
- (void)removeListener:(id<OCHStoreDelegate>)listener;

@end

NS_ASSUME_NONNULL_END

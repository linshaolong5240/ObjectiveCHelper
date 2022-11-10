//
//  OMKManager.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OMKConfig;

NS_ASSUME_NONNULL_BEGIN

@interface OMKManager : NSObject

@property(nonatomic, readonly) BOOL isInit;

+ (instancetype)sharesInstance;
- (void)initWithConfig:(OMKConfig *)config;

@end

NS_ASSUME_NONNULL_END

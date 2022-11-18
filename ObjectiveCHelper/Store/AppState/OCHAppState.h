//
//  OCHAppState.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCHSetting.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCHAppState : NSObject

@property(nonatomic, assign) NSInteger launchCount;
@property(nonatomic, readonly, assign) BOOL isFirstLaunch;
@property(nonatomic, strong) OCHSetting *setting;

@end

NS_ASSUME_NONNULL_END

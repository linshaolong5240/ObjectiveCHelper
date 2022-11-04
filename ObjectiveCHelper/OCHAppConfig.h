//
//  OCHAppConfig.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHAppConfig : NSObject

+ (NSString *)aMapKey;
+ (NSString *)baiduMapKey;
+ (NSString *)tencentMapKey;

@end

NS_ASSUME_NONNULL_END

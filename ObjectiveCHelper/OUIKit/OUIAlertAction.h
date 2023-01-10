//
//  OUIAlertAction.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OUIAlertAction : NSObject <NSCopying>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) UIAlertActionStyle style;

@property (nullable, nonatomic, copy) void (^handler)(OUIAlertAction *action);

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(OUIAlertAction *action))handler;

@end

NS_ASSUME_NONNULL_END

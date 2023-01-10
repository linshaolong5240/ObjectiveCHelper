//
//  OUIAlertAction.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIAlertAction.h"

@implementation OUIAlertAction

- (instancetype)initWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^ __nullable)(OUIAlertAction *action))handler {
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
        _handler = handler;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithTitle:nil style:(UIAlertActionStyleDefault) handler:nil];
    if (self) {
        
    }
    return self;
}

+ (instancetype)actionWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(OUIAlertAction *action))handler {
    OUIAlertAction *action = [[OUIAlertAction alloc] initWithTitle:title style:style handler:handler];
    return action;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    OUIAlertAction *object = [[self class] allocWithZone:zone];
    object.title = self.title;
    object.style = self.style;
    object.handler = self.handler;
    return object;
}

@end

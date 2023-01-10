//
//  OUITextSwitchTableViewCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITextSwitchTableViewCellData.h"

@implementation OUITextSwitchTableViewCellData

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on selector:(SEL)selector {
    self = [super initWithSelector:selector];
    if (self) {
        _title = title;
        _on = on;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on {
    self = [super init];
    if (self) {
        _title = title;
        _on = on;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithTitle:@"" on:NO];
    if (self) {
        
    }
    return self;
}

+ (instancetype)dataWithTitle:(NSString *)title on:(BOOL)on selector:(SEL)selector {
    OUITextSwitchTableViewCellData *data = [[OUITextSwitchTableViewCellData alloc] initWithTitle:title on:on selector:selector];
    return data;
}

+ (instancetype)dataWithTitle:(NSString *)title on:(BOOL)on {
    OUITextSwitchTableViewCellData *data = [[OUITextSwitchTableViewCellData alloc] initWithTitle:title on:on];
    return data;
}

@end

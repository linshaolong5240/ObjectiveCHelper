//
//  OUILabelSwitchTableViewCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelSwitchTableViewCellData.h"

@implementation OUILabelSwitchTableViewCellData

- (instancetype)initWithText:(NSString *)text on:(BOOL)on selector:(SEL)selector {
    self = [super initWithSelector:selector];
    if (self) {
        _text = text;
        _on = on;
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text on:(BOOL)on {
    self = [super init];
    if (self) {
        _text = text;
        _on = on;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithText:@"" on:NO];
    if (self) {
        
    }
    return self;
}

+ (instancetype)dataWithText:(NSString *)text on:(BOOL)on selector:(SEL)selector {
    OUILabelSwitchTableViewCellData *data = [[OUILabelSwitchTableViewCellData alloc] initWithText:text on:on selector:selector];
    return data;
}

+ (instancetype)dataWithText:(NSString *)text on:(BOOL)on {
    OUILabelSwitchTableViewCellData *data = [[OUILabelSwitchTableViewCellData alloc] initWithText:text on:on];
    return data;
}

@end

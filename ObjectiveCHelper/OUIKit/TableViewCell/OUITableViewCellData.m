//
//  OUITableViewCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellData.h"

@implementation OUITableViewCellData

- (instancetype)initWithSelector:(SEL)selector {
    self = [super init];
    if (self) {
        _selector = selector;
    }
    return self;
}

@end

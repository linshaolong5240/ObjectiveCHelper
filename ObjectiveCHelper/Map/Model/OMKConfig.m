//
//  OMKConfig.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKConfig.h"

@implementation OMKConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        _aMapKey = @"";
        _baiduMapKey = @"";
        _tencentMapKey = @"";
    }
    return self;
}

@end

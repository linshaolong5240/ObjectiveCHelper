//
//  OCHSection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHSection.h"

@implementation OCHSection

- (instancetype)initWithTitle:(nullable NSString *)title items:(nullable NSArray *)items {
    self = [super init];
    
    if (self) {
        _title = title;
        _items = items != nil ? items.mutableCopy : @[].mutableCopy;
    } else {
        return nil;
    }

    return self;
}

@end

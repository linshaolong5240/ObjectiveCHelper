//
//  OCHTableSection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHTableSection.h"

@implementation OCHTableSection

- (instancetype)initWithLabel:(nullable id)label items:(nonnull NSArray *)items {
    self = [super init];
    
    if (!self) return  nil;;
    
    _label = label;
    _items = items.mutableCopy;

    return self;
}

@end

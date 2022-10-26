//
//  OCHTableSection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHTableSection.h"

@implementation OCHTableSection

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    self.label = nil;
    self.items = [NSMutableArray array];
    
    return nil;
}

- (instancetype)initWithLabel:(nullable id)label items:(nonnull NSArray *)items {
    self = [super init];
    
    if (!self) return  nil;;
    
    self.label = label;
    self.items = items.mutableCopy;

    return self;
}

+ (instancetype)sectionWithLabel:(nullable id)label items:(nonnull NSArray *)items {
    OCHTableSection *section = [[self alloc] initWithLabel:label items:items];
    return section;
}

@end

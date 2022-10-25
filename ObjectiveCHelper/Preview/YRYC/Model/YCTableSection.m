//
//  YCTableSection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/12.
//

#import "YCTableSection.h"

@implementation YCTableSection

- (instancetype)initWithLabel:(id)label items:(NSArray *)items {
    self = [super init];
    
    if (!self) return  nil;;
    
    self.label = label;
    self.items = items.mutableCopy;

    return self;
}

+ (YCTableSection *)sectionWithLabel:(id)label items:(NSArray *)items {
    YCTableSection *section = [[YCTableSection alloc] initWithLabel:label items:items];
    return section;
}

@end

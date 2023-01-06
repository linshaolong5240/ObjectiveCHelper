//
//  OCHStringMutableArraySection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHStringMutableArraySection.h"

typedef id Element;

@implementation OCHStringMutableArraySection

- (instancetype)initWithTitle:(NSString *)title items:(NSMutableArray<Element> *)items {
    self = [super init];
    if (self) {
        _title = title;
        _items = items;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithTitle:@"" items:[NSMutableArray array]];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sectionWithTitle:(NSString *)title items:(NSMutableArray<Element> *)items {
    OCHStringMutableArraySection *section = [[OCHStringMutableArraySection alloc] init];
    section.title = title;
    section.items = items;
    return section;
}

@end

//
//  OCHStringArraySection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHStringArraySection.h"

typedef id Element;

@implementation OCHStringArraySection

- (instancetype)initWithTitle:(NSString *)title items:(NSArray<Element> *)items {
    self = [super init];
    if (self) {
        _title = title;
        _items = items;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithTitle:@"" items:@[]];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sectionWithTitle:(NSString *)title items:(NSArray<Element> *)items {
    OCHStringArraySection *section = [[OCHStringArraySection alloc] init];
    section.title = title;
    section.items = items;
    return section;
}

@end


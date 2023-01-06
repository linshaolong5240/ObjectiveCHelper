//
//  OCHIndexArraySection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHIndexArraySection.h"

typedef id Element;

@implementation OCHIndexArraySection

- (instancetype)initWithIndex:(NSInteger)index items:(NSArray<Element> *)items {
    self = [super init];
    if (self) {
        _index = index;
        _items = items;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithIndex:0 items:@[]];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sectionWithIndex:(NSInteger)index items:(NSArray<Element> *)items {
    OCHIndexArraySection *section = [[OCHIndexArraySection alloc] init];
    section.index = index;
    section.items = items;
    return section;
}

@end

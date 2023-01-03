//
//  OCHTableSection.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHTableSection.h"

typedef id Label;
typedef id Value;

@implementation OCHTableSection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.label = nil;
        self.value = nil;
    }
    
    return nil;
}

- (instancetype)initWithLabel:(nullable Label)label value:(nullable Value)value {
    self = [super init];
    if (self) {
        self.label = label;
        self.value = value;
    }
    
    return self;
}

+ (instancetype)sectionWithLabel:(nullable Label)label value:(nullable Value)value {
    OCHTableSection *section = [[self alloc] initWithLabel:label value:value];
    return section;
}

@end

typedef id Element;

@implementation OCHStringArraySection

- (instancetype)initWithLabel:(NSString *)title items:(NSArray<Element> *)items {
    self = [super init];
    if (self) {
        _title = title;
        _items = items;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithLabel:@"" items:@[]];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sectionWith:(NSString *)title items:(NSArray<Element> *)items {
    OCHStringArraySection *section = [[OCHStringArraySection alloc] init];
    section.title = title;
    section.items = items;
    return section;
}

@end

@implementation OCHStringMutableArraySection

- (instancetype)initWithLabel:(NSString *)title items:(NSMutableArray<Element> *)items {
    self = [super init];
    if (self) {
        _title = title;
        _items = items;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithLabel:@"" items:[NSMutableArray array]];
    if (self) {
        
    }
    return self;
}

+ (instancetype)sectionWith:(NSString *)title items:(NSMutableArray<Element> *)items {
    OCHStringMutableArraySection *section = [[OCHStringMutableArraySection alloc] init];
    section.title = title;
    section.items = items;
    return section;
}

@end

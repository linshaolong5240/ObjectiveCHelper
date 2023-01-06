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

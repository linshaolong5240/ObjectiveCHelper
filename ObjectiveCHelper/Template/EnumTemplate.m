//
//  EnumTemplate.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "EnumTemplate.h"

NSArray<NSNumber *> *EnumItemAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < EnumItemNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

NSString *NSStringFromEnumItem(EnumItem item) {
    switch (item) {
        case EnumItem1:
            return @"EnumItem1";
            break;
        case EnumItem2:
            return @"EnumItem2";
            break;
        case EnumItem3:
            return @"EnumItem3";
            break;
        case EnumItemNumber:
            return @"EnumItemNumber";
            break;
    }
}

//
//  EnumTemplate.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, EnumItem) {
    EnumItem1,
    EnumItem2,
    EnumItem3,
    EnumItemNumber,
};

FOUNDATION_EXPORT NSArray<NSNumber *> *EnumItemAllCases(void);

FOUNDATION_EXPORT NSString *NSStringFromEnumItem(EnumItem item);

NS_ASSUME_NONNULL_END

//
//  OUICornerType.h
//  ObjectiveCHelper
//
//  Created by Apple on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OUICornerType) {
    OUICornerTypeNone,
    OUICornerTypeAll,
    OUICornerTypeTop,
    OUICornerTypeBottom,
};

FOUNDATION_EXPORT OUICornerType OUICornerTypeForIndexInNumber(NSInteger index, NSInteger number);

NS_ASSUME_NONNULL_END

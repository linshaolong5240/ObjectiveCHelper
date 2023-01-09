//
//  OUICornerType.m
//  ObjectiveCHelper
//
//  Created by Apple on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUICornerType.h"

OUICornerType OUICornerTypeForIndexInNumber(NSInteger index, NSInteger number) {
    if (number < 1) {
        return OUICornerTypeAll;
    }
    
    if (index == 0 && number == 1) {
        return OUICornerTypeAll;
    }
    
    if (index == 0) {
        return OUICornerTypeTop;
    }
    
    if (index == (number - 1)) {
        return OUICornerTypeBottom;
    }
    return OUICornerTypeNone;
}

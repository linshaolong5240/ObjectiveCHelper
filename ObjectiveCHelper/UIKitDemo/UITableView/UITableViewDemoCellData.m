//
//  UITableViewDemoCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/26.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UITableViewDemoCellData.h"

NSString *NSStringFromUITableViewDemoCellDataStatus(UITableViewDemoCellDataStatus state) {
    switch (state) {
        case UITableViewDemoCellDataStatusOne:
            return @"state: 1";
            break;
        case UITableViewDemoCellDataStatusTwo:
            return @"state: 2";
            break;
    }
}

@implementation UITableViewDemoCellData

- (instancetype)init {
    self = [super init];
    if (self) {
        _state = UITableViewDemoCellDataStatusOne;
    }
    return self;
}


// MARK: - Getter / Setter

- (NSString *)stateString {
    return NSStringFromUITableViewDemoCellDataStatus(_state);
}

@end

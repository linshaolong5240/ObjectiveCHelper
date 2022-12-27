//
//  UITableViewDemoCellData.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/26.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UITableViewDemoCellDataStatus) {
    UITableViewDemoCellDataStatusOne,
    UITableViewDemoCellDataStatusTwo,
};

FOUNDATION_EXPORT NSString *NSStringFromUITableViewDemoCellDataStatus(UITableViewDemoCellDataStatus state);

@interface UITableViewDemoCellData : NSObject

@property(nonatomic, assign) UITableViewDemoCellDataStatus state;

@property(nonatomic, copy, readonly) NSString *stateString;


@end

NS_ASSUME_NONNULL_END

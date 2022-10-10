//
//  YCAccessoryPrecurementFilterBar.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YCAccessoryPrecurementSortType) {
    YCAccessoryPrecurementSortTypeBeg,
    YCAccessoryPrecurementSortTypeDistance = YCAccessoryPrecurementSortTypeBeg,
    YCAccessoryPrecurementSortTypePrice,
    YCAccessoryPrecurementSortTypeSales,
    YCAccessoryPrecurementSortTypeEnd,
};

NSArray<NSNumber *> * YCAccessoryPrecurementSortTypeAllItems(void);
NSString * NSStringFromYCAccessoryPrecurementSortType(YCAccessoryPrecurementSortType item);

@class YCAccessoryPrecurementFilterBar;

typedef NSArray * YCAccessoryPrecurementFilterItemProviders;

@protocol YCAccessoryPrecurementFilterBar <NSObject>

@optional

- (void)accessoryPrecurementFilterBar:(YCAccessoryPrecurementFilterBar *)accessoryPrecurementFilterBar didChangedSrot:(YCAccessoryPrecurementSortType)type increaseOrDecrease:(BOOL)isIncrease;

- (void)accessoryPrecurementFilterBar:(YCAccessoryPrecurementFilterBar *)accessoryPrecurementFilterBar didSelectedFilters:(YCAccessoryPrecurementFilterItemProviders)itemProviders;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YCAccessoryPrecurementFilterBar : UIView

@end

NS_ASSUME_NONNULL_END

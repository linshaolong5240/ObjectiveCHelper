//
//  YCAccessoryPrecurementSortButton.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YCAccessoryPrecurementSortButtonState) {
    YCAccessoryPrecurementSortButtonStateBeg,
    YCAccessoryPrecurementSortButtonStateNormal = YCAccessoryPrecurementSortButtonStateBeg,
    YCAccessoryPrecurementSortButtonStateIncrease,
    YCAccessoryPrecurementSortButtonStateDecrease,
    YCAccessoryPrecurementSortButtonStateEnd,
};

NS_ASSUME_NONNULL_BEGIN

@interface YCAccessoryPrecurementSortButton : UIButton

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, assign) YCAccessoryPrecurementSortButtonState buttonState;

- (void)updateToNextButtonState;
- (void)resetButtonState;

@end

NS_ASSUME_NONNULL_END

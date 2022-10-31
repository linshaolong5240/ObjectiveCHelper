//
//  OCHValueStepper.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/28.
//

#import <UIKit/UIKit.h>

typedef NSString *_Nonnull(^ValueStepperStringProvider)(double value);

NS_ASSUME_NONNULL_BEGIN

@interface OCHValueStepper : UIView

@property(nonatomic, assign) double value;
@property(nonatomic, assign) double minimumValue;
@property(nonatomic, assign) double maximumValue;
@property(nonatomic, assign) double stepValue;

- (instancetype)initWithFrame:(CGRect)frame valueString:(ValueStepperStringProvider)provider;

@end

NS_ASSUME_NONNULL_END

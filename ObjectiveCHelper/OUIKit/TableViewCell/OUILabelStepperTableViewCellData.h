//
//  OUILabelStepperTableViewCellData.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelStepperTableViewCellData : OUITableViewCellData

@property(nonatomic, copy) NSString *text;

@property(nonatomic) double minimumValue;

@property(nonatomic) double maximumValue;

@property(nonatomic) double stepValue;

@property(nonatomic) double value;

- (instancetype)initWithText:(NSString *)text minimumValue:(double)minimumValue maximumValue:(double)maximumValue stepValue:(double)stepValue value:(double)value;

+ (instancetype)dataWithText:(NSString *)text minimumValue:(double)minimumValue maximumValue:(double)maximumValue stepValue:(double)stepValue value:(double)value;

+ (instancetype)data;

@end

NS_ASSUME_NONNULL_END

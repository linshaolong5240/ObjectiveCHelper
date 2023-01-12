//
//  OUILabelStepperTableViewCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelStepperTableViewCellData.h"

@implementation OUILabelStepperTableViewCellData

- (instancetype)initWithText:(NSString *)text minimumValue:(double)minimumValue maximumValue:(double)maximumValue stepValue:(double)stepValue value:(double)value {
    self = [super init];
    if (self) {
        _text = text;
        _minimumValue = minimumValue;
        _maximumValue = maximumValue;
        _stepValue = stepValue;
        _value = value;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithText:@"" minimumValue:1 maximumValue:100 stepValue:0 value:0];
    if (self) {
        
    }
    return self;
}

+ (instancetype)dataWithText:(NSString *)text minimumValue:(double)minimumValue maximumValue:(double)maximumValue stepValue:(double)stepValue value:(double)value {
    OUILabelStepperTableViewCellData *data = [[OUILabelStepperTableViewCellData alloc] initWithText:text minimumValue:minimumValue maximumValue:maximumValue stepValue:stepValue value:value];
    return data;
}

+ (instancetype)data {
    OUILabelStepperTableViewCellData *data = [[OUILabelStepperTableViewCellData alloc] init];
    return data;
}

@end

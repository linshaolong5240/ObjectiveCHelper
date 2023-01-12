//
//  OUILabelStepperTableViewCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCell.h"
#import "OUILabelStepperTableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelStepperTableViewCell : OUITableViewCell

@property(nonatomic, strong, readonly) UILabel *label;

@property(nonatomic, strong, readonly) UILabel *valueLabel;

@property(nonatomic, strong, readonly) UIStepper *stepper;

@property(nonatomic, strong, readonly) OUILabelStepperTableViewCellData *data;

- (void)fillWithData:(OUILabelStepperTableViewCellData *)data;

@end

NS_ASSUME_NONNULL_END

//
//  OUILabelStepperTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelStepperTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation OUILabelStepperTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc] init];
        _valueLabel = [[UILabel alloc] init];
        _stepper = [[UIStepper alloc] init];
        [_stepper addTarget:self action:@selector(stepperOnValueChanged:event:) forControlEvents:(UIControlEventValueChanged)];
        [self configureView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureView {
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[self.label, UIView.new, self.valueLabel, self.stepper]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    hstack.spacing = 16;
    [self.containerView addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.containerView).insets(self.containerInsets);
    }];
}

- (void)stepperOnValueChanged:(UIStepper *)sender event:(UIControlEvents)event {
    [self updateValueLabelWithValue:sender.value];
    if (self.data.selector && self.selectorDelegate && [self.selectorDelegate respondsToSelector:self.data.selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.selectorDelegate performSelector:self.data.selector withObject:self];
#pragma clang diagnostic pop
    }
}

- (void)updateValueLabelWithValue:(double)value {
    self.valueLabel.text = [NSString stringWithFormat:@"%@", @(value)];
}

- (void)fillWithData:(OUILabelStepperTableViewCellData *)data {
    _data = data;
    self.label.text = data.text;
    [self updateValueLabelWithValue:data.value];
    self.stepper.minimumValue = data.minimumValue;
    self.stepper.maximumValue = data.maximumValue;
    self.stepper.stepValue = data.stepValue;
    self.stepper.value = data.value;

}

@end

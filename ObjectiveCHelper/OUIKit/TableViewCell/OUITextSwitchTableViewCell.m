//
//  OUITextSwitchTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITextSwitchTableViewCell.h"
#import <Masonry/Masonry.h>
#import "OUIColor.h"
#import "UIStackView+OUIKit.h"

@implementation OUITextSwitchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [UILabel new];
        _switcher = [UISwitch new];
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
    self.switcher.transform = CGAffineTransformMakeScale(0.75, 0.75);
    self.switcher.onTintColor = OUIColor.accentColor;
    
    [self.switcher addTarget:self action:@selector(switcherValueOnChanged:event:) forControlEvents:(UIControlEventValueChanged)];
    UIStackView *hstack = [UIStackView hstackWithArrangedView:@[self.titleLabel, self.switcher]];
    
    [self.containerView addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.containerView).insets(self.containerInsets);
    }];
}

- (void)switcherValueOnChanged:(UISwitch *)sender event:(UIControlEvents)event {
    if (self.data.selector && self.selectorDelegate && [self.selectorDelegate respondsToSelector:self.data.selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.selectorDelegate performSelector:self.data.selector withObject:self];
#pragma clang diagnostic pop
    }
}

- (void)fillWithData:(OUITextSwitchTableViewCellData *)data {
    _data = data;
    self.titleLabel.text = data.title;
    self.switcher.on = data.on;
}

@end

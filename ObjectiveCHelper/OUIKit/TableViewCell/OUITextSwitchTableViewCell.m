//
//  OUITextSwitchTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITextSwitchTableViewCell.h"
#import <Masonry/Masonry.h>
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
    UIStackView *hstack = [UIStackView hstackWithArrangedView:@[self.titleLabel, self.switcher]];
    
    [self.containerView addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.containerView).insets(self.containerInsets);
    }];
}

- (void)fillWithData:(OUITextSwitchTableViewCellData *)data {
    _data = data;
}

@end

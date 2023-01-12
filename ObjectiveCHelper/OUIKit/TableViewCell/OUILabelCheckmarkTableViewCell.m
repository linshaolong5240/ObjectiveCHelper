//
//  OUILabelCheckmarkTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/11.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelCheckmarkTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation OUILabelCheckmarkTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [UILabel new];
        _checkmark = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"checkmark.circle"] highlightedImage:[UIImage systemImageNamed:@"checkmark.circle.fill"]];
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
    NSLog(@"selected1 %@", @(selected));
    self.checkmark.highlighted = selected;
    self.data.selected = selected;
}

- (void)configureView {
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[self.label, UIView.new, self.checkmark]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    
    [self.containerView addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.containerView).insets(self.containerInsets);
    }];
}

- (void)fillWithData:(OUILabelCheckmarkTableViewCellData *)data {
    _data = data;
    self.label.text = data.text;
}

@end

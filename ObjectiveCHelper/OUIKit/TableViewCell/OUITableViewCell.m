//
//  OUITableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCell.h"
#import <Masonry/Masonry.h>
#import "OUIColor.h"

@implementation OUITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        self.contentView.backgroundColor = UIColor.clearColor;
        _dividerInsets = UIEdgeInsetsMake(0, 12, 0, 12);
        _contentInsets = UIEdgeInsetsZero;
        _containerInsets = UIEdgeInsetsMake(12, 12, 12, 12);
        _containerView = [[UIView alloc] init];
        _divider = [[UIView alloc] init];
        _cornerType = OUICornerTypeNone;
        [self setupView];
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

- (void)setupView {
    self.divider.backgroundColor = OUIColor.dividerColor;
    
    self.containerView.backgroundColor = OUIColor.panelColor;
    
    [self.containerView addSubview:self.divider];
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView).inset(self.dividerInsets.bottom);
        make.left.equalTo(self.containerView).inset(self.dividerInsets.left);
        make.right.equalTo(self.containerView).inset(self.dividerInsets.right);
        make.height.equalTo(@1);
    }];
    
    [self.contentView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView).insets(self.contentInsets);
    }];
    
    [self setCorner:self.cornerType];
}

- (void)setCorner:(OUICornerType)state {
    if (@available(iOS 11.0, *)) {
        switch (state) {
            case OUICornerTypeNone:
                self.containerView.layer.cornerRadius = 0;
                self.containerView.layer.maskedCorners = 0;
                self.containerView.layer.masksToBounds = NO;
                break;
            case OUICornerTypeAll:
                self.containerView.layer.cornerRadius = 10;
                self.containerView.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
                self.containerView.layer.masksToBounds = YES;
                break;
            case OUICornerTypeTop:
                self.containerView.layer.cornerRadius = 10;
                self.containerView.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
                self.containerView.layer.masksToBounds = YES;
                break;
            case OUICornerTypeBottom:
                self.containerView.layer.cornerRadius = 10;
                self.containerView.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
                self.containerView.layer.masksToBounds = YES;
                break;
        }
    }
}

- (void)fillWithData:(OUITableViewCellData *)data {
    _data = data;
}

- (void)setCornerTypeForIndex:(NSInteger)index inNumber:(NSInteger)number {
    [self setCornerType:OUICornerTypeForIndexInNumber(index, number)];
}

// MARK: - Getter / Setter

- (void)setDividerInsets:(UIEdgeInsets)dividerInsets {
    _dividerInsets = dividerInsets;
    [self.divider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView).inset(dividerInsets.bottom);
        make.left.equalTo(self.containerView).inset(dividerInsets.left);
        make.right.equalTo(self.containerView).inset(dividerInsets.right);
        make.height.equalTo(@1);
    }];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView).insets(contentInsets);
    }];
}

- (void)setCornerType:(OUICornerType)positionStatus {
    _cornerType = positionStatus;
    [self setCorner:positionStatus];
}


@end

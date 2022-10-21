//
//  YCAccessoryPriceInquiryOrderSupplierTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import "YCAccessoryPriceInquiryOrderSupplierTableViewCell.h"

@interface YCAccessoryPriceInquiryOrderSupplierTableViewCell ()

@property(nonatomic, strong) UIButton *checkMark;
@property(nonatomic, strong) UILabel *name;
@property(nonatomic, strong) UILabel *oemLabel;
@property(nonatomic, strong) UILabel *quality;
@property(nonatomic, strong) UILabel *warranty;

@end

@implementation YCAccessoryPriceInquiryOrderSupplierTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return  nil;
    self.checkMark = [UIButton new];
    self.checkMark.userInteractionEnabled = false;
//    self.checkMark = [UIImageView new];
    self.checkMark.contentMode = UIViewContentModeCenter;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self configureContentView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.checkMark.selected = selected;
//    self.checkMark.highlighted = selected;
}

- (void)configureContentView {
    [self.checkMark setImage:[UIImage imageNamed:@"icon_button_unselect"] forState:UIControlStateNormal];
    [self.checkMark setImage:[UIImage imageNamed:@"icon_button_select"] forState:UIControlStateSelected];
//    self.checkMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_button_unselect"] highlightedImage:[UIImage imageNamed:@"icon_button_select"]];

    UILabel *nameLabel = [UILabel new];
    nameLabel.text = @"配件名称：";
    nameLabel.textColor = UIColor.secondaryTextColor;
    nameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *qualityLabel = [UILabel new];
    qualityLabel.text = @"品 质：";
    qualityLabel.textColor = UIColor.secondaryTextColor;
    qualityLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *warrantyLabel = [UILabel new];
    warrantyLabel.text = @"质 保 期：";
    warrantyLabel.textColor = UIColor.secondaryTextColor;
    warrantyLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *accessoryName = [UILabel new];
    accessoryName.textColor = UIColor.mainTextColor;
    accessoryName.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    self.name = accessoryName;

    UILabel *quality = [UILabel new];
    quality.textColor = UIColor.mainTextColor;
    quality.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    self.quality = quality;

    UILabel *warranty = [UILabel new];
    warranty.textColor = UIColor.mainTextColor;
    warranty.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    self.warranty = warranty;
    
    UILabel *oemLabel = [UILabel new];
    oemLabel.textColor = UIColor.secondaryTextColor;
    oemLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    self.oemLabel = oemLabel;
    
    UILabel *priceWithCountLabel = [UILabel new];
    priceWithCountLabel.text = @"X 1 报价：";
    priceWithCountLabel.textColor = UIColor.secondaryTextColor;
    priceWithCountLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.text = @"￥2980.00";
    priceLabel.textColor = UIColor.mainTextColor;
    priceLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    
    UIStackView *vstack1 = [[UIStackView alloc] initWithArrangedSubviews: @[self.checkMark, UIView.new]];
    vstack1.axis = UILayoutConstraintAxisVertical;
    vstack1.spacing = 10;
    
    UIStackView *vstack2 = [[UIStackView alloc] initWithArrangedSubviews: @[nameLabel, qualityLabel, warrantyLabel]];
    vstack2.axis = UILayoutConstraintAxisVertical;
    vstack2.spacing = 10;
    vstack2.alignment = UIStackViewAlignmentTrailing;

    UIStackView *vstack3 = [[UIStackView alloc] initWithArrangedSubviews: @[accessoryName, quality, warranty]];
    vstack3.axis = UILayoutConstraintAxisVertical;
    vstack3.spacing = 10;

    UIStackView *priceStack = [[UIStackView alloc] initWithArrangedSubviews: @[priceWithCountLabel, priceLabel]];
    priceStack.axis = UILayoutConstraintAxisHorizontal;
    UIStackView *vstack4 = [[UIStackView alloc] initWithArrangedSubviews: @[oemLabel, UIView.new, priceStack]];
    vstack4.axis = UILayoutConstraintAxisVertical;
    vstack4.spacing = 10;
    vstack4.alignment = UIStackViewAlignmentTrailing;
    
    UIStackView *container = [[UIStackView alloc] initWithArrangedSubviews:@[vstack1, vstack2, vstack3, UIView.new, vstack4]];;
    container.axis = UILayoutConstraintAxisHorizontal;
    
    [self.checkMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@16);
    }];
    
    [vstack1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@34);
    }];
    
    [self.contentView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(12, 12, 12, 6));
    }];
}

- (void)updateData:(YCCarAccessory *)model {
    self.name.text = model.name;
    self.oemLabel.text = [NSString stringWithFormat:@"OEM：%@", model.oem];
    self.quality.text = model.quality;
    self.warranty.text = model.warranty;
}

@end

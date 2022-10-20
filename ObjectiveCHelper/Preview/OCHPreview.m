//
//  OCHPreview.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreview.h"
#import "YCAccessoryPriceInquirySearchView.h"

@interface OCHPreview ()

@property(nonatomic, strong) UIStackView *contentView;

@end

@implementation OCHPreview

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(!self) return nil;
    
    self.backgroundColor = UIColor.orangeColor;
    
    [self configureContentView];
    
    return self;
}

- (void)configureContentView {
    
    UILabel *label1 = [UILabel new];
    label1.text = @"11";
    UILabel *label2 = [UILabel new];
    label2.text = @"11";
    UILabel *label3 = [UILabel new];
    label3.text = @"11";
    
    UILabel *line1 = [UILabel new];
    line1.backgroundColor = UIColor.orangeColor;
    line1.text = @"1111";
    UILabel *line2 = [UILabel new];
    line2.backgroundColor = UIColor.orangeColor;
    line2.text = @"1111";
    CGFloat labelWidth = 50;
    CGFloat width = (UIScreen.mainScreen.bounds.size.width - (labelWidth * 3)) / 2;
    NSArray *labelArray =@[label1, label2, label3];
    NSArray *lineArray =@[line1, line2];

    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[label1, line1, label2, line2, label3]];
    hstack.backgroundColor = UIColor.blueColor;
    hstack.axis = UILayoutConstraintAxisHorizontal;
    hstack.distribution = UIStackViewDistributionFillProportionally;
    for(UIView *v in labelArray) {
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(10);//.priority(11);//.priorityLow();
        }];
    }
    for(UIView *v in lineArray) {
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(10).priority(9);//.priorityHigh();
        }];
    }
    
    
    [self addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
}

- (UIView *)makeStoreListRowView {
    UIView *header = [self makeStoreHeaderView];
    UIView *product1 = [self makeProductRowView];
    UIView *product2 = [self makeProductRowView];

    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[header, product1, product2]];;
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.spacing = 12;
    
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@46);
    }];
    
    UIView * container = [UIView new];
    [container addSubview:vstack];
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
    }];
    
    return container;
}

- (UIView *)makeStoreHeaderView {
    UILabel *storeNameLabel = [UILabel new];
    storeNameLabel.text = @"同城供应商（福州）";
    storeNameLabel.textColor = UIColor.mainText;
    storeNameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    
    UILabel *locationNameLabel = [UILabel new];
    locationNameLabel.text = @"区域：福建-福州-晋安区";
    locationNameLabel.textColor = UIColor.mainText;
    locationNameLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
    
    UIButton *communicationButton = [UIButton new];
    communicationButton.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    [communicationButton setTitle:@"在线沟通" forState:UIControlStateNormal];
    [communicationButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    
    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[storeNameLabel, locationNameLabel]];
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.spacing = 3;
    
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[vstack, UIView.new, communicationButton]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    
    UIView * container = [UIView new];
    container.backgroundColor = UIColor.background;
    [container addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(6, 12, 6, 12));
    }];

    return container;
}

- (UIView *)makeProductRowView {
    UIButton *checkButton = [UIButton new];
    [checkButton setImage:[UIImage imageNamed:@"icon_button_unselect"] forState:UIControlStateNormal];
    [checkButton setImage:[UIImage imageNamed:@"icon_button_select"] forState:UIControlStateSelected];

    UILabel *accessoryNameLabel = [UILabel new];
    accessoryNameLabel.text = @"配件名称：";
    accessoryNameLabel.textColor = UIColor.secondaryText;
    accessoryNameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *qualityLabel = [UILabel new];
    qualityLabel.text = @"品 质：";
    qualityLabel.textColor = UIColor.secondaryText;
    qualityLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *warrantyLabel = [UILabel new];
    warrantyLabel.text = @"质 保 期：";
    warrantyLabel.textColor = UIColor.secondaryText;
    warrantyLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *accessoryName = [UILabel new];
    accessoryName.text = @"后桥梁总成";
    accessoryName.textColor = UIColor.mainText;
    accessoryName.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *quality = [UILabel new];
    quality.text = @"品牌件";
    quality.textColor = UIColor.mainText;
    quality.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *warranty = [UILabel new];
    warranty.text = @"12个月";
    warranty.textColor = UIColor.mainText;
    warranty.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *oemLabel = [UILabel new];
    oemLabel.text = @"OEM：5174632370";
    oemLabel.textColor = UIColor.secondaryText;
    oemLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *priceWithCountLabel = [UILabel new];
    priceWithCountLabel.text = @"X 1 报价：";
    priceWithCountLabel.textColor = UIColor.secondaryText;
    priceWithCountLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.text = @"￥2980.00";
    priceLabel.textColor = UIColor.mainText;
    priceLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    
    UIStackView *vstack1 = [[UIStackView alloc] initWithArrangedSubviews: @[checkButton, UIView.new]];
    vstack1.axis = UILayoutConstraintAxisVertical;
    vstack1.spacing = 10;
    
    UIStackView *vstack2 = [[UIStackView alloc] initWithArrangedSubviews: @[accessoryNameLabel, qualityLabel, warrantyLabel]];
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
    
    [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@16);
    }];
    
    [vstack1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@34);
    }];
    return container;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

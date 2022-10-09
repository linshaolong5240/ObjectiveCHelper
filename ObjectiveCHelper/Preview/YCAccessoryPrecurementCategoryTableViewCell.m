//
//  YCAccessoryPrecurementCategoryTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/9.
//

#import "YCAccessoryPrecurementCategoryTableViewCell.h"

@interface YCAccessoryPrecurementCategoryTableViewCell ()

@property(nonatomic, assign) NSInteger productCount;

@property(nonatomic, strong) UIStackView *container;

@property(nonatomic, strong) UILabel *storeNameLabel;
@property(nonatomic, strong) UILabel *storeLocationLabel;

@property(nonatomic, strong) UIImageView *productImageView;
@property(nonatomic, strong) UILabel *productNameLabel;
@property(nonatomic, strong) UILabel *productDescriptionLabel;
@property(nonatomic, strong) UILabel *productPriceLabel;
@property(nonatomic, strong) UIStackView *productContentView;

@property(nonatomic, strong) UILabel *productCountLabel;

@end

@implementation YCAccessoryPrecurementCategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.productCount = 0;
        [self configureContentView];
    } else {
        return nil;
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

- (void)configureContentView {
    self.container = [UIStackView new];
    self.container.axis = UILayoutConstraintAxisVertical;
    self.container.spacing = 6;
    [self.contentView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).inset(12);
    }];
    
        self.storeNameLabel = [UILabel new];
        self.storeNameLabel.textColor = UIColor.blackColor;
        self.storeNameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        
        self.storeLocationLabel = [UILabel new];
        self.storeLocationLabel.textColor = UIColor.blackColor;
        self.storeLocationLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
        
        UIStackView *hstack1 = [[UIStackView alloc] initWithArrangedSubviews:@[self.storeNameLabel, UIView.new, self.storeLocationLabel]];
        hstack1.axis = UILayoutConstraintAxisHorizontal;
        [self.container addArrangedSubview:hstack1];
    
        self.productImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_default_40_40"]];
        self.productImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.productImageView.layer.borderWidth = 1;
        UIStackView *imageContainer = [[UIStackView alloc] initWithArrangedSubviews:@[self.productImageView, UIView.new]];
        imageContainer.axis = UILayoutConstraintAxisVertical;
        [self.productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(50);
        }];
        self.productContentView = [UIStackView new];
        self.productContentView.axis = UILayoutConstraintAxisVertical;
        self.productContentView.spacing = 6;
        
        UIStackView *hstack2 = [[UIStackView alloc] initWithArrangedSubviews:@[imageContainer, self.productContentView]];
        hstack2.axis = UILayoutConstraintAxisHorizontal;
        hstack2.spacing = 10;
//        hstack2.alignment = UIStackViewAlignmentTop;
        [self.container addArrangedSubview:hstack2];
        [imageContainer mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(70);
        }];

            self.productNameLabel = [UILabel new];
            self.productNameLabel.text = @"国行/大陆 美孚 美孚1号 金装 0W-";
            self.productNameLabel.textColor = UIColor.blackColor;
            self.productNameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    
            self.productDescriptionLabel = [UILabel new];
            self.productDescriptionLabel.text = @"粘度：0W-40 成分：全合成油 源产地：国行/大陆";
            self.productDescriptionLabel.textColor = UIColor.grayColor;
            self.productDescriptionLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    

            [self.productContentView addArrangedSubview:self.productNameLabel];
            [self.productContentView addArrangedSubview:self.productDescriptionLabel];
            UIView *bottomBar = [self makeBottomBar];
            [self.productContentView addArrangedSubview:bottomBar];
            [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(22);
            }];
}

- (UIView *)makeBottomBar {
    
    self.productPriceLabel = [UILabel new];
    self.productPriceLabel.text = @"¥258";
    self.productPriceLabel.textColor = UIColor.redColor;
    self.productPriceLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];

    UIButton *subButton = [UIButton new];
    [subButton setTitle:@"-" forState:UIControlStateNormal];
    [subButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    subButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    [subButton addTarget:self action:@selector(subButtonOnclicked:event:) forControlEvents:UIControlEventTouchUpInside];
    
    self.productCountLabel = [UILabel new];
    self.productCountLabel.text = [NSString stringWithFormat:@"%ld", self.productCount];
    self.productCountLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    
    UIButton *addButton = [UIButton new];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    addButton.backgroundColor = UIColor.yellowColor;
    addButton.layer.cornerRadius = 3;
    [addButton addTarget:self action:@selector(addButtonOnclicked:event:) forControlEvents:UIControlEventTouchUpInside];

    UIStackView * hstack = [[UIStackView alloc] initWithArrangedSubviews:@[subButton, self.productCountLabel, addButton]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    hstack.distribution = UIStackViewDistributionFillEqually;
    hstack.backgroundColor = UIColor.grayColor;
    hstack.layer.cornerRadius = 3;
    
    
    UIStackView *container = [[UIStackView alloc] initWithArrangedSubviews:@[self.productPriceLabel, UIView.new, hstack]];
    container.axis = UILayoutConstraintAxisHorizontal;
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(60);
    }];
    return container;
}


- (void)updateData:(NSDictionary *)dictionary {
    self.storeNameLabel.text = dictionary[@"storeName"];
    self.storeLocationLabel.text = [NSString stringWithFormat:@"区域：%@", dictionary[@"storeLocation"]];
    self.productNameLabel = dictionary[@"productName"];
}

- (void)updateCount:(NSInteger)count {
    self.productCountLabel.text = [NSString stringWithFormat:@"%ld", count];
}

-(void)subButtonOnclicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"subButtonOnclicked");
#endif
    if (self.productCount > 0) {
        self.productCount--;
        [self updateCount:self.productCount];
    }
}

-(void)addButtonOnclicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"addButtonOnclicked");
#endif
    self.productCount++;
    [self updateCount:self.productCount];
}

@end

//
//  YCAccessoryPriceInquiryOrderSupplierTableViewHeader.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import "YCAccessoryPriceInquiryOrderSupplierTableViewHeader.h"

@interface YCAccessoryPriceInquiryOrderSupplierTableViewHeader ()

@property(nonatomic, strong) UILabel *storeNameLabel;
@property(nonatomic, strong) UILabel *locationLabel;

@end

@implementation YCAccessoryPriceInquiryOrderSupplierTableViewHeader

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self configureContentView];
    
    return self;
}

- (void)configureContentView {
    UILabel *storeNameLabel = [UILabel new];
    storeNameLabel.textColor = UIColor.mainText;
    storeNameLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    self.storeNameLabel = storeNameLabel;
    
    UILabel *locationNameLabel = [UILabel new];
    locationNameLabel.textColor = UIColor.secondaryText;
    locationNameLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightRegular];
    self.locationLabel = locationNameLabel;
    
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
    container.layer.cornerRadius = 6;
    [container addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(6, 12, 6, 12));
    }];
    
    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 6, 0, 6));
    }];
}

- (void)updateData:(YCAccessoryStore *)model {
    self.storeNameLabel.text = model.name;
    self.locationLabel.text = model.locationString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

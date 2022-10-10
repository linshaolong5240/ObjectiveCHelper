//
//  YCAcccessoryPrecurementAllCategoritesCollectionViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "YCAcccessoryPrecurementAllCategoritesCollectionViewCell.h"

@implementation YCAcccessoryPrecurementAllCategoritesCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureContentView];
    }
    
    return self;
}

- (void)configureContentView {
    UIView *backgroundView = [UIView new];
    backgroundView.backgroundColor = UIColor.grayColor;
    
    UIView *selectedBackgroundView = [UIView new];
    selectedBackgroundView.backgroundColor = UIColor.whiteColor;

    self.backgroundView = backgroundView;
    self.selectedBackgroundView = selectedBackgroundView;
    
    self.textLable = [UILabel new];
    self.textLable.textColor = UIColor.blackColor;
    self.textLable.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    
    [self.contentView addSubview:self.textLable];
    [self.textLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
    }];
}

@end

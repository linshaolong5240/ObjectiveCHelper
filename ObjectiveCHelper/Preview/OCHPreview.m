//
//  OCHPreview.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreview.h"
#import "YCAccessoryPriceInquirySearchView.h"

@interface OCHPreview ()

//@property(nonatomic, strong) UIStackView *contentView;

@end

@implementation OCHPreview

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    //    self.backgroundColor = UIColor.blueColor;
    ////
    //    self.contentView = [UIStackView new];
    //    self.contentView.axis = UILayoutConstraintAxisHorizontal;
    //    self.contentView.spacing = 0;
    //    [self addSubview:self.contentView];
    //    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self);
    //    }];
    
    YCAccessoryPriceInquirySearchView *searchView = [YCAccessoryPriceInquirySearchView new];
    [searchView setRightButtonWithImageName:@"icon_scan"];
//    [searchView.rightButton setImage:[UIImage imageNamed:@"icon_scan"] forState:UIControlStateNormal];
    searchView.textField.backgroundColor = UIColor.blueColor;

    UIView *container = [UIView new];
    container.backgroundColor = UIColor.grayColor;
    container.layer.cornerRadius = 6;
    
    
    [container addSubview:searchView];
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(10, 12, 10, 12));
    }];
    
    UIView *v = container;
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

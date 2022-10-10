//
//  OCHPreview.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreview.h"
#import "YCAcccessoryPrecurementAllCategoritesView.h"

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
    
    UIView *v = [YCAcccessoryPrecurementAllCategoritesView new];
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

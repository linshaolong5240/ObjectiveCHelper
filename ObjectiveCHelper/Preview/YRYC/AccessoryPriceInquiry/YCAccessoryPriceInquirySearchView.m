//
//  YCAccessoryPriceInquirySearchView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "YCAccessoryPriceInquirySearchView.h"

@interface YCAccessoryPriceInquirySearchView ()

@property(nonatomic, strong) UIStackView *contentView;

@end

@implementation YCAccessoryPriceInquirySearchView

{
    @protected
    UIButton *_rightButton;
    UITextField *_textField;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    UIStackView *contentView = [UIStackView new];
    contentView.axis = UILayoutConstraintAxisHorizontal;
    contentView.spacing = 10;
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.contentView = contentView;
    
    [self.contentView addArrangedSubview:self.textField];
}

- (void)setRightButtonWithImageName:(NSString *)imageName {
    [self.rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.contentView addArrangedSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(20);
    }];
}

- (void)rightButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
}

//// MARK: getter / setter
- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.backgroundColor = UIColor.orangeColor;
    }

    return _textField;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton new];
        [_rightButton addTarget:self action:@selector(rightButtonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _rightButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

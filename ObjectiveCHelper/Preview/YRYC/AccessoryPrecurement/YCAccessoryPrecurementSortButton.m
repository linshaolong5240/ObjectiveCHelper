//
//  YCAccessoryPrecurementSortButton.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "YCAccessoryPrecurementSortButton.h"

@interface YCAccessoryPrecurementSortButton ()

@property(nonatomic, strong) UIStackView *contentView;
@property(nonatomic, strong) UIImageView *arrowUp;
@property(nonatomic, strong) UIImageView *arrowDown;

@end

@implementation YCAccessoryPrecurementSortButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonState = YCAccessoryPrecurementSortButtonStateNormal;
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    self.contentView = [[UIStackView alloc] init];
    self.contentView.axis = UILayoutConstraintAxisHorizontal;
    self.contentView.spacing = 6;
    self.contentView.userInteractionEnabled = NO;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
    
    self.label = [[UILabel alloc] init];
    self.label.textColor = UIColor.blackColor;
    self.label.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    
    self.arrowUp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_sort_arrow_up"] highlightedImage:[UIImage imageNamed:@"icon_arrow_up_blue"]];
    self.arrowUp.contentMode = UIViewContentModeScaleAspectFit;
    self.arrowDown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_sort_arrow_down"] highlightedImage:[UIImage imageNamed:@"icon_arrow_down_blue"]];
    self.arrowDown.contentMode = UIViewContentModeScaleAspectFit;

    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[self.arrowUp, self.arrowDown]];
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.distribution = UIStackViewDistributionFillEqually;
    vstack.spacing = 0;
    [self.contentView addArrangedSubview:self.label];
    [self.contentView addArrangedSubview:vstack];
    
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(10);
    }];
    
    [self addTarget:self action:@selector(onClicked:event:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%@ on clicked", NSStringFromClass([self class]));
#endif
}

- (void)updateButtonState:(YCAccessoryPrecurementSortButtonState)state {
    self.buttonState = state;
    switch (state) {
        case YCAccessoryPrecurementSortButtonStateNormal:
            self.selected = NO;
            self.arrowUp.highlighted = NO;
            self.arrowDown.highlighted = NO;
            break;
        case YCAccessoryPrecurementSortButtonStateIncrease:
            self.selected = YES;
            self.arrowUp.highlighted = YES;
            self.arrowDown.highlighted = NO;
            break;
        case YCAccessoryPrecurementSortButtonStateDecrease:
            self.selected = YES;
            self.arrowUp.highlighted = NO;
            self.arrowDown.highlighted = YES;
            break;
        default:
            break;
    }
}

- (void)updateToNextButtonState {
    YCAccessoryPrecurementSortButtonState state = YCAccessoryPrecurementSortButtonStateNormal;
    switch (self.buttonState) {
        case YCAccessoryPrecurementSortButtonStateNormal:
            state = YCAccessoryPrecurementSortButtonStateIncrease;
            break;
        case YCAccessoryPrecurementSortButtonStateIncrease:
            state = YCAccessoryPrecurementSortButtonStateDecrease;
            break;
        case YCAccessoryPrecurementSortButtonStateDecrease:
            state = YCAccessoryPrecurementSortButtonStateIncrease;
            break;
        default:
            break;
    }
    [self updateButtonState:state];
}

- (void)resetButtonState {
    [self updateButtonState:YCAccessoryPrecurementSortButtonStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  OCHTestView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHTestView.h"

//@interface OCHTestView ()
//
//@end
//
//@implementation OCHTestView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self configureContentView];
//    }
//    return self;
//}
//
//- (void)configureContentView {
//    self.backgroundColor = UIColor.orangeColor;
//}
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}
//*/
//
//@end

@interface OCHTestView ()
@property(nonatomic, strong) UISwitch *serverSwitch;
@property(nonatomic, strong) UISwitch *pickUpAtHomeSwitch;
@property(nonatomic, strong) UISwitch *deliveryToHomeSwitch;

//@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIStackView *contentView;

@property(nonatomic, strong) UIView *pickUpAtHomeView;
@property(nonatomic, strong) UIView *deliveryToHomeView;

@end

@implementation OCHTestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    self.backgroundColor = UIColor.blueColor;
//
//    self.scrollView = UIScrollView.new;
//    [self addSubview:self.scrollView];
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self);
//    }];
//
//    self.contentView = UIStackView.new;
//    self.contentView.axis = UILayoutConstraintAxisVertical;
//    self.contentView.spacing = 0;
//    self.contentView.backgroundColor = UIColor.orangeColor;
//    [self.scrollView addSubview:self.contentView];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(self.scrollView);
//            make.width.equalTo(self.scrollView);
//    }];
//
    self.contentView = UIStackView.new;
    self.contentView.axis = UILayoutConstraintAxisVertical;
    self.contentView.spacing = 0;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self configureHeaderView];
    [self comnfigurePickUpAtHomeView];
    [self configureDeliveryToHomeView];
}

- (void)configureHeaderView {
    UILabel *titleLable = UILabel.new;
    titleLable.text = @"取送服务";
    
    UIView *space = UIView.new;

    self.serverSwitch = UISwitch.new;
    [self.serverSwitch addTarget:self action:@selector(serverSwitchValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    UIStackView* headerView = [[UIStackView alloc] initWithArrangedSubviews:@[titleLable, space, self.serverSwitch]];
    headerView.axis = UILayoutConstraintAxisHorizontal;

    [self.contentView addArrangedSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(38);
    }];
}

- (void)comnfigurePickUpAtHomeView {
    self.pickUpAtHomeView = UIView.new;
    
    UILabel *pickUpLabel = UILabel.new;
    pickUpLabel.text = @"上门取车";
    UIView *addressPicker = UIView.new;
    addressPicker.backgroundColor = UIColor.purpleColor;
    UIView *timePicker = UIView.new;
    timePicker.backgroundColor = UIColor.purpleColor;

    UIStackView *container = [[UIStackView alloc] initWithArrangedSubviews:@[pickUpLabel, addressPicker, timePicker]];
    container.axis = UILayoutConstraintAxisVertical;
    container.distribution = UIStackViewDistributionFillEqually;
    container.spacing = 0;
    
    [self.pickUpAtHomeView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.pickUpAtHomeView).width.insets(UIEdgeInsetsMake(0, 14, 0, 6));
    }];
}

- (void)configureDeliveryToHomeView {
    self.deliveryToHomeView = UIView.new;
    UIStackView *container = UIStackView.new;
    container.axis = UILayoutConstraintAxisVertical;
    container.spacing = 0;
    container.distribution = UIStackViewDistributionFillEqually;
    [self.deliveryToHomeView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.deliveryToHomeView).with.insets(UIEdgeInsetsMake(0, 14, 0, 6));
    }];
    
    UILabel *pickUpLabel = UILabel.new;
    pickUpLabel.text = @"送车上门";
    
    self.deliveryToHomeSwitch = UISwitch.new;
    [self.deliveryToHomeSwitch addTarget:self action:@selector(deliveryToHomeSwitchValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    UIStackView *headerView = [[UIStackView alloc] initWithArrangedSubviews:@[pickUpLabel, UIView.new, self.deliveryToHomeSwitch]];
    headerView.axis = UILayoutConstraintAxisHorizontal;
    
    [container addArrangedSubview:headerView];

    UIView *addressPicker = UIView.new;
    addressPicker.backgroundColor = UIColor.purpleColor;
    UIView *timePicker = UIView.new;
    timePicker.backgroundColor = UIColor.greenColor;
    
    [container addArrangedSubview:addressPicker];
    [container addArrangedSubview:timePicker];
}

- (void)serverSwitchValueDidChange:(UISwitch *)sender {
    if (sender.isOn) {
        [self.contentView addArrangedSubview:self.pickUpAtHomeView];
        [self.contentView addArrangedSubview:self.deliveryToHomeView];
    } else {
        [self.contentView removeArrangedSubview:self.pickUpAtHomeView];
        [self.pickUpAtHomeView removeFromSuperview];
        [self.contentView removeArrangedSubview:self.deliveryToHomeView];
        [self.deliveryToHomeView removeFromSuperview];
    }
}

- (void)deliveryToHomeSwitchValueDidChange:(UISwitch *)sender {
    if (sender.isOn) {
//        [self.contentView addArrangedSubview:self.deliveryToHomeView];
    } else {
//        [self.contentView removeArrangedSubview:self.deliveryToHomeView];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

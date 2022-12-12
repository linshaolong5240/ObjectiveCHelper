//
//  UIModalPresentationStyleViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIModalPresentationStyleViewController.h"

NSString *NSStringFromUIModalPresentationStyle(UIModalPresentationStyle style) {
    switch (style) {
        case UIModalPresentationFullScreen:
            return @"UIModalPresentationFullScreen";
            break;
        case UIModalPresentationPageSheet:
            return @"UIModalPresentationPageSheet";
            break;
        case UIModalPresentationFormSheet:
            return @"UIModalPresentationFormSheet";
            break;
        case UIModalPresentationCurrentContext:
            return @"UIModalPresentationCurrentContext";
            break;
        case UIModalPresentationCustom:
            return @"UIModalPresentationCustom";
            break;
        case UIModalPresentationOverFullScreen:
            return @"UIModalPresentationOverFullScreen";
            break;
        case UIModalPresentationOverCurrentContext:
            return @"UIModalPresentationOverCurrentContext";
            break;
        case UIModalPresentationPopover:
            return @"UIModalPresentationPopover";
            break;
#if TARGET_OS_TV
        case UIModalPresentationBlurOverFullScreen:
            return @"UIModalPresentationBlurOverFullScreen";
            break;
#endif
        case UIModalPresentationNone:
            return @"UIModalPresentationNone";
            break;
        case UIModalPresentationAutomatic:
            return @"UIModalPresentationAutomatic";
            break;
    }
}

@interface UIModalPresentationStyleViewController ()

@end

@implementation UIModalPresentationStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self configureView];
}

- (void)configureView {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = NSStringFromUIModalPresentationStyle(self.modalPresentationStyle);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = UIColor.accentColor;
    button.layer.cornerRadius = 6;
    [button setTitle:@"OK" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, button]];
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.spacing = 10;
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@44);
    }];
    
    UIView *container = [[UIView alloc] init];
    [container addSubview:vstack];
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(16, 16, 16, 16));
    }];
    [self addSafeAreaBottomView:container height:(16 + 20 + 10 + 44 + 16) backgroundColor:UIColor.blueColor];
}

- (void)buttonOnClicked:(UIButton *)button event:(UIControlEvents)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

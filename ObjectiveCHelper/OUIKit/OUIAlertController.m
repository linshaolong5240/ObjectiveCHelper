//
//  OUIAlertController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIAlertController.h"

#import <Masonry/Masonry.h>
#import "OUIColor.h"

@interface OUIAlertController ()

@end

@implementation OUIAlertController

- (void)dealloc {
    NSLog(@"OUIAlertController dealloc");
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
    OUIAlertController *alertController = [OUIAlertController new];
    alertController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    alertController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    alertController.titleLabel.text = title;
    alertController.messageLabel.text = message;
    return alertController;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _actions = [NSMutableArray array];
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = OUIColor.mainTextColor;
        _titleLabel.font = [UIFont systemFontOfSize:16 weight:(UIFontWeightMedium)];

        _messageLabel = [UILabel new];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = OUIColor.secondaryTextColor;
        _messageLabel.font = [UIFont systemFontOfSize:14 weight:(UIFontWeightRegular)];
        _messageLabel.numberOfLines = 0;

        _textFields = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = OUIColor.presentedControllerBackgroundColor;
    self.view.layer.cornerRadius = 4;
    self.view.layer.masksToBounds = YES;
    [self configureView];
}

- (void)configureView {
    UIView *actionView = [self makeActionView:self.actions];
    UIView *divider = [self makeDivider];
    [actionView addSubview:divider];
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(actionView);
        make.height.equalTo(@1);
    }];
    
    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[
        ({
        UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[
            self.titleLabel,
            self.messageLabel,
        ]];
        vstack.axis = UILayoutConstraintAxisVertical;
        vstack.spacing = 16;
        UIView *container = [UIView new];
        [container addSubview:vstack];
        [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        container;
    }),
        actionView,
    ]];
    vstack.backgroundColor = OUIColor.panelColor;
    vstack.axis = UILayoutConstraintAxisVertical;
    
    [self.view addSubview:vstack];
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).inset(38);
        make.center.equalTo(self.view);
    }];
}

- (UIView *)makeActionView:(NSArray<OUIAlertAction *> *)actions {
    if (actions.count == 0) {
        OUIAlertAction *action = [OUIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(OUIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.actions addObject:action];
    }
    
    NSArray<UIButton *> *buttons = [self makeActionButtons:actions];
    
    if (buttons.count == 1) {
        UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:buttons];
        hstack.axis = UILayoutConstraintAxisHorizontal;
        hstack.distribution = UIStackViewDistributionFillEqually;
        [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@45);
        }];
        return hstack;
    }
    
    if (buttons.count == 2) {
        UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:buttons];
        hstack.axis = UILayoutConstraintAxisHorizontal;
        hstack.distribution = UIStackViewDistributionFillEqually;
        [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@45);
        }];
        
        UIView *divider = [self makeDivider];
        [hstack addSubview:divider];
        [divider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(hstack);
            make.height.equalTo(hstack);
            make.width.equalTo(@1);
        }];
        
        return hstack;
    }
    
    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:[self makeActionButtons:actions bottomDivider:YES]];
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.distribution = UIStackViewDistributionFillEqually;
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(45 * actions.count));
    }];
    return vstack;
}

- (NSArray<UIButton *> *)makeActionButtons:(NSArray<OUIAlertAction *> *)actions bottomDivider:(BOOL)divider {
    NSMutableArray<UIButton *> *buttons = [NSMutableArray array];
    for (NSInteger index = 0; index < actions.count; index++) {
        UIButton *button = [self makeButtonWithAction:actions[index]];
        button.tag = index;
        [button addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
        
        if (index != actions.count - 1) {
            UIView *divider = [self makeDivider];
            [button addSubview:divider];
            [divider mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.bottom.left.right.equalTo(button);
                            make.height.equalTo(@1);
            }];
        }
        
        [buttons addObject:button];
        

    }
    return buttons;
}

- (NSArray<UIButton *> *)makeActionButtons:(NSArray<OUIAlertAction *> *)actions {
    return [self makeActionButtons:actions bottomDivider:NO];
}

- (UIButton *)makeButtonWithAction:(OUIAlertAction *)action {
    UIButton *button = [UIButton new];
    [button setTitle:action.title forState:(UIControlStateNormal)];
    [button setTitleColor:[self buttonTitleColorForStyle:action.style] forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont systemFontOfSize:14 weight:(UIFontWeightMedium)];
    return button;
}

- (UIColor *)buttonTitleColorForStyle:(UIAlertActionStyle)style {
    switch (style) {
        case UIAlertActionStyleDefault:
            return OUIColor.accentColor;
            break;
        case UIAlertActionStyleCancel:
            return OUIColor.secondaryTextColor;
            break;
        case UIAlertActionStyleDestructive:
            return OUIColor.redColor;
            break;
    }
}

- (void)buttonOnClicked:(UIButton *)sender event:(UIControlEvents)event {
    if (self.actions[sender.tag].handler) {
        self.actions[sender.tag].handler(self.actions[sender.tag]);
        self.actions[sender.tag].handler = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *)makeDivider {
    UIView *divider = [UIView new];
    divider.backgroundColor = OUIColor.dividerColor;
    return divider;
}

- (void)addAction:(OUIAlertAction *)action {
    [self.actions addObject:action];
}

- (void)addTextFieldWithConfigurationHandler:(void (^ __nullable)(UITextField *textField))configurationHandler {
    
}

@end

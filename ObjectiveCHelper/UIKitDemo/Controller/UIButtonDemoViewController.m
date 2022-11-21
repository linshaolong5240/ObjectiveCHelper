//
//  UIButtonDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/21.
//

#import "UIButtonDemoViewController.h"

@interface UIButtonDemoViewController ()

@end

@implementation UIButtonDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIButton Demo";
    
    [self configureContentView];
}

- (void)configureContentView {
    //    self.scrollView.contentInset = UIEdgeInsetsMake(20, 0, 100, 0);
    //    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.scrollView).insets(UIEdgeInsetsMake(0, 16, 0, 16));
    //    }];
    //
    [self configureTextSymbolButton];
    [self configureButtonWithVerticalImageText];
}

- (void)configureTextSymbolButton {
    UIButton *textSymbolButton = [[UIButton alloc] init];
    [textSymbolButton setTitle:@"TextSymbolButton" forState:UIControlStateNormal];
    [textSymbolButton setTitleColor:UIColor.accentColor forState:(UIControlStateNormal)];
    if (@available(iOS 13.0, *)) {
        [textSymbolButton setImage:[UIImage systemImageNamed:@"chevron.right"] forState:UIControlStateNormal];
    }
    textSymbolButton.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
    //        textSymbolButton.titleLabel.backgroundColor = UIColor.greenColor;
    
    //不加背景色 systemImageNamed 图片显示会有问题！
    textSymbolButton.imageView.backgroundColor = UIColor.clearColor;
    
    textSymbolButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    //        textSymbolButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    [self.contentView addArrangedSubview:textSymbolButton];
    //        [textSymbolButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //                    make.height.mas_equalTo(30);
    //        }];
}

- (void)configureButtonWithVerticalImageText {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"Button" forState:(UIControlStateNormal)];
    [button setTitleColor:UIColor.accentColor forState:(UIControlStateNormal)];
    if (@available(iOS 13.0, *)) {
        [button setImage:[UIImage systemImageNamed:@"heart.fill"] forState:(UIControlStateNormal)];
    }
    [button alignVerticalImageText];
    [self.contentView addArrangedSubview:button];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

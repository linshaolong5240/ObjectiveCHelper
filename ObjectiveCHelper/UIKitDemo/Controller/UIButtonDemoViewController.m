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
}

- (void)configureTextSymbolButton {
    if (@available(iOS 13.0, *)) {
        UIButton *textSymbolButton = [[UIButton alloc] init];
        textSymbolButton.backgroundColor = UIColor.systemPinkColor;
        [textSymbolButton setTitle:@"TextSymbolButton" forState:UIControlStateNormal];
        [textSymbolButton setImage:[UIImage systemImageNamed:@"chevron.right"] forState:UIControlStateNormal];
        textSymbolButton.semanticContentAttribute = UISemanticContentAttributeForceRightToLeft;
//        textSymbolButton.titleLabel.backgroundColor = UIColor.greenColor;
        textSymbolButton.imageView.backgroundColor = UIColor.clearColor;

        textSymbolButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//        textSymbolButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [self.contentView addArrangedSubview:textSymbolButton];
//        [textSymbolButton mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.height.mas_equalTo(30);
//        }];
    }
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

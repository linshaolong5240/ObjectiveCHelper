//
//  QRCodeViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "QRCodeViewController.h"
#import "OCHQRCodeView.h"

@interface QRCodeViewController ()

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) OCHQRCodeView *qrCodeView;

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"QRCode";
    [self congifureView];
    [self updateQRCodeWithString:self.textField.text];
}

- (void)congifureView {
    UITextField *textField = [UITextField new];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.text = @"https://www.baidu.com";
    textField.placeholder = @"Message";
    self.textField = textField;
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [button setTitle:@"generate" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(generateButtonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    
    OCHQRCodeView *qrCodeView = [[OCHQRCodeView alloc] init];
    self.qrCodeView = qrCodeView;
    
    [self.contentView addArrangedSubview:textField];
    [self.contentView addArrangedSubview:button];
    [self.contentView addArrangedSubview:qrCodeView];
    [self.contentView addArrangedSubview:UIView.new];
}

- (void)updateQRCodeWithString:(NSString *)string {
    [self.qrCodeView setMessageString:string inputCorrection:(QRCodeInputCorrectionLevelM) scale:10];
}

- (void)generateButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
    if (self.textField.text.length <= 0) {
        return;
    }
    [self updateQRCodeWithString:self.textField.text];
}

@end

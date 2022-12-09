//
//  UINavigationBarDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/9.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UINavigationBarDemoController.h"

@interface UINavigationBarDemoController ()

@end

@implementation UINavigationBarDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UINavigationBar";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"back" style:(UIBarButtonItemStylePlain) target:self action:@selector(buttonOnClicked:event:)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)buttonOnClicked:(UIButton *)button event:(UIControlEvents)event {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

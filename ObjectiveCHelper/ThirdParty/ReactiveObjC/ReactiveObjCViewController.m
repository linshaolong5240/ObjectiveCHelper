//
//  ReactiveObjCViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron 2022/11/8.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "ReactiveObjCViewController.h"

@interface ReactiveObjCViewController ()

@end

@implementation ReactiveObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ReactiveObjC";
    [self configureContentView];
    NSArray *array = @[@1, @2, @3];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
}

- (void)configureContentView {
    [self configureRACButton];
}

- (void)configureRACButton {
    UIButton *racButton = [[UIButton alloc] init];
    racButton.backgroundColor = UIColor.blueColor;
    [racButton setTitle:@"RAC Button" forState:UIControlStateNormal];
    [self.contentView addArrangedSubview:racButton];
    [[racButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
    #if DEBUG
            NSLog(@"Button clicked");
    #endif
    }];
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

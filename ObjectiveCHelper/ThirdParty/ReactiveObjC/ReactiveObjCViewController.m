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
    //数组遍历
    NSArray *array = @[@1, @2, @3];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
#if DEBUG
        NSLog(@"rac sequence %@", x);
#endif
    }];
    //快速替换数组中内容
    NSArray *newArray = [[array.rac_sequence mapReplace:@"99"] array];
    NSLog(@"%@",newArray);
    NSArray *newArray2 = [[array.rac_sequence map:^id _Nullable(id  _Nullable value) {
        NSLog(@"原数组内容%@",value);
        return @"99";
    }] array];
    NSLog(@"%@",newArray2);
    
    //NSDictionary 字典遍历
    NSDictionary * dic = @{@"name":@"Tom",@"age":@"20"};
    [dic.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        RACTupleUnpack(NSString *key, NSString * value) = x;//X为为一个元祖，RACTupleUnpack能够将key和value区分开
        NSLog(@"数组内容：%@--%@",key,value);
    }];
}

- (void)configureContentView {
    [self configureRACButton];
    [self configureRACTextField];
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
    racButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
#if DEBUG
        NSLog(@"rac_command Button clicked");
#endif
        return [RACSignal empty];
    }];
}

- (void)configureRACTextField {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"placeholder";
    [self.contentView addArrangedSubview:textField];
    [textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
#if DEBUG
        NSLog(@"text field: %@", x);
#endif
    }];
    [[textField rac_signalForControlEvents:(UIControlEventEditingChanged)] subscribeNext:^(__kindof UIControl * _Nullable x) {
    #if DEBUG
            NSLog(@"text fiedl editing changed: %@", x);
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

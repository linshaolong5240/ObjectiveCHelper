//
//  ReactiveObjCDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron 2022/11/8.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "ReactiveObjCDemoViewController.h"

@interface ReactiveObjCDemoViewController ()

@property(nonatomic, assign) NSInteger number;

@end

@implementation ReactiveObjCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ReactiveObjC";
    self.number = 0;
    
    [self configureContentView];
    //数组遍历
    NSArray *array = @[@1, @2, @3];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"rac sequence %@", x);
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
    //通过定值创建RACTuple
    RACTuple *tuple = [RACTuple tupleWithObjects:@"1", @"2", @"3", nil];
    //利用 RAC 宏快速封装
    RACTuple *tuple2 = RACTuplePack(@"1", @"2", @"3");
    //从别的数组中获取内容
    RACTuple *tuple3 = [RACTuple tupleWithObjectsFromArray:@[@"1", @"2", @"3"]];
    
    NSLog(@"元组-->%@", tuple3[0]);
    NSLog(@"第一个元素-->%@", [tuple3 first]);
    NSLog(@"最后一个元素-->%@", [tuple3 last]);
    [RACObserve(self, number) subscribeNext:^(id  _Nullable x) {
        NSLog(@"number %@", x);
    }];
    
    //RACSignal
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"signal sendNext: 🍺🍺🍺🍺🍺🍺🍺");
        [subscriber sendNext:@"🍺🍺🍺🍺🍺🍺🍺"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"signal 销毁了: 🍺🍺🍺🍺🍺🍺🍺");
        }];
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"signal subscribeNext %@",x);
    }];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"signal subscribeNext %@",x);
    }];
    //RACMulticastConnection -- 用于当一个信号，被多次订阅时，为了保证创建信号时，避免多次调用创建信号中的block
    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
           NSLog(@"signal1 sendNext: 🍎🍎🍎🍎🍎🍎");
           [subscriber sendNext:@"🍎🍎🍎🍎🍎🍎"];
           [subscriber sendCompleted];
           return [RACDisposable disposableWithBlock:^{
               NSLog(@"signal1销毁了: 🍎🍎🍎🍎🍎🍎");
           }];
       }];
        
       RACMulticastConnection *connection = [signal1 publish];
        
       [connection.signal subscribeNext:^(id  _Nullable x) {
           NSLog(@"subscribeNext-->1");
       }];
       [connection.signal subscribeNext:^(id  _Nullable x) {
           NSLog(@"subscribeNext-->2");
       }];
       [connection.signal subscribeNext:^(id  _Nullable x) {
           NSLog(@"subscribeNext-->3");
       }];
       [connection connect];
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
        NSLog(@"Button clicked");
    }];
    racButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"rac_command Button clicked");
        return [RACSignal empty];
    }];
}

- (void)configureRACTextField {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"placeholder";
    [self.contentView addArrangedSubview:textField];
    [textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"text field: %@", x);
    }];
    [[textField rac_signalForControlEvents:(UIControlEventEditingChanged)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"text fiedl editing changed: %@", x);
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

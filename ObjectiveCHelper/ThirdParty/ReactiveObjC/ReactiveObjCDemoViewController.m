//
//  ReactiveObjCDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron 2022/11/8.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "ReactiveObjCDemoViewController.h"
#import "ReactiveObjCDemoViewModel.h"

@interface ReactiveObjCDemoViewController ()

@property(nonatomic, assign) NSInteger number;
@property(nonatomic, assign) NSInteger valueCount;

@property(nonatomic, strong) ReactiveObjCDemoViewModel *viewModel;

@property(nonatomic, strong) UITextView *textView;
@property(nonatomic, strong) UITextField *usernameField;
@property(nonatomic, strong) UITextField *emailField;
@property(nonatomic, strong) UITextField *passwordField;

@end

@implementation ReactiveObjCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        make.width.equalTo(@(UIScreen.mainScreen.bounds.size.width - 20 * 2));
    }];
    self.title = @"ReactiveObjC";
    self.number = 0;
    self.viewModel = [[ReactiveObjCDemoViewModel alloc] init];
    
    [self configureContentView];
    //数组遍历
    NSArray<NSNumber *> *numberArray = @[@1, @2, @3];
    [numberArray.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"rac sequence %@", x);
    }];
    //快速替换数组中内容
    NSArray *newArray = [[numberArray.rac_sequence mapReplace:@"99"] array];
    NSLog(@"%@",newArray);
    NSArray *newArray2 = [[numberArray.rac_sequence map:^id _Nullable(id  _Nullable value) {
        NSLog(@"原数组内容%@",value);
        return @"99";
    }] array];
    NSLog(@"%@",newArray2);
    
    //收敛
    NSNumber *sum = [numberArray.rac_sequence foldLeftWithStart:@(0) reduce:^id _Nullable(NSNumber *  _Nullable accumulator, NSNumber * _Nullable value) {
        return @(accumulator.doubleValue + value.doubleValue);
    }];
    NSLog(@"foldLeftWithStart: %@", sum);
    
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
    [self configureTextView];
    [self configureLoginView];
    [self configureValueCountLabel];
    [self configureButton];
    [self configureTextField];
}

- (void)configureTextView {
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = UIColor.yellowColor;
    [self.contentView addArrangedSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@200);
    }];
}

- (void)configureLoginView {
    UITextField *usernameField = [[UITextField alloc] init];
    usernameField.borderStyle = UITextBorderStyleRoundedRect;
    usernameField.placeholder = @"user name";
    [self.contentView addArrangedSubview:usernameField];
    self.usernameField = usernameField;
    
    UITextField *emailField = [[UITextField alloc] init];
    emailField.borderStyle = UITextBorderStyleRoundedRect;
    emailField.placeholder = @"email";
    [self.contentView addArrangedSubview:emailField];
    self.emailField = emailField;

    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.borderStyle = UITextBorderStyleRoundedRect;
    passwordField.placeholder = @"password";
    [self.contentView addArrangedSubview:passwordField];
    self.passwordField = passwordField;
    
    UIAction *loginAction = [UIAction actionWithTitle:@"Login" image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
        NSLog(@"Login Action");
        self.valueCount += 1;
    }];
    UIButton *loginButton = [UIButton systemButtonWithPrimaryAction:loginAction];
    loginButton.backgroundColor = UIColor.cyanColor;
    [self.contentView addArrangedSubview:loginButton];
    
    RAC(self.viewModel, username) = usernameField.rac_textSignal;
    RAC(self.viewModel, email) = emailField.rac_textSignal;
    RAC(self.viewModel, password) = passwordField.rac_textSignal;
    
    RAC(loginButton, enabled) = [self.viewModel rac_loginValidSignal];
    RAC(loginButton, backgroundColor) = [[self.viewModel rac_loginValidSignal] map:^id _Nullable(NSNumber * _Nullable value) {
        return value.boolValue ? UIColor.cyanColor : UIColor.grayColor;
    }];

}

- (void)loginButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)configureValueCountLabel {
    UILabel *valueCountLabel = [[UILabel alloc] init];
    [self.contentView addArrangedSubview:valueCountLabel];
    RAC(valueCountLabel, text) = [RACObserve(self, valueCount) map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%@", value];
    }];
}

- (void)configureButton {
    UIButton *racButton = [[UIButton alloc] init];
    racButton.backgroundColor = UIColor.blueColor;
    [racButton setTitle:@"RAC Button" forState:UIControlStateNormal];
    [self.contentView addArrangedSubview:racButton];
    UISwitch *s = [[UISwitch alloc] init];
    [self.contentView addArrangedSubview:s];
    RACSignal *buttonValid = [[s rac_signalForControlEvents:(UIControlEventValueChanged)] map:^id _Nullable(__kindof UISwitch * _Nullable value) {
        return [[NSNumber alloc] initWithBool:value.isOn];
    }];

    @weakify(self)
    [[racButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        NSLog(@"Button clicked");
        self.valueCount += 1;
    }];
    racButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"rac_command Button clicked");
        return [RACSignal empty];
    }];
    racButton.rac_command = [[RACCommand alloc] initWithEnabled:buttonValid signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal empty];
    }];
}

- (void)configureSwitch {
}

- (void)configureTextField {
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

@end

//
//  OCHValueStepper.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/28.
//

#import "OCHValueStepper.h"

typedef NS_ENUM(NSUInteger, OCHValueStepperButtonTag) {
    OCHValueStepperActionAdd,
    OCHValueStepperActionSub,
};

NSString *NSStringFromOCHValueStepperButtonTag(OCHValueStepperButtonTag tag) {
    switch (tag) {
        case OCHValueStepperActionAdd:
            return @"OCHValueStepperActionAdd";
            break;
        case OCHValueStepperActionSub:
            return @"OCHValueStepperActionSub";
            break;
        default:
            break;
    }
}

@interface OCHValueStepper ()

@property(nonatomic, strong) UITextField *valueField;
@property(nonatomic, strong) UIButton *subButton;
@property(nonatomic, strong) UIButton *addButton;

@property(nonatomic, copy) ValueStepperStringProvider valueStringProvider;

@end

@implementation OCHValueStepper

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _value = 0;
        _minimumValue = 0;
        _maximumValue = 100;
        _stepValue = 1;
        _valueStringProvider = ^NSString *(double value) {
            return [NSString stringWithFormat:@"%d", (int)value];
        };
        [self configureContetnView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame valueString:(ValueStepperStringProvider)provider {
    self = [super initWithFrame:frame];
    if (self) {
        _value = 0;
        _minimumValue = 0;
        _maximumValue = 100;
        _stepValue = 1;
        _valueStringProvider = provider;
        [self configureContetnView];
    }
    return self;
}

- (void)configureContetnView {
    UIButton *subButton = [[UIButton alloc] init];
    subButton.tag = OCHValueStepperActionSub;
    subButton.backgroundColor = UIColor.systemBlueColor;
    subButton.layer.cornerRadius = 6;
    [subButton setTitle:@"-" forState:UIControlStateNormal];
    [subButton addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    self.subButton = subButton;
    
    UIButton *addButton = [[UIButton alloc] init];
    addButton.tag = OCHValueStepperActionAdd;
    addButton.backgroundColor = UIColor.systemBlueColor;
    addButton.layer.cornerRadius = 6;
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    self.addButton = addButton;
    
    UITextField *valueField = [[UITextField alloc] init];
    valueField.textAlignment = NSTextAlignmentCenter;
    valueField.enabled = false;
    self.valueField = valueField;
    
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[subButton, valueField, ]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    hstack.spacing = 10;

    UIStackView *container = [[UIStackView alloc] initWithArrangedSubviews:@[hstack, addButton]];
    container.axis = UILayoutConstraintAxisHorizontal;
    container.spacing = 10;

    [self addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [subButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(44);
    }];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(44);
    }];
    
    [self updateView];
}

- (void)updateView {
    self.valueField.text = self.valueStringProvider(_value);
    
    if (0 == self.value) {
        self.subButton.hidden = YES;
        self.valueField.hidden = YES;
    } else {
        self.subButton.hidden = NO;
        self.valueField.hidden = NO;
    }
}

- (void)buttonOnClicked:(UIButton *)button event:(UIControlEvents)event {
//#if DEBUG
//    NSLog(@"%s tag: %@", __PRETTY_FUNCTION__, NSStringFromOCHValueStepperButtonTag(button.tag));
//#endif
    if (OCHValueStepperActionSub == button.tag) {
        self.value = MAX(self.minimumValue, self.value - self.stepValue);
    } else if (OCHValueStepperActionAdd == button.tag) {
        self.value = MIN(self.maximumValue, self.value + self.stepValue);
    }
    [self updateView];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setValue:(double)value {
    _value = value;
    [self updateView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

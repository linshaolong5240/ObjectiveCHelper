//
//  OCHValueStepper.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/28.
//

#import "OCHValueStepper.h"

typedef NS_ENUM(NSUInteger, OCHValueStepperButtonTag) {
    OCHValueStepperButtonTagAdd,
    OCHValueStepperButtonTagSub,
};

NSString *NSStringFromOCHValueStepperButtonTag(OCHValueStepperButtonTag tag) {
    switch (tag) {
        case OCHValueStepperButtonTagAdd:
            return @"OCHValueStepperButtonTagAdd";
            break;
        case OCHValueStepperButtonTagSub:
            return @"OCHValueStepperButtonTagSub";
            break;
        default:
            break;
    }
}

@implementation OCHValueStepper

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureContetnView];
    }
    return self;
}

- (void)configureContetnView {
    
}

- (void)buttonOnClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s tag: %@", __PRETTY_FUNCTION__, NSStringFromOCHValueStepperButtonTag(button.tag));
#endif
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

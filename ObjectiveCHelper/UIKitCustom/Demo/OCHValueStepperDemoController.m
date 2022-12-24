//
//  OCHValueStepperDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/28.
//

#import "OCHValueStepperDemoController.h"
@import Masonry;

#import "OCHValueStepper.h"

@interface OCHValueStepperDemoController ()

@end

@implementation OCHValueStepperDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OCHValueStepper";
    OCHValueStepper *valueStepper = [[OCHValueStepper alloc] initWithFrame:CGRectZero valueString:^NSString * _Nonnull(double value) {
        return  [NSString stringWithFormat:@"value: %d", (int)value];
    }];
    
    [valueStepper addTarget:self action:@selector(stepperOnChanged:event:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:valueStepper];
    [valueStepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.width.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}

- (void)stepperOnChanged:(OCHValueStepper *)stepper event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
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

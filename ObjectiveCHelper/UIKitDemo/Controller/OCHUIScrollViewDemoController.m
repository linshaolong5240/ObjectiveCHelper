//
//  OCHUIScrollViewDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHUIScrollViewDemoController.h"

@interface OCHUIScrollViewDemoController ()

@end

@implementation OCHUIScrollViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureContentView];
}

- (void)configureContentView {
    
    for (NSInteger i = 0; i < 100; i++) {
        UILabel *label = UILabel.new;
        label.text = [NSString stringWithFormat:@"%ld", i];
        [self.scrollContentView addArrangedSubview:label];
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

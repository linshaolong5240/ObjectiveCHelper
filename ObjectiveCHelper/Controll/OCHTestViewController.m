//
//  OCHTestViewController.m
//  ObjectiveCHelper
//
//  Created by Apple on 2022/9/30.
//

#import "OCHTestViewController.h"

@interface OCHTestViewController ()

@end

@implementation OCHTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureContentView];
}

- (void)configureContentView {
    self.view.backgroundColor = UIColor.blueColor;
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

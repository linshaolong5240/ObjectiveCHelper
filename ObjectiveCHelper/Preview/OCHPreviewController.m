//
//  OCHPreviewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreviewController.h"
#import "OCHPreview.h"
#import "UIButtonDemoViewController.h"
#import "OCHValueStepper.h"

@interface OCHPreviewController ()

@end

@implementation OCHPreviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    UIView *v = [OCHPreview new];
    //    [self.contentView addSubview:v];
    //    [v mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.contentView);
    //    }];
    
    //    UIButtonDemoViewController *vc = [UIButtonDemoViewController new];
    //    [self addChildViewController:vc];
    //    [self.contentView addSubview:vc.view];
    //    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.edges.equalTo(self.contentView);
    //    }];
    //
    OCHValueStepper *v = [OCHValueStepper new];
    v.value = 0;
    [self.contentView addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.width.equalTo(self.contentView);
        make.height.equalTo(@44);
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

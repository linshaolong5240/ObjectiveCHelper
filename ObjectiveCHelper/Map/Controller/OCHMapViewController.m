//
//  OCHMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHMapViewController.h"
#import "OCHMapView.h"

@interface OCHMapViewController ()

@property(nonatomic, strong) OCHMapView *mapview;

@end

@implementation OCHMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapview = [[OCHMapView alloc] initWithFrame:self.view.bounds providerType:(OCHMapProviderTypeTencent)];
    [self.view addSubview:self.mapview];
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

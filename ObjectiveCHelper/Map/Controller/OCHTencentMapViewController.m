//
//  OCHTencentMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHTencentMapViewController.h"
#import "OCHTencentMapView.h"

@interface OCHTencentMapViewController ()

@property(nonatomic, strong) OCHTencentMapView *mapView;

@end

@implementation OCHTencentMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[OCHTencentMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
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

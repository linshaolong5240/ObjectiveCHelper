//
//  OMKTencentMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKTencentMapViewController.h"
#import "OMKTencentMapView.h"

@interface OMKTencentMapViewController ()

@property(nonatomic, strong) OMKTencentMapView *mapView;

@end

@implementation OMKTencentMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[OMKTencentMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.showsUserLocation = true;
    self.mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;

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

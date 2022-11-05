//
//  OMKAMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapViewController.h"
#import "OMKAMapView.h"

@interface OMKAMapViewController ()

@end

@implementation OMKAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    OMKAMapView *mapView = [[OMKAMapView alloc] initWithFrame:self.view.bounds];
    mapView.showsUserLocation = true;
    mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;
    
    [self.view addSubview:mapView];
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

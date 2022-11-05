//
//  OCHAMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHAMapViewController.h"
#import "OCHAMapView.h"

@interface OCHAMapViewController ()

@end

@implementation OCHAMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    OCHAMapView *mapView = [[OCHAMapView alloc] initWithFrame:self.view.bounds];
    mapView.showsUserLocation = true;
    mapView.userTrackingMode = OCHMapUserTrackingModeFollow;
    
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

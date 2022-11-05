//
//  OMKBaiduMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduMapViewController.h"
#import "OMKBaiduMapView.h"

@interface OMKBaiduMapViewController ()

@property (nonatomic, strong) OMKBaiduMapView *mapView;

@end

@implementation OMKBaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[OMKBaiduMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.showsUserLocation = true;
    self.mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;
    
    [self.view addSubview:self.mapView];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.mapView viewWillAppear];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.mapView viewWillDisappear];
//}

@end

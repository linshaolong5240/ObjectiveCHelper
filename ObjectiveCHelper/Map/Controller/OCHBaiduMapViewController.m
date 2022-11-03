//
//  OCHBaiduMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHBaiduMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface OCHBaiduMapViewController ()

@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation OCHBaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BMKMapView *mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    mapView.showsUserLocation = YES;
    mapView.showMapScaleBar = YES;
//    mapView.delegate = self;
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
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

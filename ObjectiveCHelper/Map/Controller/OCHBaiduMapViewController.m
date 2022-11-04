//
//  OCHBaiduMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHBaiduMapViewController.h"
#import "OCHBaiduMapView.h"

@interface OCHBaiduMapViewController ()

@property (nonatomic, strong) OCHBaiduMapView *mapView;

@end

@implementation OCHBaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView = [[OCHBaiduMapView alloc]initWithFrame:self.view.bounds];
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

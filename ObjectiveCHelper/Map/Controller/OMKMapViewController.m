//
//  OMKMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/5.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKMapViewController.h"

@interface OMKMapViewController () <OMKMapViewDelegate>

@property(nonatomic, strong) UIView<OMKMapViewProvider> *mapView;

@end

@implementation OMKMapViewController

- (instancetype)initWithMapType:(OMKMapType) mapType {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _mapType = mapType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    switch (self.mapType) {
        case OMKMapTypeAMap:
            self.mapView = [[OMKAMapView alloc] initWithFrame:self.view.bounds];
            break;
        case OMKMapTypeBaidu:
            self.mapView = [[OMKBaiduMapView alloc] initWithFrame:self.view.bounds];
            break;
        case OMKMapTypeTencent:
            self.mapView = [[OMKTencentMapView alloc] initWithFrame:self.view.bounds];
            break;
        default:
            break;
    }
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;
    
    OMKPointAnnotation *annotation = [[OMKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(26.0533, 119.1911);
    annotation.title = @"tittle";
    annotation.subtitle = @"subtittle";
    
    [self.mapView addAnnotation:annotation];
    [self.view addSubview:self.mapView];
}

#pragma mark - OMKMapViewDelegate

@end

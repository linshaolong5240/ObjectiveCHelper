//
//  OMKMapViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/5.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKMapViewController.h"

@interface OMKMapViewController () <OMKMapViewDelegate>

@property(nonatomic, strong) OMKMapView *mapView;
@property(nonatomic, strong) OMKPointAnnotation *customAnnotation;

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
            self.customAnnotation = [[OMKBaiduPointAnnotation alloc] init];
            break;
        case OMKMapTypeTencent:
            self.mapView = [[OMKTencentMapView alloc] initWithFrame:self.view.bounds];
            self.customAnnotation = [[OMKTencentPointAnnotation alloc] init];
            break;
        default:
            break;
    }
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    self.customAnnotation.coordinate = CLLocationCoordinate2DMake(26.0533, 119.1911);
    self.customAnnotation.title = @"tittle";
    self.customAnnotation.subtitle = @"subtittle";
    [self.mapView addAnnotation:self.customAnnotation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.customAnnotation.coordinate = CLLocationCoordinate2DMake(27.0533, 119.1911);
//        [self.mapView removeAnnotation:self.customAnnotation];
    });
}

#pragma mark - OMKMapViewDelegate

- (__kindof OMKAnnotationView *)mapView:(UIView<OMKMapViewProvider> *)mapView viewForAnnotation:(id<OMKAnnotation>)annotation {
    OMKPointAnnotationView *annotationView = [[OMKPointAnnotationView alloc] initWithAnnotation:annotation];
    return annotationView;
    return nil;
}

@end

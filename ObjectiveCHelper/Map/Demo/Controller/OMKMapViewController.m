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
@property(nonatomic, strong) id <OMKAnnotation> pointAnnotation;
@property(nonatomic, strong) id <OMKCustomerLocationmAnnotation> customerLocationAnnotation;
@property(nonatomic, strong) id <OMKEmployeeLocationmAnnotation> employeeLocationAnnotation;
@property(nonatomic, strong) id <OMKCircleOverlay> circleOverlay;

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
            self.pointAnnotation = [[OMKAPointAnnotation alloc] init];
            self.customerLocationAnnotation = [[OMKACustomerLocationAnnotation alloc] init];
            self.circleOverlay = [[OMKACircle alloc] init];
            break;
        case OMKMapTypeBaidu:
            self.mapView = [[OMKBaiduMapView alloc] initWithFrame:self.view.bounds];
            self.pointAnnotation = [[OMKBPointAnnotation alloc] init];
            self.customerLocationAnnotation = [[OMKBCustomerLocationAnnotation alloc] init];
            self.employeeLocationAnnotation = [[OMKBEmployeeLocationAnnotation alloc] init];
            self.circleOverlay = [[OMKBCircle alloc] init];
            break;
        case OMKMapTypeTencent:
            self.mapView = [[OMKTencentMapView alloc] initWithFrame:self.view.bounds];
            self.pointAnnotation = [[OMKQPointAnnotation alloc] init];
            self.customerLocationAnnotation = [[OMKQCustomerLocationAnnotation alloc] init];
            self.employeeLocationAnnotation = [[OMKQEmployeeLocationAnnotation alloc] init];
            self.circleOverlay = [[OMKQCircle alloc] init];
            break;
        case OMKMapTypeNumber:
            break;;
    }
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = OCHMapUserTrackingModeFollowWithHeading;
    
    [self.view addSubview:self.mapView];
    
    self.pointAnnotation.coordinate = CLLocationCoordinate2DMake(26.0533, 119.1911);
    self.pointAnnotation.title = @"tittle";
    self.pointAnnotation.subtitle = @"subtittle";
    [self.mapView addAnnotation:self.pointAnnotation];
    
    self.customerLocationAnnotation.coordinate = CLLocationCoordinate2DMake(26.0533, 119.2911);
    [self.mapView addAnnotation:self.customerLocationAnnotation];
    self.employeeLocationAnnotation.coordinate = CLLocationCoordinate2DMake(26.1533, 119.2911);
    [self.mapView addAnnotation:self.employeeLocationAnnotation];
    
    // 添加圆形覆盖物
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(26.0533, 119.3911);
    
    [self.circleOverlay setCircleWithCenterCoordinate:coor radius:5000];
    [self.mapView addOverlay:self.circleOverlay];
    
//    @weakify(self)
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        @strongify(self)
//        self.pointAnnotation.coordinate = CLLocationCoordinate2DMake(27.0533, 119.1911);
//        [self.mapView removeAnnotation:self.pointAnnotation];
//    });
}

#pragma mark - OMKMapViewDelegate

- (void)mapView:(OMKMapView *)mapView didSelectAnnotationView:(id <OMKAnnotationView>)view {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
}

-(void)mapView:(OMKMapView *)mapView didDeselectAnnotationView:(id <OMKAnnotationView>)view {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
}

- (void)mapView:(OMKMapView *)mapView didChangeUserTrackingMode:(OMKUserTrackingMode)mode animated:(BOOL)animated {
#if DEBUG
    NSLog(@"%s %@", __PRETTY_FUNCTION__, NSStringFromOMKUserTrackingMode(mode));
#endif
}

@end

//
//  OMKBaiduPointAnnotationView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

@class OMKAnnotationView;

NS_ASSUME_NONNULL_BEGIN

@interface OMKBaiduPointAnnotationView : BMKAnnotationView

- (instancetype)initWithAnnotation:(id <BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_UNAVAILABLE;
- (instancetype)initWithView:(__kindof OMKAnnotationView *)view annotation:(id <BMKAnnotation>)annotation NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

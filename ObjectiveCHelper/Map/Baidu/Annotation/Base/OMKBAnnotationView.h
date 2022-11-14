//
//  OMKBAnnotationView.h
//  ObjectiveCHelper
//
//  Created by Sarueon on 2022/11/14.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "OMKAnnotationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKBAnnotationView : BMKAnnotationView <OMKAnnotationView>

+ (void)initialize NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

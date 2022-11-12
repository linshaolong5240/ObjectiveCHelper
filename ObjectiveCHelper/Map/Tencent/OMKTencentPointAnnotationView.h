//
//  OMKTencentPointAnnotationView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <QMapKit/QMapKit.h>

@class OMKAnnotationView;

NS_ASSUME_NONNULL_BEGIN

@interface OMKTencentPointAnnotationView : QAnnotationView

- (instancetype)initWithAnnotation:(id <QAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_UNAVAILABLE;
- (instancetype)initWithView:(__kindof OMKAnnotationView *)view NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

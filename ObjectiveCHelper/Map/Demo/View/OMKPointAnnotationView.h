//
//  OMKPointAnnotationView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAnnotationView.h"
#import "OMKPointAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKPointAnnotationView : OMKAnnotationView

- (instancetype)initWithAnnotation:(OMKPointAnnotation *)annotation;

@end

NS_ASSUME_NONNULL_END

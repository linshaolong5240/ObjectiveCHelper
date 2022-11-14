//
//  OMKAMapAnnotationContainerView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapAnnotationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OMKAMapAnnotationContainerView : OMKAMapAnnotationView

-(id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_UNAVAILABLE;
- (instancetype)initWithView:(__kindof OMKAnnotationView *)view NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

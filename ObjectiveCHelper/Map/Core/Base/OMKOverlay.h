//
//  OMKOverlay.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMKAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OMKOverlay <OMKAnnotation>

@optional

@property(nonatomic, assign) CGFloat lineWidth;
@property(nonatomic, assign) UIColor *strokeColor;
@property(nonatomic, assign) UIColor *fillColor;

@end

NS_ASSUME_NONNULL_END

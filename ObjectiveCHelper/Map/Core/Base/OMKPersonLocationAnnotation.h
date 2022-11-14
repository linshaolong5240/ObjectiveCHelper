//
//  OMKPersonLocationAnnotation.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/14.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OMKPersonLocationAnnotation <OMKAnnotation>

@property(nonatomic, copy) UIImage *locationImage;
@property(nonatomic, copy) UIImage *bubbleImage;

@end

NS_ASSUME_NONNULL_END

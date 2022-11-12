//
//  OMKAnnotation.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OMKAnnotationDelegate;

NS_ASSUME_NONNULL_BEGIN

@protocol OMKAnnotation <NSObject, NSCopying>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, readonly,copy) NSString *reuseIdentifier;

@end

@interface OMKAnnotation : NSObject <OMKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, readonly,copy) NSString *reuseIdentifier;

@end

NS_ASSUME_NONNULL_END

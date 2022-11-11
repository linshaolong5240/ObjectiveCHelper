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

@protocol OMKAnnotation <NSObject>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end

@interface OMKAnnotation : NSObject <OMKAnnotation>

@property (nonatomic, weak) id<OMKAnnotationDelegate> delegate;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end

@protocol OMKAnnotationDelegate <NSObject>

@optional

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate;

- (void)annotation:(OMKAnnotation *)annotation didChangedCoordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END

//
//  OMKAnnotationView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/10.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OMKAnnotation;

NS_ASSUME_NONNULL_BEGIN

@interface OMKAnnotationView : UIView

@property(nonatomic, strong) id<OMKAnnotation> annotation;
/// 复用标志
@property (nonatomic, readonly) NSString *reuseIdentifier;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithAnnotation:(id<OMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

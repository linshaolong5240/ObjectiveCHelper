//
//  OCHMapView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>

typedef NS_ENUM(NSUInteger, OCHMapProvider) {
    OCHMapProviderAMap,
    OCHMapProviderBaidu,
    OCHMapProviderTencent,
};

@protocol OCHMapSource;

@protocol OCHMapViewDelegate <NSObject>

@required

@optional

@end


NS_ASSUME_NONNULL_BEGIN

@interface OCHMapView : UIView

///当前地图服务商
@property(nonatomic, readonly) OCHMapProvider provider;
///当前地图源
@property(nonatomic, weak) id<OCHMapViewDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame mapProvider:(OCHMapProvider) provider;

@end

NS_ASSUME_NONNULL_END


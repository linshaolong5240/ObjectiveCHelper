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

@protocol OCHMapViewSource;

@protocol OCHMapViewDelegate <NSObject>

@required

@optional

@end


NS_ASSUME_NONNULL_BEGIN

@interface OCHMapView : UIView

///地图服务商
@property(nonatomic, readonly) OCHMapProvider provider;

@property(nonatomic, weak) id<OCHMapViewSource> mapViewSource;
@property(nonatomic, weak) id<OCHMapViewDelegate> delegate;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame mapProvider:(OCHMapProvider) provider;

@end

NS_ASSUME_NONNULL_END


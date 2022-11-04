//
//  OCHMapSource.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OCHMapProviderDelegate <NSObject>

@required

@optional

@end

@protocol OCHMapProvider <NSObject>

@required
@property(nonatomic, weak) id<OCHMapProviderDelegate> providerDelete;

- (UIView *)providerView;

@optional

@end

NS_ASSUME_NONNULL_BEGIN



NS_ASSUME_NONNULL_END

//
//  OCHMapSource.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/4.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OCHMapProvider <NSObject>

@required
- (UIView *)providerView;

@optional

@end

NS_ASSUME_NONNULL_BEGIN



NS_ASSUME_NONNULL_END

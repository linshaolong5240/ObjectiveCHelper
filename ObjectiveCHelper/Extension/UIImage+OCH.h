//
//  UIImage+OCH.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/23.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (OCH)

+ (UIImage *)imageWithImageLight:(UIImage *)lightImage dark:(UIImage *)darkImage;

@end

NS_ASSUME_NONNULL_END

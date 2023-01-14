//
//  NSString+OCH.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (OCH)

+ (NSString *)md5String:(NSString *)string;

- (NSString *)md5;

- (NSString*)firstPinYin;

@end

NS_ASSUME_NONNULL_END

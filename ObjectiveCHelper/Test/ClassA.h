//
//  ClassA.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import <Foundation/Foundation.h>

@protocol AProtocol <NSObject>

- (void)helloWorld;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ClassA : NSObject <AProtocol>

@end

NS_ASSUME_NONNULL_END

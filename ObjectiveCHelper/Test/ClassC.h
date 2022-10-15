//
//  ClassC.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassC : NSObject

@property(nonatomic, strong) ClassB *b;

- (void)test;

@end

NS_ASSUME_NONNULL_END

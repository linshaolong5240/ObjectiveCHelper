//
//  TestA.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "TestA.h"

@implementation TestA

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end

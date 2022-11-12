//
//  OMKAMapPointAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapPointAnnotation.h"

@implementation OMKAMapPointAnnotation

-(NSString *)reuseViewIdentifier {
    return NSStringFromClass([self class]);
}

@end

//
//  OMKBaiduPointAnnotation.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKBaiduPointAnnotation.h"

@implementation OMKBaiduPointAnnotation

-(void)dealloc {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
}

-(NSString *)reuseViewIdentifier {
    return NSStringFromClass([self class]);
}

@end

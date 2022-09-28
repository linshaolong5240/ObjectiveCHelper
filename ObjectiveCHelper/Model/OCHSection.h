//
//  OCHSection.h
//  ObjectiveCHelper
//
//  Created by Apple on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHSection : NSObject
@property(nonatomic, copy) NSString* title;
@property(nonatomic, strong) NSMutableArray* items;
@end

NS_ASSUME_NONNULL_END

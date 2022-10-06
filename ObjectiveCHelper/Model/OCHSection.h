//
//  OCHSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHSection<ObjectType> : NSObject
@property(nonatomic, copy) NSString* title;
@property(nonatomic, strong) NSMutableArray<ObjectType>* items;
@end

NS_ASSUME_NONNULL_END

//
//  OCHSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHSection<ObjectType> : NSObject

@property(nonatomic, copy, nullable) NSString* title;
@property(nonatomic, strong, nullable) NSMutableArray<ObjectType>* items;

- (instancetype)initWithTitle:(nullable NSString *)title items:(nullable NSArray *)items;

@end

NS_ASSUME_NONNULL_END

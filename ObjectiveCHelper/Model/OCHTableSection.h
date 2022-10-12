//
//  OCHTableSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHTableSection<Label, Item> : NSObject

@property(nonatomic, strong, nullable) Label label;
@property(nonatomic, strong, nonnull) NSMutableArray<Item>* items;

- (instancetype)initWithLabel:(nullable Label)label items:(nonnull NSArray<Item> *)items;

@end

NS_ASSUME_NONNULL_END

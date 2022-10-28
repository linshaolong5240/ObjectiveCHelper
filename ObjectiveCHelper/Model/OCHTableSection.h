//
//  OCHTableSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHTableSection<Label, Value> : NSObject

@property(nullable, nonatomic, strong) Label label;
@property(nonnull, nonatomic, strong) Value items;

- (instancetype)initWithLabel:(nullable Label)label items:(nonnull Value)items;
+ (instancetype)sectionWithLabel:(nullable Label)label items:(nonnull Value)items;

@end
NS_ASSUME_NONNULL_END


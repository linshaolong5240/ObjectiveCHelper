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
@property(nullable, nonatomic, strong) Value value;

- (instancetype)initWithLabel:(nullable Label)label value:(nullable Value)value;
+ (instancetype)sectionWithLabel:(nullable Label)label value:(nullable Value)value;

@end
NS_ASSUME_NONNULL_END


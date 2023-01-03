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

@interface OCHStringArraySection<Element> : NSObject

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSArray<Element> *items;

- (instancetype)initWithLabel:(NSString *)title items:(NSArray<Element> *)items;

+ (instancetype)sectionWith:(NSString *)title items:(NSArray<Element> *)items;

@end

@interface OCHStringMutableArraySection<Element> : NSObject

@property(nonatomic, copy) NSString *title;

@property(nonatomic, strong) NSMutableArray<Element> *items;

- (instancetype)initWithLabel:(NSString *)title items:(NSMutableArray<Element> *)items;

+ (instancetype)sectionWith:(NSString *)title items:(NSMutableArray<Element> *)items;

@end

NS_ASSUME_NONNULL_END


//
//  YCTableSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCTableSection<Label, Element> : NSObject

@property(nonatomic, strong) Label label;
@property(nonatomic, strong) NSMutableArray<Element>* items;

- (instancetype)initWithLabel:(Label)label items:(nonnull NSArray<Element> *)items;
+ (YCTableSection *)sectionWithLabel:(Label)label items:(nonnull NSArray *)items;

@end

NS_ASSUME_NONNULL_END

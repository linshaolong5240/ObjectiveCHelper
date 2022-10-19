//
//  OCHTableSection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHTableSection<Label, Element> : NSObject

@property(nullable, nonatomic, strong) Label label;
@property(nonatomic, strong) NSMutableArray<Element> *items;

- (instancetype)initWithLabel:(nullable Label)label items:(nonnull NSArray<Element> *)items;
+ (OCHTableSection *)sectionWithLabel:(nullable Label)label items:(nonnull NSArray *)items;

@end
NS_ASSUME_NONNULL_END


//
//  OCHIndexArraySection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHIndexArraySection<Element> : NSObject

@property(nonatomic, assign) NSInteger index;

@property(nonatomic, copy) NSArray<Element> *items;

- (instancetype)initWithIndex:(NSInteger)index items:(NSArray<Element> *)items;

+ (instancetype)sectionWithIndex:(NSInteger)index items:(NSArray<Element> *)items;

@end

NS_ASSUME_NONNULL_END

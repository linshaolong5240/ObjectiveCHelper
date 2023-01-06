//
//  OCHStringMutableArraySection.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCHStringMutableArraySection<Element> : NSObject

@property(nonatomic, copy) NSString *title;

@property(nonatomic, strong) NSMutableArray<Element> *items;

- (instancetype)initWithTitle:(NSString *)title items:(NSMutableArray<Element> *)items;

+ (instancetype)sectionWithTitle:(NSString *)title items:(NSMutableArray<Element> *)items;

@end


NS_ASSUME_NONNULL_END

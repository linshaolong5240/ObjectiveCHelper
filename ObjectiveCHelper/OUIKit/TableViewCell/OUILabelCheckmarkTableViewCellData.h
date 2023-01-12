//
//  OUILabelCheckmarkTableViewCellData.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/11.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelCheckmarkTableViewCellData : OUITableViewCellData

@property(nonatomic, copy) NSString *text;

@property(nonatomic, assign) BOOL selected;

- (instancetype)initWithText:(NSString *)text selected:(BOOL)selected;

+ (instancetype)dataWithText:(NSString *)text selected:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END

//
//  OUILabelSwitchTableViewCellData.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelSwitchTableViewCellData : OUITableViewCellData

@property(nonatomic, copy) NSString *text;

@property(nonatomic, getter=isOn) BOOL on;

- (instancetype)initWithText:(NSString *)text on:(BOOL)on selector:(SEL)selector;

- (instancetype)initWithText:(NSString *)text on:(BOOL)on;

+ (instancetype)dataWithText:(NSString *)text on:(BOOL)on selector:(SEL)selector;

+ (instancetype)dataWithText:(NSString *)text on:(BOOL)on;

@end

NS_ASSUME_NONNULL_END

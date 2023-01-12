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

@property(nonatomic, copy) NSString *title;

@property(nonatomic, getter=isOn) BOOL on;

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on selector:(SEL)selector;

- (instancetype)initWithTitle:(NSString *)title on:(BOOL)on;

+ (instancetype)dataWithTitle:(NSString *)title on:(BOOL)on selector:(SEL)selector;

+ (instancetype)dataWithTitle:(NSString *)title on:(BOOL)on;

@end

NS_ASSUME_NONNULL_END

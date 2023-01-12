//
//  OUILabelSwitchTableViewCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCell.h"
#import "OUILabelSwitchTableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelSwitchTableViewCell : OUITableViewCell

@property(nonatomic, strong, readonly) UILabel *label;

@property(nonatomic, strong, readonly) UISwitch *switcher;

@property(nonatomic, strong) OUILabelSwitchTableViewCellData *data;

- (void)fillWithData:(OUILabelSwitchTableViewCellData *)data;

@end

NS_ASSUME_NONNULL_END

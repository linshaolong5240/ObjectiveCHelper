//
//  OUITextSwitchTableViewCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCell.h"
#import "OUITextSwitchTableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUITextSwitchTableViewCell : OUITableViewCell

@property(nonatomic, strong, readonly) UILabel *titleLabel;

@property(nonatomic, strong, readonly) UISwitch *switcher;

@property(nonatomic, strong) OUITextSwitchTableViewCellData *data;

- (void)fillWithData:(OUITextSwitchTableViewCellData *)data;

@end

NS_ASSUME_NONNULL_END

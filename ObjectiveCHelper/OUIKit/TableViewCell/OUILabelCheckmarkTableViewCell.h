//
//  OUILabelCheckmarkTableViewCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/11.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCell.h"
#import "OUILabelCheckmarkTableViewCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUILabelCheckmarkTableViewCell : OUITableViewCell

@property(nonatomic, strong, readonly) UILabel *label;

@property(nonatomic, strong, readonly) UIImageView *checkmark;

@property(nonatomic, strong, readonly) OUILabelCheckmarkTableViewCellData *data;

- (void)fillWithData:(OUILabelCheckmarkTableViewCellData *)data;

@end

NS_ASSUME_NONNULL_END

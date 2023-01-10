//
//  OUITableViewCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OUITableViewCellData.h"
#import "OUICornerType.h"

NS_ASSUME_NONNULL_BEGIN

@interface OUITableViewCell : UITableViewCell

@property(nonatomic, weak) id selectorDelegate;
/// 子视图容器
@property(nonatomic, strong, readonly) UIView *containerView;
/// 分割线
@property(nonatomic, strong, readonly) UIView *divider;
/// divider insets. Default is UIEdgeInsetsMake(0, 12, 0, 12)
@property(nonatomic, assign) UIEdgeInsets dividerInsets;
/// contentView insets. Default is UIEdgeInsetsMake(0, 0, 0, 0)
@property(nonatomic, assign) UIEdgeInsets contentInsets;
/// containerView insets. Default is UIEdgeInsetsMake(12, 12, 12, 12)
@property(nonatomic, assign) UIEdgeInsets containerInsets;

@property(nonatomic, assign) OUICornerType cornerType;

//@property(nonatomic, strong) OUITableViewCellData *data;
//
//- (void)fillWithData:(OUITableViewCellData *)data;

- (void)setCornerTypeForIndex:(NSInteger)index inNumber:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END

//
//  UITableViewDemoCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import <UIKit/UIKit.h>
@class UITableViewDemoCell;
#import "UITableViewDemoCellData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewDemoCellDelegate <NSObject>

@optional

- (void)tableViewDemoCellActionButtonOnClicked:(UITableViewDemoCell *)cell;

@end

@interface UITableViewDemoCell : UITableViewCell

@property(nonatomic, weak) id <UITableViewDemoCellDelegate> delegate;

@property(nonatomic, strong, readonly) UILabel *stateLabel;

@property(nonatomic, strong, readonly) UIButton *actionButton;

@property(nonatomic, strong, readonly) UITableViewDemoCellData *data;

- (void)fillWithData:(UITableViewDemoCellData *)data;

@end

NS_ASSUME_NONNULL_END

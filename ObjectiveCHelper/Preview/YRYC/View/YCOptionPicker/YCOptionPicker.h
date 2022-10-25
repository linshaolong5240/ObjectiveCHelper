//
//  YCOptionPicker.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/25.
//

#import <UIKit/UIKit.h>
#import "YCTableSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCOptionPicker : UIView

@property(nonatomic, strong) YCTableSection<NSString *, NSString *> *section;
@property(nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END

//
//  UITableView+Extension.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (OCH)

- (void)selectAllRowsWithAnimated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
- (void)deselectAllRowsWithAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

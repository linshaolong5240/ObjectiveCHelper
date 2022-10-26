//
//  UITableView+Extension.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/26.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (void)selectAllRowsWithAnimated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition {
    NSInteger sections = [self numberOfSections];

    for(NSInteger section = 0; section < sections; section++) {
        NSInteger rows = [self numberOfRowsInSection:section];
        
        for(NSInteger row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [self selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
            [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
        }
    }
}

- (void)deselectAllRowsWithAnimated:(BOOL)animated {
    NSInteger sections = [self numberOfSections];
    
    for(NSInteger section = 0; section < sections; section++) {
        NSInteger rows = [self numberOfRowsInSection:section];
        
        for(NSInteger row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [self deselectRowAtIndexPath:indexPath animated:animated];
            if ([self.delegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
                [self.delegate tableView:self didDeselectRowAtIndexPath:indexPath];
            }
        }
    }
}

@end

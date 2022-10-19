//
//  UITableViewDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import "OCHBaseViewController.h"
#import "OCHTableSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewDemoViewController : OCHBaseViewController

@property(nonatomic, strong) NSMutableArray<OCHTableSection<NSString *, UIColor *> *> *sections;

@end

NS_ASSUME_NONNULL_END

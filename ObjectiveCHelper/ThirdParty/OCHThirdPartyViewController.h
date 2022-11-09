//
//  OCHThirdPartyViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "OCHContentViewController.h"
#import "OCHJXCategoryViewController.h"

typedef NS_ENUM(NSUInteger, OCHThirdPartyItem) {
    OCHTirdPartyItemBeg,
    OCHTirdPartyItemJXCategoryView = OCHTirdPartyItemBeg,
    OCHTirdPartyItemMJRefresh,
    OCHTirdPartyItemDVPieChart,
    OCHTirdPartyItemReactiveObjC,
    OCHTirdPartyItemEnd,
};

NSArray<NSNumber *> * OCHTirdPartyItemAllItems(void);
NSString * NSStringFromOCHTirdPartyItem(OCHThirdPartyItem item);
UIViewController * UIViewControllerFromOCHTirdPartyItem(OCHThirdPartyItem item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHThirdPartyViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

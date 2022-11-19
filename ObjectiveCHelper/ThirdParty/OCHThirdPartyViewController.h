//
//  OCHThirdPartyViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "OCHContentViewController.h"
#import "JXCategoryViewDemoViewController.h"

typedef NS_ENUM(NSUInteger, OCHThirdPartyItem) {
    OCHTirdPartyItemBeg,
    OCHTirdPartyItemDVPieChart = OCHTirdPartyItemBeg,
    OCHTirdPartyItemJXCategoryView,
    OCHTirdPartyItemMJRefresh,
    OCHTirdPartyItemOneMapKit,
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

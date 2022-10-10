//
//  OCHThirdPartyViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "OCHContentViewController.h"
#import "OCHJXCategoryViewController.h"

typedef NS_ENUM(NSUInteger, OCHTirdPartyItem) {
    OCHTirdPartyItemBeg,
    OCHTirdPartyItemJXCategoryView = OCHTirdPartyItemBeg,
    OCHTirdPartyItemDVPieChart,
    OCHTirdPartyItemEnd,
};

NSArray<NSNumber *> * OCHTirdPartyItemAllItems(void);
NSString * NSStringFromOCHTirdPartyItem(OCHTirdPartyItem item);
UIViewController * UIViewControllerFromOCHTirdPartyItem(OCHTirdPartyItem item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHThirdPartyViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

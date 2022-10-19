//
//  OCHUIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"

typedef NS_ENUM(NSUInteger, OCHUIKitDemo) {
    OCHUIKitDemoBeg,
    OCHUIKitDemoUICollectionView = OCHUIKitDemoBeg,
    OCHUIKitDemoUISearchbar,
    OCHUIKitDemoUIScrollView,
    OCHUIKitDemoUITableView,
    OCHUIKitDemoEnd,
};

NSArray<NSNumber *> * OCHUIKitDemoAllItems(void);
NSString * NSStringFromOCHUIKitDemo(OCHUIKitDemo item);
UIViewController * UIViewControllermOCHUIKitDemo(OCHUIKitDemo item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHUIKitDemoViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

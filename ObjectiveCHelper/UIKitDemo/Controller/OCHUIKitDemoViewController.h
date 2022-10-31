//
//  OCHUIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"

typedef NS_ENUM(NSUInteger, OCHUIKitDemo) {
    OCHUIKitDemoBeg,
    OCHUIKitDemoUIButton = OCHUIKitDemoBeg,
    OCHUIKitDemoUILabel,
    OCHUIKitDemoUICollectionView,
    OCHUIKitDemoUISearchbar,
    OCHUIKitDemoUIScrollView,
    OCHUIKitDemoUITableView,
    OCHUIKitDemoEnd,
};

NSArray<NSNumber *> *OCHUIKitDemoAllItems(void);
NSString *NSStringFromOCHUIKitDemo(OCHUIKitDemo item);
UIViewController *UIViewControllerFromOCHUIKitDemo(OCHUIKitDemo item);

typedef NS_ENUM(NSUInteger, OCHUIKitCustom) {
    OCHUIKitCustomBeg,
    OCHUIKitCustomValueStepper = OCHUIKitCustomBeg,
    OCHUIKitCustomEnd,
};

NSArray<NSNumber *> *OCHUIKitCustomAllItems(void);
NSString *NSStringFromOCHUIKitCustom(OCHUIKitCustom item);
UIViewController *UIViewControllerFromOCHUIKitCustom(OCHUIKitCustom item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHUIKitDemoViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

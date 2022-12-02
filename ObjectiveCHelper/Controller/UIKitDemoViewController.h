//
//  UIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UIKitDemoItem) {
    UIKitDemoItemBeg,
    UIKitDemoItemUIButton = UIKitDemoItemBeg,
    UIKitDemoItemUILabel,
    UIKitDemoItemUICollectionView,
    UIKitDemoItemUIPageControl,
    UIKitDemoItemUISearchbar,
    UIKitDemoItemUISearchController,
    UIKitDemoItemUIScrollView,
    UIKitDemoItemUITableView,
    UIKitDemoItemEnd,
};

NSArray<NSNumber *> *UIKitDemoItemAllCases(void);
NSString *NSStringFromUIKitDemo(UIKitDemoItem item);
UIViewController *UIViewControllerFromUIKitDemo(UIKitDemoItem item);

typedef NS_ENUM(NSUInteger, UIKitCustomItem) {
    UIKitCustomItemBeg,
    UIKitCustomItemValueStepper = UIKitCustomItemBeg,
    UIKitCustomItemPageViewController,
    UIKitCustomItemEnd,
};

NSArray<NSNumber *> *UIKitCustomItemAllCases(void);
NSString *NSStringFromUIKitCustomItem(UIKitCustomItem item);
UIViewController *UIViewControllerFromUIKitCustomItem(UIKitCustomItem item);

@interface UIKitDemoViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

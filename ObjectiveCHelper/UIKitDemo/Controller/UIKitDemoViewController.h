//
//  UIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"

typedef NS_ENUM(NSUInteger, UIKitDemoItem) {
    UIKitDemoItemBeg,
    UIKitDemoItemUIButton = UIKitDemoItemBeg,
    UIKitDemoItemUILabel,
    UIKitDemoItemUICollectionView,
    UIKitDemoItemUISearchbar,
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
    UIKitCustomItemEnd,
};

NSArray<NSNumber *> *UIKitCustomItemAllCases(void);
NSString *NSStringFromUIKitCustomItem(UIKitCustomItem item);
UIViewController *UIViewControllerFromUIKitCustomItem(UIKitCustomItem item);

NS_ASSUME_NONNULL_BEGIN

@interface UIKitDemoViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

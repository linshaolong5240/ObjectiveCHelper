//
//  OCHUIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"

typedef NS_ENUM(NSUInteger, OCHUIKitDemoItem) {
    OCHUIKitDemoItemBeg,
    OCHUIKitDemoItemUICollectionView = OCHUIKitDemoItemBeg,
    OCHUIKitDemoItemUISearchbar,
    OCHUIKitDemoItemUIScrollView,
    OCHUIKitDemoItemEnd,
};

NSArray<NSNumber *> * OCHUIKitDemoItemAllItems(void);
NSString * NSStringFromOCHUIKitDemoItem(OCHUIKitDemoItem item);
UIViewController * UIViewControllermOCHUIKitDemoItem(OCHUIKitDemoItem item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHUIKitDemoViewController : OCHContentViewController

@end

NS_ASSUME_NONNULL_END

//
//  OCHUIKitDemoViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHBaseViewController.h"

typedef NS_ENUM(NSUInteger, OCHUIKitDemoItem) {
    OCHUIKitDemoItemBeg,
    OCHUIKitDemoItemUIScrollView = OCHUIKitDemoItemBeg,
    OCHUIKitDemoItemEnd,
};

NSArray<NSNumber *> * OCHUIKitDemoItemAllItems(void);
NSString * NSStringFromOCHUIKitDemoItem(OCHUIKitDemoItem item);
UIViewController * UIViewControllermOCHUIKitDemoItem(OCHUIKitDemoItem item);

NS_ASSUME_NONNULL_BEGIN

@interface OCHUIKitDemoViewController : OCHBaseViewController

@end

NS_ASSUME_NONNULL_END

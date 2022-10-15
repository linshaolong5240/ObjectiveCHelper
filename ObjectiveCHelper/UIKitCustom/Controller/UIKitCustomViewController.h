//
//  UIKitCustomViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import "OCHBaseViewController.h"

typedef NS_ENUM(NSUInteger, UIKitCustom) {
    UIKitCustomBeg,
    UIKitCustomSteper = UIKitCustomBeg,
    UIKitCustomEnd,
};

NSArray<NSNumber *> * UIKitCustomAllItems(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIKitCustomViewController : OCHBaseViewController

@end

NS_ASSUME_NONNULL_END

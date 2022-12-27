//
//  FrameworkAppServicesController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AppServicesItem) {
    AppServicesItemContacts,
    AppServicesItemNumber,
};

@interface FrameworkAppServicesController : OCHBaseViewController

@end

NS_ASSUME_NONNULL_END

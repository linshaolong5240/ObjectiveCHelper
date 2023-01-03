//
//  QRCodeScanerViewController.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/3.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHBaseViewController.h"
@class QRCodeScanerViewController;
NS_ASSUME_NONNULL_BEGIN

@protocol QRCodeScannerViewControllerDelegate <NSObject>

- (void) qrcodeScanerViewController:(QRCodeScanerViewController *)qrcodeScanerViewController didDetect:(NSString *)message;

@end

@interface QRCodeScanerViewController : OCHBaseViewController

@property(nonatomic, weak) id<QRCodeScannerViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

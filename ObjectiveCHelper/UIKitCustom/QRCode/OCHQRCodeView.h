//
//  OCHQRCodeView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeHelper.h"

NS_ASSUME_NONNULL_BEGIN


@interface OCHQRCodeView : UIImageView

- (void)setMessageData:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale;

- (void)setMessageString:(NSString *)messageString inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scal;

@end

NS_ASSUME_NONNULL_END

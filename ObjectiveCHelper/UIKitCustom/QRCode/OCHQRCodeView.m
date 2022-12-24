//
//  OCHQRCodeView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHQRCodeView.h"
#import "QRCodeHelper.h"

@implementation OCHQRCodeView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)setMessageData:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale {
    self.image = [UIImage imageWithCGImage:[QRCodeHelper generateQRCodeWithInputMessage:data inputCorrection:level scale:scale]];
}

- (void)setMessageString:(NSString *)messageString inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale {
    self.image = [UIImage imageWithCGImage:[QRCodeHelper generateQRCodeWithString:messageString inputCorrection:level scale:scale]];
}

@end

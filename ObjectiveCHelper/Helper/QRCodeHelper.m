//
//  QRCodeHelper.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "QRCodeHelper.h"
#import <CoreImage/CoreImage.h>
#import <CoreImage/CIFilter.h>

NSString *NSStringFormQRCodeInputCorrectionLevel(QRCodeInputCorrectionLevel level) {
    switch (level) {
        case QRCodeInputCorrectionLevelL:
            return @"L";
            break;
        case QRCodeInputCorrectionLevelM:
            return @"M";
            break;
        case QRCodeInputCorrectionLevelQ:
            return @"Q";
            break;
        case QRCodeInputCorrectionLevelH:
            return @"H";
            break;
    }
}

@implementation QRCodeHelper

/// generateQRCode
/// - Parameters:
///   - data: inputMessage: The data to be encoded as a QR code. An Data object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel. Default value: M.
///   - scale: Image transform scale. Default value: 1.0.
/// - Returns: A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale {
    NSDictionary<NSString *, id> *inputParameters = @{@"inputMessage": data, @"inputCorrectionLevel": NSStringFormQRCodeInputCorrectionLevel(level)};
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator" withInputParameters:inputParameters];
    if (!filter) {
        return nil;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    CIImage *ciImage = [filter.outputImage imageByApplyingTransform:transform];
    if (!ciImage) {
        return nil;
    }
    
    CGImageRef cgImage = [[CIContext new] createCGImage:ciImage fromRect:ciImage.extent];
    if (!cgImage) {
        return nil;
    }
    
    return cgImage;
}

+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level {
    return [[self class] generateQRCodeWithInputMessage:data inputCorrection:level scale:1.0];
}

+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data {
    return [[self class] generateQRCodeWithInputMessage:data inputCorrection:(QRCodeInputCorrectionLevelM) scale:1.0];
}

+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    if (!data) {
        return nil;
    }
    return [[self class] generateQRCodeWithInputMessage:data inputCorrection:level scale:scale];
}

+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string inputCorrection:(QRCodeInputCorrectionLevel)level {
    return [[self class] generateQRCodeWithString:string inputCorrection:level scale:1.0];
}

+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string {
    return [[self class] generateQRCodeWithString:string inputCorrection:(QRCodeInputCorrectionLevelM) scale:1.0];
}

@end

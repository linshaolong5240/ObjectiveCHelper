//
//  QRCodeHelper.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The inputCorrectionLevel parameter controls the amount of additional data encoded in the output image to provide error correction. Higher levels of error correction result in larger output images but allow larger areas of the code to be damaged or obscured without. There are four possible correction modes (with corresponding error resilience levels):

 L: 7%

 M: 15%

 Q: 25%

 H: 30%
 */
typedef NS_ENUM(NSInteger, QRCodeInputCorrectionLevel) {
    QRCodeInputCorrectionLevelL,
    QRCodeInputCorrectionLevelM,
    QRCodeInputCorrectionLevelQ,
    QRCodeInputCorrectionLevelH,
};

typedef NS_ENUM(NSInteger, QRCodeDetectorAccuracy) {
    QRCodeDetectorAccuracyLow,
    QRCodeDetectorAccuracyHigh,
};

@interface QRCodeHelper : NSObject


/// generateQRCode
/// - Parameters:
///   - data: inputMessage: The data to be encoded as a QR code. An Data object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel.
///   - scale: Image transform scale.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale;

/// generateQRCode
/// - Parameters:
///   - data: inputMessage: The data to be encoded as a QR code. An Data object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel
///   - scale: Image transform scale. Default value: 1.0.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data inputCorrection:(QRCodeInputCorrectionLevel)level;

/// generateQRCode
/// - Parameters:
///   - data: inputMessage: The data to be encoded as a QR code. An Data object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel. Default value: M.
///   - scale: Image transform scale. Default value: 1.0.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithInputMessage:(NSData *)data;

/// generateQRCode
/// - Parameters:
///   - string: inputMessage: The String to be encoded as a QR code. An String object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel.
///   - scale: Image transform scale.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string inputCorrection:(QRCodeInputCorrectionLevel)level scale:(CGFloat)scale;

/// generateQRCode
/// - Parameters:
///   - string: inputMessage: The String to be encoded as a QR code. An String object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel. Default value: M.
///   - scale: Image transform scale.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string inputCorrection:(QRCodeInputCorrectionLevel)level;

/// generateQRCode
/// - Parameters:
///   - string: inputMessage: The String to be encoded as a QR code. An String object whose display name is Message.
///   - level: A single letter specifying the error correction format. An String whose display name is CorrectionLevel.
///   - scale: Image transform scale.
/// - Returns: CGImageRef. A Quartz 2D image. You are responsible for releasing the returned image when you no longer need it.
+ (nullable CGImageRef)generateQRCodeWithString:(NSString *)string;

+ (nullable NSString *)detectQRCodeWithCGImage:(CGImageRef)cgImage accuracy:(QRCodeDetectorAccuracy)accuracy;

@end

NS_ASSUME_NONNULL_END

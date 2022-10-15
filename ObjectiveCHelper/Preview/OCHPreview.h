//
//  OCHPreview.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YCAccessoryPriceInquiryOrderState) {
    YCAccessoryPriceInquiryOrderStateNoQuotation,           //未报价
    YCAccessoryPriceInquiryOrderStateAlreadyQuoted,         //已报价
    YCAccessoryPriceInquiryOrderStateCompleted,             //已完成
    YCAccessoryPriceInquiryOrderStateStoped,                //已停止
    YCAccessoryPriceInquiryOrderStateExpired,               //已过期
};

typedef NS_ENUM(NSUInteger, YCAccessoryPriceInquiryOrderButtonType) {
    YCAccessoryPriceInquiryOrderButtonTypeDetail,       //详情
    YCAccessoryPriceInquiryOrderButtonTypeStop,         //停止
    YCAccessoryPriceInquiryOrderButtonTypeDone,         //完成
    YCAccessoryPriceInquiryOrderButtonTypeRedo,         //重新报价
    YCAccessoryPriceInquiryOrderButtonTypeDelete,       //删除
};

NS_ASSUME_NONNULL_BEGIN

@interface OCHPreview : UIView

@end

NS_ASSUME_NONNULL_END

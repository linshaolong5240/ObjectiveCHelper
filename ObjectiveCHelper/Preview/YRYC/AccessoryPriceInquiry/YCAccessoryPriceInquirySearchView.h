//
//  YCAccessoryPriceInquirySearchView.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCAccessoryPriceInquirySearchView : UIView

@property(nonatomic, strong, readonly) UITextField *textField;
@property(nonatomic, strong, readonly) UIButton *rightButton;

- (void)setRightButtonWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END

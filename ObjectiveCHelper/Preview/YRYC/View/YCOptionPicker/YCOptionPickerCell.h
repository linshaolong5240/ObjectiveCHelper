//
//  YCOptionPickerCell.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCOptionPickerCell : UITableViewCell

@property(nonatomic, strong) UILabel *leftLabel;
@property(nonatomic, strong) UIButton *checkButton;

- (void)updateData:(NSString *)text;

@end

NS_ASSUME_NONNULL_END

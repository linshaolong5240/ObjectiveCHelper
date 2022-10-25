//
//  YCOptionPickerCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/25.
//

#import "YCOptionPickerCell.h"

@implementation YCOptionPickerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = UIColor.panelColor;
    [self configureContentView];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.checkButton.selected = selected;
}

- (void)configureContentView {
    UILabel *reasonLabel = [[UILabel alloc] init];
    reasonLabel.textColor = UIColor.mainTextColor;
    reasonLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.leftLabel = reasonLabel;
    
    UIButton *checkButton = [UIButton new];
    [checkButton setImage:[UIImage imageNamed:@"icon_button_unselect"] forState:UIControlStateNormal];
    [checkButton setImage:[UIImage imageNamed:@"icon_button_select"] forState:UIControlStateSelected];
    self.checkButton = checkButton;
        
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[reasonLabel, UIView.new, checkButton]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    
    [self.contentView addSubview:hstack];

    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(12, 12, 12, 12));
    }];
    
}

- (void)updateData:(NSString *)text {
    self.leftLabel.text = text;
}

@end

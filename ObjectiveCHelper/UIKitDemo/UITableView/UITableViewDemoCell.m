//
//  UITableViewDemoCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import "UITableViewDemoCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <Masonry/Masonry.h>

@interface UITableViewDemoCell ()

@property(nonatomic, strong, readwrite) UITableViewDemoCellData *data;

@end

@implementation UITableViewDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _stateLabel = [[UILabel alloc] init];
        _actionButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _data = [[UITableViewDemoCellData alloc] init];
        [self configureView];
        @weakify(self)
        [[RACObserve(self.data, state) takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(NSNumber *value) {
            @strongify(self)
            [self setState:[value integerValue]];
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureView {
    [self.actionButton setTitle:@"Action" forState:(UIControlStateNormal)];
    [self.actionButton addTarget:self action:@selector(actionButtonOnClicked:event:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[UIView.new, self.stateLabel, self.actionButton]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    hstack.spacing = 16;
    
    [self.contentView addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(12, 12, 12, 12));
    }];
}

- (void)setState:(UITableViewDemoCellDataStatus)state {
    self.stateLabel.text = NSStringFromUITableViewDemoCellDataStatus(state);
}

- (void)actionButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
    [self setState:(UITableViewDemoCellDataStatusTwo)];
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewDemoCellActionButtonOnClicked:)]) {
        [self.delegate tableViewDemoCellActionButtonOnClicked:self];
    }
}

- (void)fillWithData:(UITableViewDemoCellData *)data {
    self.data = data;
}

@end

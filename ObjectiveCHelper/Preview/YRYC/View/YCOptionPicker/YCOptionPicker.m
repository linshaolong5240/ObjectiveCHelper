//
//  YCOptionPicker.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/25.
//

#import "YCOptionPicker.h"
#import "YCOptionPickerCell.h"

@interface YCOptionPicker () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation YCOptionPicker

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.section = [YCTableSection<NSString *, NSString *> sectionWithLabel:@"" items:@[]];;
        [self configureContentView];
    }
    
    return self;
}

- (void)configureContentView {
    self.backgroundColor = UIColor.orangeColor;
    UITableView *tableView = [[UITableView alloc] init];
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    tableView.scrollEnabled = NO;
    tableView.rowHeight = 44;
    tableView.sectionHeaderHeight = 50;
    tableView.sectionFooterHeight = 110;
    tableView.separatorInset = UIEdgeInsetsMake(0, 12, 0, 12);
    [tableView registerClass:[YCOptionPickerCell class] forCellReuseIdentifier:NSStringFromClass([YCOptionPickerCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
    self.tableView = tableView;
}

// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.section.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCOptionPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YCOptionPickerCell class])];
    [cell updateData:self.section.items[indexPath.row]];
    return cell;
}

// MARK: - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *title = [UILabel new];
    title.text = self.section.label;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    
    return title;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIButton *cancelButton = [UIButton new];
    cancelButton.layer.cornerRadius = 6;
    cancelButton.layer.borderColor = UIColor.grayColor.CGColor;
    cancelButton.layer.borderWidth = 1;
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:UIColor.secondaryTextColor forState:UIControlStateNormal];
    cancelButton.tag = 0;
    [cancelButton addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *confirmButton = [UIButton new];
    confirmButton.layer.cornerRadius = 6;
    confirmButton.backgroundColor = UIColor.blueColor;
    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [confirmButton setTitleColor:UIColor.mainTextColor forState:UIControlStateNormal];
    confirmButton.tag = 1;
    [confirmButton addTarget:self action:@selector(buttonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];

    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[cancelButton, confirmButton]];
    hstack.spacing = 12;
    hstack.distribution = UIStackViewDistributionFillEqually;
    
    UIView *container = [UIView new];
    [container addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(33, 20, 33, 20));
    }];
    
    return container;
}

- (void)buttonOnClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"%s tag: %ld", __PRETTY_FUNCTION__, button.tag);
#endif
    
//    [FFPopup dismissPopupForView:self animated:YES];
    switch (button.tag) {
        case 0:
            
            break;
        case 1:
            break;
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  YCAccessoryPriceInquiryOrderBySupplierTableViewCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import "YCAccessoryPriceInquiryOrderBySupplierTableViewCell.h"
#import "YCAccessoryStore.h"
#import "YCAccessoryPriceInquiryOrderSupplierTableViewCell.h"
#import "YCAccessoryPriceInquiryOrderSupplierTableViewHeader.h"

typedef OCHTableSection<YCAccessoryStore *, YCCarAccessory *> SectionType;

@interface YCAccessoryPriceInquiryOrderBySupplierTableViewCell () <UITableViewDataSource, UITableViewDelegate>;

@property(nonatomic, strong) NSMutableArray<SectionType *> *sections;

@property(nonatomic, strong) UIStackView *container;

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation YCAccessoryPriceInquiryOrderBySupplierTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
}

- (void)configureContentView {
    UIView *panelView = [UIView new];
    panelView.backgroundColor = UIColor.panelBackground;
    panelView.layer.cornerRadius = 6;
    [self.contentView addSubview:panelView];
    [panelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(6, 6, 0, 6));
    }];
    
    self.container = [UIStackView new];
    self.container.axis = UILayoutConstraintAxisVertical;
    self.container.spacing = 12;
    
    [panelView addSubview:self.container];
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(panelView).insets(UIEdgeInsetsMake(12, 6, 0, 6));
    }];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"titleLabel";
    self.titleLabel.textColor = UIColor.mainText;
    self.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    [self.container addArrangedSubview:self.titleLabel];

    self.tableView = [UITableView new];
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    } else {
        // Fallback on earlier versions
    }
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsMultipleSelection = YES;
    self.tableView.rowHeight = 95;
    self.tableView.sectionHeaderHeight = 46;
    [self.tableView registerClass:[YCAccessoryPriceInquiryOrderSupplierTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YCAccessoryPriceInquiryOrderSupplierTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.container addArrangedSubview:self.tableView];
}


- (void)updateData:(NSDictionary *)model {
    self.titleLabel.text = model[@"title"];
    self.sections = model[@"items"];
    [self.tableView reloadData];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCAccessoryPriceInquiryOrderSupplierTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YCAccessoryPriceInquiryOrderSupplierTableViewCell class]) forIndexPath:indexPath];
    [cell updateData:self.sections[indexPath.section].items[indexPath.row]];
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YCAccessoryPriceInquiryOrderSupplierTableViewHeader *header = [YCAccessoryPriceInquiryOrderSupplierTableViewHeader new];
    [header updateData:self.sections[section].label];
    return header;
}


@end

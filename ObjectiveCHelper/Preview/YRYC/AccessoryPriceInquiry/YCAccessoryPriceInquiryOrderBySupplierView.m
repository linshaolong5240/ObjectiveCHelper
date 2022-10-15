//
//  YCAccessoryPriceInquiryOrderBySupplierView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import "YCAccessoryPriceInquiryOrderBySupplierView.h"
#import "YCAccessoryStore.h"
#import "YCCarAccessory.h"
#import "YCAccessoryPriceInquiryOrderBySupplierTableViewCell.h"

typedef OCHTableSection<YCAccessoryStore *, YCCarAccessory *> SubSectionType;
typedef OCHTableSection<NSString *, NSDictionary *> SectionType;

@interface YCAccessoryPriceInquiryOrderBySupplierView () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) SectionType *section;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation YCAccessoryPriceInquiryOrderBySupplierView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    NSArray<SubSectionType *> *subSections1 = @[
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
    ];
    
    NSArray<SubSectionType *> *subSections2 = @[
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
    ];
    NSArray<SubSectionType *> *subSections3 = @[
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
        [SubSectionType sectionWithLabel:[YCAccessoryStore storeWithName:@"福州昌威汽配" locationString:@"福建-福州-晋安区"] items:@[
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
            [YCCarAccessory accseeoryWithName:@"后桥梁总成" oem:@"5174632370" quality:@"品牌件" warranty:@"12个月"],
        ]],
    ];
    
    NSDictionary *item1 = @{@"title": @"同城供应商 （福州）", @"items":subSections1};
    NSDictionary *item2 = @{@"title": @"同省供应商 （福建）", @"items":subSections2};
    NSDictionary *item3 = @{@"title": @"跨省供应商 （国内）", @"items":subSections3};

    self.section = [SectionType sectionWithLabel:nil items:@[item1, item2, item3]];
    [self configureContentView];
    return self;
}

- (void)configureContentView {
    self.tableView = [UITableView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerClass:[YCAccessoryPriceInquiryOrderBySupplierTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YCAccessoryPriceInquiryOrderBySupplierTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.section.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCAccessoryPriceInquiryOrderBySupplierTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YCAccessoryPriceInquiryOrderBySupplierTableViewCell class]) forIndexPath:indexPath];
    NSDictionary *item = self.section.items[indexPath.row];
    [cell updateData:item];
    cell.backgroundColor = UIColor.systemPinkColor;
    return  cell;
}

// MARK: - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.section.items[indexPath.row];
    NSArray<SubSectionType *> *subSections = item[@"items"];
    
    CGFloat subsectionHeight = 46.0 * subSections.count;
    NSInteger cellCount = 0;
    for(SubSectionType *section in subSections) {
        cellCount += section.items.count;
    }
    CGFloat cellHeight = 95.0 * cellCount;
    CGFloat tableHeight = cellHeight + subsectionHeight;
    return 6 + tableHeight + 12 + 17 + 12;
}

// MARK: - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  YCAccessoryPrecurementCategoryTableView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/9.
//

#import "YCAccessoryPrecurementCategoryTableView.h"
#import "JXCategoryView.h"
#import "YCAccessoryPrecurementCategoryTableViewCell.h"

@interface YCAccessoryPrecurementCategoryTableView () <JXCategoryListContentViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation YCAccessoryPrecurementCategoryTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.items = @[
            @{@"storeName":@"福州昌威汽配", @"storeLocation":@"区域：福州-晋安区", @"productName":@"国行/大陆 美孚 美孚1号 金装 0W-"},
            @{@"storeName":@"福州昌威汽配", @"storeLocation":@"区域：福州-晋安区", @"productName":@"国行/大陆 美孚 美孚1号 金装 0W-"},
            ].mutableCopy;
        [self configureContentView];
    } else {
        return nil;
    }
    
    return self;
}

- (void)configureContentView {
    self.backgroundColor = UIColor.orangeColor;
    self.tableView = [UITableView new];
    self.tableView.rowHeight = 115;
//    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:YCAccessoryPrecurementCategoryTableViewCell.class forCellReuseIdentifier:NSStringFromClass([YCAccessoryPrecurementCategoryTableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
}

// MARK: - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self;
}

// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YCAccessoryPrecurementCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YCAccessoryPrecurementCategoryTableViewCell class])];
    [cell updateData:self.items[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"didSelectRowAtIndexPath: %@]", indexPath);
#endif
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  OCHThirdPartyViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "OCHThirdPartyViewController.h"
#import "OCHTableSection.h"
#import "JXCategoryViewDemoViewController.h"
#import "OCHDVPieChartDemoViewController.h"
#import "MJRefreshDemoViewController.h"
#import "OneMapKitDemoViewController.h"
#import "ReactiveObjCDemoViewController.h"

@interface OCHThirdPartyViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHTableSection<NSString *, NSArray<NSNumber *> *> *> *sections;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation OCHThirdPartyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[[[OCHTableSection alloc] initWithLabel:nil value:OCHTirdPartyItemAllItems()]];
    [self configureContentView];
}

- (void)configureContentView {
    [self configureTableView];
}

- (void)configureTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

//MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].value.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSStringFromOCHTirdPartyItem(self.sections[indexPath.section].value[indexPath.row].unsignedIntegerValue);
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].label;
}

//MARK: UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = UIViewControllerFromOCHTirdPartyItem(indexPath.row);
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


NSArray<NSNumber *> * OCHTirdPartyItemAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = 0; i < OCHTirdPartyItemEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString * NSStringFromOCHTirdPartyItem(OCHThirdPartyItem item) {
    switch (item) {
        case OCHTirdPartyItemDVPieChart:
            return @"OCHTirdPartyItemDVPieChart";
        case OCHTirdPartyItemJXCategoryView:
            return @"OCHTirdPartyItemJXCategoryView";
            break;
        case OCHTirdPartyItemMJRefresh:
            return @"OCHTirdPartyItemMJRefresh";
            break;
        case OCHTirdPartyItemOneMapKit:
            return @"OCHTirdPartyItemOneMapKit";
            break;
        case OCHTirdPartyItemReactiveObjC:
            return @"OCHTirdPartyItemReactiveObjC";
            break;
        case OCHTirdPartyItemEnd:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromOCHTirdPartyItem(OCHThirdPartyItem item) {
    switch (item) {
        case OCHTirdPartyItemJXCategoryView:
            return [[JXCategoryViewDemoViewController alloc] init];
            break;
        case OCHTirdPartyItemDVPieChart:
            return [[OCHDVPieChartDemoViewController alloc] init];
            break;
        case OCHTirdPartyItemMJRefresh:
            return [[MJRefreshDemoViewController alloc] init];
            break;
        case OCHTirdPartyItemOneMapKit:
            return [[OneMapKitDemoViewController alloc] init];
            break;
        case OCHTirdPartyItemReactiveObjC:
            return [[ReactiveObjCDemoViewController alloc] init];
            break;
        case OCHTirdPartyItemEnd:
            return [[UIViewController alloc] init];
    }
}

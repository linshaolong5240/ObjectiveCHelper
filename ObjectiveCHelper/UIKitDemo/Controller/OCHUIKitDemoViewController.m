//
//  OCHUIKitDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHUIKitDemoViewController.h"
#import "OCHTableSection.h"

#import "UICollectionViewDemoController.h"
#import "UIKitUISearchbarDemoViewController.h"
#import "UIScrollViewDemoController.h"
#import "UITableViewDemoViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface OCHUIKitDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHTableSection<NSString *, NSNumber *> *> *sections;
@property(nonatomic, strong) UITableView *tableView;

@end
NS_ASSUME_NONNULL_END

@implementation OCHUIKitDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[[[OCHTableSection alloc] initWithLabel:nil items:OCHUIKitDemoAllItems()]];
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

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSStringFromOCHUIKitDemo(self.sections[indexPath.section].items[indexPath.row].unsignedIntegerValue);
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].label;
}

// MARK: - UITableViewDataDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = UIViewControllermOCHUIKitDemo(indexPath.row);
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

NSArray<NSNumber *> * OCHUIKitDemoAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = OCHUIKitDemoBeg; i < OCHUIKitDemoEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString * NSStringFromOCHUIKitDemo(OCHUIKitDemo item) {
    switch (item) {
        case OCHUIKitDemoUICollectionView:
            return @"OCHUIKitDemoItemUICollectionView";
        case OCHUIKitDemoUISearchbar:
            return @"OCHUIKitDemoItemUISearchbar";
        case OCHUIKitDemoUIScrollView:
            return @"OCHUIKitDemoItemUIScrollView";
            break;
        case OCHUIKitDemoUITableView:
            return @"OCHUIKitDemoUITableView";
        default:
            return @"";
            break;
    }
}

UIViewController * UIViewControllermOCHUIKitDemo(OCHUIKitDemo item) {
    switch (item) {
        case OCHUIKitDemoUICollectionView:
            return [UICollectionViewDemoController new];
            break;;
        case OCHUIKitDemoUISearchbar:
            return [UIKitUISearchbarDemoViewController new];
            break;
        case OCHUIKitDemoUIScrollView:
            return [[UIScrollViewDemoController alloc] init];
            break;
        case OCHUIKitDemoUITableView:
            return [[UITableViewDemoViewController alloc] init];
            break;
        default:
            return nil;
            break;
    }
}

//
//  OCHUIKitDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHUIKitDemoViewController.h"
#import "OCHSection.h"
#import "OCHUIScrollViewDemoController.h"

NS_ASSUME_NONNULL_BEGIN
@interface OCHUIKitDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHSection<NSNumber *> *> *sections;
@property(nonatomic, strong) UITableView *tableView;

@end
NS_ASSUME_NONNULL_END

@implementation OCHUIKitDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[[[OCHSection alloc] initWithTitle:nil items:OCHUIKitDemoItemAllItems()]];
    [self configureContentView];
}

- (void)configureContentView {
    [self configureTableView];
}

- (void)configureTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.reusedIdentifer];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

//MARK: UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.reusedIdentifer forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSStringFromOCHUIKitDemoItem(self.sections[indexPath.section].items[indexPath.row].unsignedIntegerValue);
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].title;
}

//MARK: UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = UIViewControllermOCHUIKitDemoItem(indexPath.row);
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

NSArray<NSNumber *> * OCHUIKitDemoItemAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = 0; i < OCHUIKitDemoItemEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString * NSStringFromOCHUIKitDemoItem(OCHUIKitDemoItem item) {
    switch (item) {
        case OCHUIKitDemoItemUIScrollView:
            return @"OCHUIKitDemoItemUIScrollView";
            break;
        default:
            return @"";
            break;
    }
}

UIViewController * UIViewControllermOCHUIKitDemoItem(OCHUIKitDemoItem item) {
    switch (item) {
        case OCHUIKitDemoItemUIScrollView:
            return [[OCHUIScrollViewDemoController alloc] init];
            break;
        default:
            return nil;
            break;
    }
}

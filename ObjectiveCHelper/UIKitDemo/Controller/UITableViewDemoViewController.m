//
//  UITableViewDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/19.
//

#import "UITableViewDemoViewController.h"
#import "UITableViewDemoTableViewCell.h"

@interface UITableViewDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation UITableViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITableView";
    self.sections = @[
        [OCHTableSection sectionWithLabel:@"section1" value:UIColor.colorItems],
        [OCHTableSection sectionWithLabel:@"section2" value:UIColor.colorItems],
    ].mutableCopy;
    [self configureContentView];
}

- (void)configureContentView {
    [self configureTableView];
}

- (void)configureTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 100;
    }
    [tableView registerClass:[UITableViewDemoTableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewDemoTableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].value.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewDemoTableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"section:%ld, row: %ld", indexPath.section, indexPath.row];
    cell.backgroundColor = self.sections[indexPath.section].value[indexPath.row];
    return cell;
}

// MARK: - UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"%s indexPath:%@", __PRETTY_FUNCTION__, indexPath);
#endif
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *header = [UILabel new];
    header.text = @"header";
    header.backgroundColor = UIColor.blueColor;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *header = [UILabel new];
    header.text = @"footer";
    header.backgroundColor = UIColor.blueColor;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  50;
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

//
//  AppFrameworkViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/2/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "AppFrameworkViewController.h"

typedef NS_ENUM(NSInteger, AppFrameworkItem) {
    AppFrameworkItemUIKit,
    AppFrameworkItemNumber,
};

NSString *NSStringFromAppFrameworkItem(AppFrameworkItem item) {
    switch (item) {
        case AppFrameworkItemUIKit:
            return @"AppFrameworkItemUIKit";
            break;
        case AppFrameworkItemNumber:
            return @"AppFrameworkItemNumber";
            break;
    }
}

@interface AppFrameworkViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation AppFrameworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"App Framework";
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return AppFrameworkItemNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromAppFrameworkItem(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    
    switch (indexPath.row) {
        case AppFrameworkItemUIKit:
        {
//            vc = [[ContactsViewController alloc] init];
        }
            break;
        case AppFrameworkItemNumber:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end

//
//  FrameworkViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/27.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "FrameworkViewController.h"

#import "AppFrameworkViewController.h"
#import "FrameworkAppServicesController.h"
#import "FrameworkSystemViewController.h"

typedef NS_ENUM(NSInteger, FrameworkType) {
    FrameworkTypeAppFrameworks,
    FrameworkTypeAppServices,
    FrameworkTypeSystem,
    FrameworkTypeNumber,
};

NSString *NSStringFromFrameworkType(FrameworkType type) {
    switch (type) {
        case FrameworkTypeAppFrameworks:
            return @"App Framework";
            break;
        case FrameworkTypeAppServices:
            return @"App Services";
            break;
        case FrameworkTypeSystem:
            return @"System";
            break;
        case FrameworkTypeNumber:
            return @"FrameworkTypeNumber";
            break;
    }
}

@interface FrameworkViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FrameworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 100;
    }
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return FrameworkTypeNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromFrameworkType(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    FrameworkType type = indexPath.row;
    switch (type) {
        case FrameworkTypeAppFrameworks:
        {
            vc = [AppFrameworkViewController new];
        }
            break;
        case FrameworkTypeAppServices:
        {
            vc = [FrameworkAppServicesController new];
        }
            break;
        case FrameworkTypeSystem:
        {
            vc = [FrameworkSystemViewController new];
        }
            break;
        case FrameworkTypeNumber:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end

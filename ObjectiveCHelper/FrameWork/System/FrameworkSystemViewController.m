//
//  FrameworkSystemViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/27.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "FrameworkSystemViewController.h"

#import "FrameworkSystemDispatchViewController.h"

typedef NS_ENUM(NSInteger, FrameworkSystemType) {
    FrameworkSystemTypeDispatch,
    FrameworkSystemTypeNumer,
};

NSString *NSStringFromFrameworkSystemType(FrameworkSystemType type) {
    switch (type) {
        case FrameworkSystemTypeDispatch:
            return @"Dispatch";
            break;
        case FrameworkSystemTypeNumer:
            return @"FrameworkSystemTypeNumer";
            break;
    }
}

@interface FrameworkSystemViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FrameworkSystemViewController

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
    return FrameworkSystemTypeNumer;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromFrameworkSystemType(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    FrameworkSystemType type = indexPath.row;
    switch (type) {
        case FrameworkSystemTypeDispatch:
        {
            vc = [FrameworkSystemDispatchViewController new];
        }
            break;
        case FrameworkSystemTypeNumer:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end

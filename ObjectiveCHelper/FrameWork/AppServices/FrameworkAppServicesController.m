//
//  FrameworkAppServicesController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "FrameworkAppServicesController.h"
#import "ContactsViewController.h"

NSString *NSStringFromAppServicesItem(AppServicesItem item) {
    switch (item) {
        case AppServicesItemContacts:
            return @"Contacts";
            break;
        case AppServicesItemNumber:
            return @"";
            break;
    }
}

@interface FrameworkAppServicesController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FrameworkAppServicesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"App Services";
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
    return AppServicesItemNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromAppServicesItem(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    
    switch (indexPath.row) {
        case AppServicesItemContacts:
        {
            vc = [[ContactsViewController alloc] init];
        }
            break;
        case AppServicesItemNumber:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end

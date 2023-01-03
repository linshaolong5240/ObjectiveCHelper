//
//  OCHFeatureViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/3.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHFeatureViewController.h"

typedef NS_ENUM(NSInteger, OCHFeatureItem) {
    OCHToolQRCode,
    OCHToolNumber
};

NSString *NSStringFromFeatureItem(OCHFeatureItem item) {
    switch (item) {
        case OCHToolQRCode:
            return @"QRCode";
            break;
        case OCHToolQRCodeScaner:
            return @"QRCode";
            break;
        case OCHToolNumber:
            return @"OCHToolNumber";
            break;;
    }
}

@interface OCHFeatureViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OCHFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"Feature";
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
    return OCHToolNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = NSStringFromFeatureItem(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    OCHFeatureItem item = indexPath.row;
    switch (item) {
        case OCHToolQRCode:
        {
            
        }
            break;
        case OCHToolNumber:
            break;;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


@end

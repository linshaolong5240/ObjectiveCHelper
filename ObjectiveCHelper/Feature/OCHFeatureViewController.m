//
//  OCHFeatureViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/3.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHFeatureViewController.h"
#import "QRCodeViewController.h"
#import "QRCodeScanerViewController.h"

typedef NS_ENUM(NSInteger, OCHFeatureItem) {
    OCHToolQRCode,
    OCHToolQRCodeScaner,
    OCHToolNumber
};

NSString *NSStringFromFeatureItem(OCHFeatureItem item) {
    switch (item) {
        case OCHToolQRCode:
            return @"QRCode";
            break;
        case OCHToolQRCodeScaner:
            return @"QRCode Scaner";
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    OCHFeatureItem item = indexPath.row;
    switch (item) {
        case OCHToolQRCode:
        {
            vc = [QRCodeViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case OCHToolQRCodeScaner:
        {
            vc = [QRCodeScanerViewController new];
            vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case OCHToolNumber:
            break;;
    }
}


@end
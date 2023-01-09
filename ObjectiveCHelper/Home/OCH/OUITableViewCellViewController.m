//
//  OUITableViewCellViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellViewController.h"

typedef NS_ENUM(NSInteger, OUITableViewCellType) {
    OUITableViewCellTypeTextSwitch,
    OUITableViewCellTypeNumber,
};

NSString *NSStringFromOUITableViewCellType(OUITableViewCellType type) {
    switch (type) {
        case OUITableViewCellTypeTextSwitch:
            return @"OUITableViewCellTypeTextSwitch";
            break;
        case OUITableViewCellTypeNumber:
            return @"OUITableViewCellTypeNumber";
            break;
    }
}

@interface OUITableViewCellViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OUITableViewCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [UITableView new];
    tableView.backgroundColor = UIColor.clearColor;
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return OUITableViewCellTypeNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

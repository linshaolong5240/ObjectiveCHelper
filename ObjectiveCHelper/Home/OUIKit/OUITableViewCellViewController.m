//
//  OUITableViewCellViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellViewController.h"
#import "OUITextSwitchTableViewCell.h"

typedef NS_ENUM(NSInteger, OUITableViewCellType) {
    OUITableViewCellTypeTextSwitch,
    OUITableViewCellTypeNumber,
};

NSString *NSStringFromOUITableViewCellType(OUITableViewCellType type) {
    switch (type) {
        case OUITableViewCellTypeTextSwitch:
            return @"Text Switch";
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
    self.title = @"OUITableViewCell";
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = UIColor.clearColor;
    [tableView registerClass:[OUITextSwitchTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OUITextSwitchTableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (void)switcherValueOnChanged:(OUITextSwitchTableViewCell *)cell {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (cell.switcher.on) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cell.data.on = NO;
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cell.data.on = YES;
        });
    }
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return OUITableViewCellTypeNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OUITableViewCellType type = indexPath.row;
    switch (type) {
        case OUITableViewCellTypeTextSwitch:
        {
            OUITextSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OUITextSwitchTableViewCell class]) forIndexPath:indexPath];
            cell.selectorDelegate = self;
            [cell fillWithData:[OUITextSwitchTableViewCellData dataWithTitle:@"Text Switch" on:YES selector:@selector(switcherValueOnChanged:)]];
            return cell;
        }
            break;
        case OUITableViewCellTypeNumber:
            return [UITableViewCell new];
            break;
    }
    return [UITableViewCell new];
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

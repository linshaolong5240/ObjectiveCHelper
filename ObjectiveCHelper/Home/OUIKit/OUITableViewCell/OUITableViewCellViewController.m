//
//  OUITableViewCellViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUITableViewCellViewController.h"
#import "OUILabelCheckmarkTableViewCell.h"
#import "OUILabelCheckmarkTableViewController.h"
#import "OUILabelStepperTableViewCell.h"
#import "OUILabelSwitchTableViewCell.h"

typedef NS_ENUM(NSInteger, OUITableViewCellType) {
    OUITableViewCellTypeLabelCheckmark,
    OUITableViewCellTypeLabelStepper,
    OUITableViewCellTypeTextSwitch,
    OUITableViewCellTypeNumber,
};

NSString *NSStringFromOUITableViewCellType(OUITableViewCellType type) {
    switch (type) {
        case OUITableViewCellTypeLabelCheckmark:
            return @"Label Checkmark";
            break;
        case OUITableViewCellTypeLabelStepper:
            return @"Label Stepper";
            break;
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [tableView registerClass:[OUILabelCheckmarkTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OUILabelCheckmarkTableViewCell class])];
    [tableView registerClass:[OUILabelStepperTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OUILabelStepperTableViewCell class])];
    [tableView registerClass:[OUILabelSwitchTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OUILabelSwitchTableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (void)switcherValueOnChanged:(OUILabelSwitchTableViewCell *)cell {
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
        case OUITableViewCellTypeLabelCheckmark:
        {
            OUILabelCheckmarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OUILabelCheckmarkTableViewCell class]) forIndexPath:indexPath];
            [cell fillWithData:[OUILabelCheckmarkTableViewCellData dataWithText:NSStringFromOUITableViewCellType(type) selected:YES]];
            return cell;
        }
            break;
        case OUITableViewCellTypeLabelStepper:
        {
            OUILabelStepperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OUILabelStepperTableViewCell class]) forIndexPath:indexPath];
            [cell fillWithData:[OUILabelStepperTableViewCellData dataWithText:NSStringFromOUITableViewCellType(type) minimumValue:0 maximumValue:100 stepValue:1 value:1]];
            return cell;
        }
            break;
        case OUITableViewCellTypeTextSwitch:
        {
            OUILabelSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OUILabelSwitchTableViewCell class]) forIndexPath:indexPath];
            cell.selectorDelegate = self;
            [cell fillWithData:[OUILabelSwitchTableViewCellData dataWithTitle:NSStringFromOUITableViewCellType(type) on:YES selector:@selector(switcherValueOnChanged:)]];
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
    NSLog(@"%s", __PRETTY_FUNCTION__);
    OUITableViewCellType type = indexPath.row;
    switch (type) {
        case OUITableViewCellTypeLabelCheckmark:
        {
            OUILabelCheckmarkTableViewController *vc = [OUILabelCheckmarkTableViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case OUITableViewCellTypeLabelStepper:
            break;
        case OUITableViewCellTypeTextSwitch:
            break;
        case OUITableViewCellTypeNumber:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end

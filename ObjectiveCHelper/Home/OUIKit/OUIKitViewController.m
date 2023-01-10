//
//  OUIKitViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIKitViewController.h"
#import "OCHStringArraySection.h"

#import "OUITableViewCellViewController.h"
#import "OUIAlertControllerExample.h"

typedef NS_ENUM(NSInteger, OUIKitItem) {
    OUIKitItemTableViewCell,
    OUIKitItemAlertController,
    OUIKitItemNumber,
};

NSArray<NSNumber *> *OUIKitItemAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < OUIKitItemNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

NSString *NSStringFromOUISection(OUIKitItem item) {
    switch (item) {
        case OUIKitItemTableViewCell:
            return @"OUITableViewCell";
            break;
        case OUIKitItemAlertController:
            return @"OUIAlertController";
            break;
        case OUIKitItemNumber:
            return @"OUIKitItemNumber";
            break;
    }
}

@interface OUIKitViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHStringArraySection<NSNumber *> *> *sections;

@end

@implementation OUIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[[OCHStringArraySection<NSNumber *> sectionWithTitle:@"OUIKit" items:OUIKitItemAllCases()]];
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];;
    tableView.backgroundColor = UIColor.clearColor;
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    OUIKitItem item = indexPath.row;
    cell.textLabel.text = NSStringFromOUISection(item);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OUIKitItem item = indexPath.row;
    switch (item) {
        case OUIKitItemTableViewCell:
        {
            OUITableViewCellViewController *vc = [OUITableViewCellViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case OUIKitItemAlertController:
        {
            OUIAlertControllerExample *vc = [OUIAlertControllerExample new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case OUIKitItemNumber:
            break;
    }
}

@end

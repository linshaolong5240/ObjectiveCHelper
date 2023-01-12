//
//  OUILabelCheckmarkTableViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/12.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelCheckmarkTableViewController.h"
#import "OUILabelCheckmarkTableViewCell.h"

@interface OUILabelCheckmarkTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OUILabelCheckmarkTableViewCellData *> *items;

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation OUILabelCheckmarkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OUILabelCheckmark";
    self.items = @[
        [OUILabelCheckmarkTableViewCellData dataWithText:@"1" selected:NO],
        [OUILabelCheckmarkTableViewCellData dataWithText:@"2" selected:YES],
        [OUILabelCheckmarkTableViewCellData dataWithText:@"3" selected:NO],
        [OUILabelCheckmarkTableViewCellData dataWithText:@"4" selected:NO],
        [OUILabelCheckmarkTableViewCellData dataWithText:@"5" selected:NO],
    ];
    [self configureView];
    
    for(NSInteger index = 0; index < self.items.count; index++) {
        if (self.items[index].selected) {
            [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:NO scrollPosition:(UITableViewScrollPositionTop)];
        }
    }
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = UIColor.clearColor;
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    tableView.allowsMultipleSelection = YES;
    [tableView registerClass:[OUILabelCheckmarkTableViewCell class] forCellReuseIdentifier:NSStringFromClass([OUILabelCheckmarkTableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OUILabelCheckmarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OUILabelCheckmarkTableViewCell class]) forIndexPath:indexPath];
    [cell fillWithData:self.items[indexPath.row]];
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

//
//  UIModalPresentationStyleDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/12.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIModalPresentationStyleDemoViewController.h"
#import <Masonry/Masonry.h>

#import "UIModalPresentationStyleViewController.h"

NSArray<NSNumber *> *UIModalPresentationStyleAllCases(void) {
    if (@available(iOS 13.0, *)) {
        return @[
            @(UIModalPresentationFullScreen),
            @(UIModalPresentationPageSheet),
            @(UIModalPresentationFormSheet),
            @(UIModalPresentationCurrentContext),
            @(UIModalPresentationCustom),
            @(UIModalPresentationOverFullScreen),
            @(UIModalPresentationOverCurrentContext),
            @(UIModalPresentationPopover),
#if TARGET_OS_TV
            @(UIModalPresentationBlurOverFullScreen),
#endif
            @(UIModalPresentationNone),
            @(UIModalPresentationAutomatic),
        ];
    } else {
        // Fallback on earlier versions
        return @[
            @(UIModalPresentationFullScreen),
            @(UIModalPresentationPageSheet),
            @(UIModalPresentationFormSheet),
            @(UIModalPresentationCurrentContext),
            @(UIModalPresentationCustom),
            @(UIModalPresentationOverFullScreen),
            @(UIModalPresentationOverCurrentContext),
            @(UIModalPresentationPopover),
#if TARGET_OS_TV
            @(UIModalPresentationBlurOverFullScreen),
#endif
            @(UIModalPresentationNone),
        ];
    }
}

@interface UIModalPresentationStyleDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<NSNumber *> *items;

@end

@implementation UIModalPresentationStyleDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = UIModalPresentationStyleAllCases();
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] init];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    UIModalPresentationStyle style = self.items[indexPath.row].integerValue;
    cell.textLabel.text = NSStringFromUIModalPresentationStyle(style);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIModalPresentationStyleViewController *vc = [[UIModalPresentationStyleViewController alloc] init];
    UIModalPresentationStyle style = self.items[indexPath.row].integerValue;
    vc.modalPresentationStyle = style;
    [self presentViewController:vc animated:true completion:nil];
}

@end

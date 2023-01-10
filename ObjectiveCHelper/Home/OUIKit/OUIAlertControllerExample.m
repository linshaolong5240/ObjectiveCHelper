//
//  OUIAlertControllerExample.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/10.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIAlertControllerExample.h"
#import "OUIAlertController.h"

typedef NS_ENUM(NSInteger, OUIAlertControllerItem) {
    OUIAlertControllerItem1,
    OUIAlertControllerItem2,
    OUIAlertControllerItem3,
    OUIAlertControllerItemNumber,
};

NSString *NSStringFromOUIAlertControllerItem(OUIAlertControllerItem item) {
    switch (item) {
        case OUIAlertControllerItem1:
            return @"OUIAlertControllerItem1";
            break;
        case OUIAlertControllerItem2:
            return @"OUIAlertControllerItem2";
            break;
        case OUIAlertControllerItem3:
            return @"OUIAlertControllerItem3";
            break;
        case OUIAlertControllerItemNumber:
            return @"OUIAlertControllerItemNumber";
            break;
    }
}

NSArray<NSNumber *> *OUIAlertControllerItemAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < OUIAlertControllerItemNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

@interface OUIAlertControllerExample () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OUIAlertControllerExample

- (void)dealloc {
    NSLog(@"OUIAlertControllerExample dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OUIAlertController";
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return OUIAlertControllerItemAllCases().count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSStringFromOUIAlertControllerItem(indexPath.row);
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OUIAlertAction *a1 = [OUIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(OUIAlertAction * _Nonnull action) {
        self.title = @"OUIAlertAction";
    }];
    OUIAlertAction *a2 = [OUIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(OUIAlertAction * _Nonnull action) {
        self.title = @"OUIAlertAction";
    }];
    OUIAlertAction *a3 = [OUIAlertAction actionWithTitle:@"Delete" style:(UIAlertActionStyleDestructive) handler:^(OUIAlertAction * _Nonnull action) {
        self.title = @"OUIAlertAction";
    }];

    OUIAlertControllerItem item = indexPath.row;
    switch (item) {
        case OUIAlertControllerItem1:
        {
            OUIAlertController *vc = [OUIAlertController alertControllerWithTitle:@"Title" message:@"MessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessage"];
            [vc addAction:a1];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case OUIAlertControllerItem2:
        {
            OUIAlertController *vc = [OUIAlertController alertControllerWithTitle:@"Title" message:@"Message"];
            [vc addAction:a1];
            [vc addAction:a2];

            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case OUIAlertControllerItem3:
        {
            OUIAlertController *vc = [OUIAlertController alertControllerWithTitle:@"Title" message:@"Message"];
            [vc addAction:a1];
            [vc addAction:a2];
            [vc addAction:a3];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case OUIAlertControllerItemNumber:
            break;
    }
}

@end

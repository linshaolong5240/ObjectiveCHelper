//
//  OCHMapDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/3.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHMapDemoViewController.h"
#import "OCHBaiduMapViewController.h"
#import "OCHTencentMapViewController.h"
#import "OCHAMapViewController.h"
#import "OCHMapViewController.h"

typedef NS_ENUM(NSUInteger, YCMapItem) {
    YCMapItemAMap,
    YCMapItemBaidu,
    YCMapItemTencent,
    YCMapItemOCHMap,
    YCMapItemNumber,
};

NSString *NSStringFromYCMapItem(YCMapItem type) {
    switch (type) {
        case YCMapItemAMap:
            return @"A Map";
        case YCMapItemBaidu:
            return @"Baidu Map";
            break;
        case YCMapItemTencent:
            return @"Tencent Map";
            break;
        case YCMapItemOCHMap:
            return @"OCH Map";
            break;
        default:
            return @"";
            break;
    }
}

UIViewController *UIViewControllerFromYCMapItem(YCMapItem type) {
    switch (type) {
        case YCMapItemAMap:
            return [[OCHAMapViewController alloc] init];
            break;
        case YCMapItemBaidu:
            return [[OCHBaiduMapViewController alloc] init];
            break;
        case YCMapItemTencent:
            return [[OCHTencentMapViewController alloc] init];
            break;
        case YCMapItemOCHMap:
            return [[OCHMapViewController alloc] init];
            break;
        default:
            return [[UIViewController alloc] init];
            break;
    }
}


@interface OCHMapDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OCHMapDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Map Demo";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return YCMapItemNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = NSStringFromYCMapItem(indexPath.row);
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
    
    UIViewController *vc = UIViewControllerFromYCMapItem(indexPath.row);
    [self.navigationController pushViewController:vc animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

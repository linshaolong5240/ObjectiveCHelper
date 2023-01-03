//
//  UIKitUISearchbarDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "UIKitUISearchbarDemoViewController.h"
@import Masonry;

@interface UIKitUISearchbarDemoViewController ()

@property(nonatomic, strong) UISearchBar *searchBar;

@end

@implementation UIKitUISearchbarDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureSearchBar];
}

- (void)configureSearchBar {
    UISearchBar *searchBar = [UISearchBar new];
    searchBar.backgroundColor = UIColor.orangeColor;
    self.searchBar = searchBar;
    [self.contentView addArrangedSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(100);
    }];
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

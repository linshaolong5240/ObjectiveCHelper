//
//  OCHScrollContentViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "OCHScrollContentViewController.h"

@interface OCHScrollContentViewController ()

@end

@implementation OCHScrollContentViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _scrollView = [UIScrollView new];
        _scrollContentView = [UIStackView new];
    }
    
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    
    self.scrollContentView.axis = UILayoutConstraintAxisVertical;
    self.scrollContentView.spacing = 6;
    [self.scrollView addSubview:self.scrollContentView];
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
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

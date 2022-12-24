//
//  OCHContentViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHContentViewController.h"
#import <Masonry.h>

@interface OCHContentViewController ()

@end

@implementation OCHContentViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    _contentView = [[UIStackView alloc] init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentView.axis = UILayoutConstraintAxisVertical;
    self.contentView.spacing = 10;
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).inset(10);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).inset(10);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).inset(10);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).inset(10);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).inset(10);
            make.left.right.equalTo(self.view).inset(10);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop).inset(10);
        }
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

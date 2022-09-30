//
//  OCHUIScrollViewController.m
//  ObjectiveCHelper
//
//  Created by Apple on 2022/9/30.
//

#import "OCHUIScrollViewController.h"

@interface OCHUIScrollViewController ()

@property(nonatomic, strong) UIScrollView* scrollView;
@property(nonatomic, strong) UIStackView* contentView;

@end

@implementation OCHUIScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureContentView];
}

- (void)configureContentView {
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    
    UIStackView* contentView = [[UIStackView alloc] init];
    contentView.axis = UILayoutConstraintAxisVertical;
    contentView.spacing = 6;
    self.contentView = contentView;
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    for (NSInteger i = 0; i < 100; i++) {
        UILabel *label = UILabel.new;
        label.text = [NSString stringWithFormat:@"%ld", i];
        [self.contentView addArrangedSubview:label];
    }
    
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

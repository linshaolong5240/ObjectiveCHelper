//
//  OCHBaseViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "OCHBaseViewController.h"

@interface OCHBaseViewController ()

@end

@implementation OCHBaseViewController

- (void)dealloc {
    NSLog(@"dealloc: %@", NSStringFromClass([self class]));
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    _contentView = [UIStackView new];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.backgroundColor;
}

-(void)setNavigationBarLight {
//    [self setNavigationBarColor:TUICoreDynamicColor(@"head_bg_gradient_start_color", @"#EBF0F6")];
//    self.navgationTitleLabel.textColor = TUICoreDynamicColor(@"nav_title_text_color", @"#000000");
}

- (void)setNavigationBarDark {
//    [self setNavigationBarColor:YIMColor.controllerBackgroundDarkColor];
//    self.navgationTitleLabel.textColor = YIMColor.mainTextDarkColor;
}

- (void)setNavigationBarColor:(UIColor *)barColor {
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [UINavigationBarAppearance new];
        [appearance configureWithDefaultBackground];
        appearance.shadowColor = nil;
        appearance.backgroundEffect = nil;
        appearance.backgroundColor =  barColor;
        self.navigationController.navigationBar.backgroundColor = barColor;
        self.navigationController.navigationBar.barTintColor = barColor;
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance= appearance;
    }
    else {
        self.navigationController.navigationBar.backgroundColor = barColor;
        self.navigationController.navigationBar.barTintColor = barColor;
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        [[UINavigationBar appearance] setTranslucent:NO];
    }
}

- (void)addSafeAreaBottomView:(UIView *)contentView height:(CGFloat)height backgroundColor:(UIColor *)backgroundColor {
    UIView *container = [[UIView alloc] init];
    [self.view addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
            make.left.right.equalTo(self.view);
            make.height.equalTo(@(height));
    }];
    
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = backgroundColor;
    [container addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(container);
        make.bottom.equalTo(self.view);
    }];
    
    [container addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
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

//
//  YCAccessoryProcurementCategoryViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/9.
//

#import "YCAccessoryProcurementCategoryViewController.h"
#import "JXCategoryView.h"
#import "YCAccessoryPrecurementFilterBar.h"

@interface YCAccessoryProcurementCategoryViewController () <JXCategoryViewDelegate>

@property(nonatomic, copy) NSArray<NSString *> *items;  //汽车配件
@property(nonatomic, strong) UIStackView *contentView;
@property(nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic, strong) JXCategoryListContainerView *categoryListContainerView;
@property(nonatomic, strong) NSMutableArray<UILabel *> *views;

@property(nonatomic, strong) YCAccessoryPrecurementFilterBar *accessoryPrecurementFilterBar;

@end

@implementation YCAccessoryProcurementCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = @[@"机油", @"机油滤清器", @"空气滤清器", @"空调滤清器"];
    [self configureContentView];
}

- (void)configureContentView {
    self.contentView = [[UIStackView alloc] init];
    self.contentView.axis = UILayoutConstraintAxisVertical;
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        }
    }];
    
    [self configureCategoryView];
    [self configureAccessoryPrecurementFilterBar];
    [self.contentView addArrangedSubview:UIView.new];
}

- (void)configureCategoryView {
    UIView *container = [UIView new];
    [self.contentView addArrangedSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"保养件";
    titleLabel.textColor = UIColor.blackColor;
    titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    
    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.titles = self.items;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = UIColor.orangeColor;
    lineView.indicatorHeight = 2.f;
    self.categoryView.indicators = @[lineView];
    self.categoryView.delegate = self;
    
    UIStackView *hstack = [[UIStackView alloc] initWithArrangedSubviews:@[titleLabel, self.categoryView]];
    hstack.axis = UILayoutConstraintAxisHorizontal;
    [container addSubview:hstack];
    [hstack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(container).insets(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
    
}

- (void)configureAccessoryPrecurementFilterBar {
    
    self.accessoryPrecurementFilterBar = [[YCAccessoryPrecurementFilterBar alloc] init];
    
    UIView *container = [[UIView alloc] init];
    [container addSubview:self.accessoryPrecurementFilterBar];
    [self.accessoryPrecurementFilterBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container).insets(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
    
    [self.contentView addArrangedSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
    }];
}

//- (void)configureCategoryListContainerView {
//    self.views = [NSMutableArray array];
//    for(NSInteger i = 0; i < self.items.count; i++) {
//
//    }
//    self.categoryListContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
//    self.categoryListContainerView.layer.cornerRadius = 6;
//    self.categoryListContainerView.clipsToBounds = YES;
//    self.categoryView.listContainer = self.categoryListContainerView;
//
//    UIView *container = [[UIView alloc] init];
//    [self.contentView addArrangedSubview:container];
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(142);
//    }];
//
//    [container addSubview:self.categoryListContainerView];
//    [self.categoryListContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(container).with.insets(UIEdgeInsetsMake(0, 6, 0, 6));
//    }];
//}

// MARK: - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
#if DEBUG
    NSLog(@"categoryView didSelectedItemAtIndex: %@", @(index));
#endif
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

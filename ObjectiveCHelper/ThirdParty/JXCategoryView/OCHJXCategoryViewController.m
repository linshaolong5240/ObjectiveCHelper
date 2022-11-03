//
//  OCHJXCategoryViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "OCHJXCategoryViewController.h"
#import <JXCategoryView.h>
#import "OCHJXCategoryListContentView.h"

@interface OCHJXCategoryViewController () <JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property(nonatomic, copy) NSArray<NSString *> *items;

@property(nonatomic, strong) JXCategoryTitleView *categoryView;
@property(nonatomic, strong) JXCategoryListContainerView *categoryListContainerView;
@property(nonatomic, strong) NSMutableArray* views;

@end

@implementation OCHJXCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"JXCategoryView";
    self.items = @[@"title1", @"title2", @"title3"];
    
    [self configureCategoryView];
    [self configureCategoryListContainerView];
}

- (void)configureCategoryView {
    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.titles = self.items;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = UIColor.orangeColor;
    lineView.indicatorHeight = 2.f;
    self.categoryView.indicators = @[lineView];
    self.categoryView.delegate = self;
    
    [self.contentView addArrangedSubview:self.categoryView];
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(30);
    }];
}

- (void)configureCategoryListContainerView {
    self.views = [NSMutableArray array];
    NSArray<UIColor *> *colors = @[UIColor.redColor, UIColor.greenColor, UIColor.blueColor];
    for(NSInteger i = 0; i < self.items.count; i++) {
        OCHJXCategoryListContentView * v = [OCHJXCategoryListContentView new];
        v.backgroundColor = colors[i];
        [self.views addObject:v];
    }
    
    self.categoryListContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    [self.contentView addArrangedSubview:self.categoryListContainerView];
    
    self.categoryView.listContainer = self.categoryListContainerView;
}


// MARK: - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
#if DEBUG
    NSLog(@"categoryView didSelectedItemAtIndex: %@", @(index));
#endif
}

// MARK: - JXCategoryListContainerViewDelegate

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.items.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return self.views[index];
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

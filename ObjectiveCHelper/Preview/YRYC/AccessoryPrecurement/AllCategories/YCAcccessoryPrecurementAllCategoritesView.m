//
//  YCAcccessoryPrecurementAllCategoritesView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/10.
//

#import "YCAcccessoryPrecurementAllCategoritesView.h"
#import "YCAcccessoryPrecurementAllCategoritesCollectionViewCell.h"
#import "YCAcccessoryPrecurementSubCategoritesCollectionViewCell.h"
#import "YCAccessoryPrecurementProductTableView.h"

@interface YCAcccessoryPrecurementAllCategoritesView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) NSMutableArray<NSString *> *categories;
@property(nonatomic, strong) NSMutableArray<NSString *> *subcategories;


@property(nonatomic, strong) UIStackView *contentView;


@property(nonatomic, strong) UICollectionView *categoriesCollectionView;
@property(nonatomic, strong) UICollectionView *subCategoriesCollectionView;
@property(nonatomic, strong) YCAccessoryPrecurementProductTableView *tableView;

@end

@implementation YCAcccessoryPrecurementAllCategoritesView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.categories = @[@"油品分类", @"轮胎适配", @"蓄电池", @"汽车内饰", @"汽车外饰", @"外饰改装", @"汽车用品", @"保养配件", @"动力性能", @"灯光升级", @"舒适升级", @"音响隔音", @"音响隔音", @"安全自驾", @"安全自驾", @"其他商品"].mutableCopy;
        self.subcategories = @[@"机油", @"刹车油", @"波箱油", @"波箱油", @"波箱油"].mutableCopy;
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    self.backgroundColor = UIColor.blueColor;
//
    self.contentView = [UIStackView new];
    self.contentView.axis = UILayoutConstraintAxisHorizontal;
    self.contentView.spacing = 0;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self configureCategoriesCollectionView];
    [self configureSubCategorieView];
}

- (void)configureCategoriesCollectionView {
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(108, 52);

    self.categoriesCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.categoriesCollectionView.tag = 0;
    self.categoriesCollectionView.showsVerticalScrollIndicator = NO;
    [self.categoriesCollectionView registerClass:[YCAcccessoryPrecurementAllCategoritesCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YCAcccessoryPrecurementAllCategoritesCollectionViewCell class])];
    self.categoriesCollectionView.dataSource = self;
    [self.contentView addArrangedSubview:self.categoriesCollectionView];
    [self.categoriesCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(108);
    }];
    
    [self.categoriesCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
}

- (void)configureSubCategorieView {
    UIStackView *rightContentView = [UIStackView new];
    rightContentView.backgroundColor = UIColor.orangeColor;
    rightContentView.axis = UILayoutConstraintAxisVertical;
    rightContentView.spacing = 0;
    [self.contentView addArrangedSubview:rightContentView];
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 6;
    layout.minimumInteritemSpacing = 8;
    layout.itemSize = CGSizeMake(78, 30);

    self.subCategoriesCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.subCategoriesCollectionView.tag = 1;
    self.subCategoriesCollectionView.contentInset = UIEdgeInsetsMake(12, 10, 12, 10);
    self.subCategoriesCollectionView.allowsMultipleSelection = NO;
    self.subCategoriesCollectionView.showsVerticalScrollIndicator = NO;
    [self.subCategoriesCollectionView registerClass:[YCAcccessoryPrecurementSubCategoritesCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YCAcccessoryPrecurementSubCategoritesCollectionViewCell class])];
    self.subCategoriesCollectionView.dataSource = self;
    
    [rightContentView addArrangedSubview:self.subCategoriesCollectionView];
    [self.subCategoriesCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(92);
    }];
    

    UIView *dividerContainer = [UIView new];
    [rightContentView addArrangedSubview:dividerContainer];
    [dividerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
    }];
    UIView *divider = [UIView new];
    divider.backgroundColor = UIColor.grayColor;
    [dividerContainer addSubview:divider];
    [divider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(dividerContainer).insets(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
//    [self.subCategoriesCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionTop];
    
    self.tableView = [YCAccessoryPrecurementProductTableView new];
    self.tableView.backgroundColor = UIColor.clearColor;
//    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.reusedIdentifer];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    [rightContentView addArrangedSubview:self.tableView];
}

// MARK: - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (collectionView.tag) {
        case 0:
            return self.categories.count;
            break;
        case 1:
            return self.subcategories.count;
        default:
            return 0;
            break;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == 0) {
        YCAcccessoryPrecurementAllCategoritesCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YCAcccessoryPrecurementAllCategoritesCollectionViewCell class]) forIndexPath:indexPath];

        cell.textLable.text = self.categories[indexPath.row];
        return cell;
    }
    
    if (collectionView.tag == 1) {
        YCAcccessoryPrecurementSubCategoritesCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YCAcccessoryPrecurementSubCategoritesCollectionViewCell class]) forIndexPath:indexPath];

        cell.textLable.text = self.subcategories[indexPath.row];
        return cell;
    }
    
    return [UICollectionViewCell new];
}
// MARK: - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"didSelectItemAtIndexPath: %@", indexPath);
#endif
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  UICollectionViewDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "UICollectionViewDemoController.h"
#import "OCHTableSection.h"
#import "UICollectionViewDemoCell.h"
#import "UICollectionViewDemoHeaderView.h"
#import "UICollectionViewDemoFooterView.h"

@interface UICollectionViewDemoController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, copy) NSArray<OCHTableSection<NSString *, UIColor *> *>* sections;
@property(nonatomic, strong) UICollectionView* collectionView;

@end

@implementation UICollectionViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    OCHTableSection *section1 = [[OCHTableSection alloc] initWithLabel:@"title1" items:UIColor.colorItems];
    OCHTableSection *section2 = [[OCHTableSection alloc] initWithLabel:@"title2" items:UIColor.colorItems];

    self.sections = @[section1, section2];
    [self configureCollectionView];
}

- (void)configureCollectionView {
    CGFloat columns = 3;
    CGFloat paddding = 10;
    CGFloat paddingWidth = (columns - 1) * paddding;
    CGFloat width = ([[UIScreen mainScreen] bounds].size.width - paddingWidth) / columns;

    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 30;
    layout.minimumInteritemSpacing = paddding;
    layout.headerReferenceSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 80);
    layout.footerReferenceSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 80);
    layout.itemSize = CGSizeMake(width, 150);

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView registerClass:[UICollectionViewDemoCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewDemoCell class])];
    [self.collectionView registerClass:[UICollectionViewDemoHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionViewDemoHeaderView class])];
    [self.collectionView registerClass:[UICollectionViewDemoFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionViewDemoFooterView class])];
    self.collectionView.dataSource = self;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:YES scrollPosition:(UICollectionViewScrollPositionTop)];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

// MARK: - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewDemoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewDemoCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"section: %ld, row: %ld", (long)indexPath.section, (long)indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionViewDemoHeaderView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionViewDemoHeaderView class]) forIndexPath:indexPath];
        v.textLabel.text = [NSString stringWithFormat:@"Header: %@", self.sections[indexPath.section].label];
        v.backgroundColor = UIColor.orangeColor;
        return v;
    }

    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionViewDemoFooterView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionViewDemoFooterView class]) forIndexPath:indexPath];
        v.textLabel.text = [NSString stringWithFormat:@"Footer: %@", self.sections[indexPath.section].label];
        v.backgroundColor = UIColor.purpleColor;
        return v;
    }

    return [UICollectionReusableView new];
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

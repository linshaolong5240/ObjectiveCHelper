//
//  OCHCollectionViewDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/28.
//

#import "OCHCollectionViewDemoController.h"
#import "Masonry.h"

@interface OCHCollectionViewDemoController () <UICollectionViewDataSource>

@property(nonatomic, copy) NSArray* sections;
@property(nonatomic, strong) UICollectionView* collectionView;

@end

@implementation OCHCollectionViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blueColor;
    self.sections = @[UIColor.blackColor, UIColor.darkGrayColor, UIColor.lightGrayColor, UIColor.whiteColor, UIColor.grayColor, UIColor.redColor, UIColor.greenColor, UIColor.blueColor, UIColor.cyanColor, UIColor.yellowColor, UIColor.magentaColor, UIColor.orangeColor, UIColor.purpleColor, UIColor.brownColor, UIColor.clearColor];
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
    self.collectionView.backgroundColor = UIColor.orangeColor;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];

    cell.backgroundColor = UIColor.mainText;//self.sections[indexPath.row];
    return cell;
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

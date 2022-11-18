//
//  OCHUIKitDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "OCHUIKitDemoViewController.h"
#import "OCHStore.h"
#import "OCHTableSection.h"

#import "UIButtonDemoViewController.h"
#import "UILabelDemoViewController.h"
#import "UICollectionViewDemoController.h"
#import "UIKitUISearchbarDemoViewController.h"
#import "UIScrollViewDemoController.h"
#import "UITableViewDemoViewController.h"

//Custom
#import "OCHValueStepperDemoController.h"

NSArray<NSNumber *> * OCHUIKitDemoAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = OCHUIKitDemoBeg; i < OCHUIKitDemoEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString * NSStringFromOCHUIKitDemo(OCHUIKitDemo item) {
    switch (item) {
        case OCHUIKitDemoUIButton:
            return @"OCHUIKitDemoUIButton";
        case OCHUIKitDemoUILabel:
            return @"OCHUIKitDemoUILabel";
            break;
        case OCHUIKitDemoUICollectionView:
            return @"OCHUIKitDemoItemUICollectionView";
            break;
        case OCHUIKitDemoUISearchbar:
            return @"OCHUIKitDemoItemUISearchbar";
            break;
        case OCHUIKitDemoUIScrollView:
            return @"OCHUIKitDemoItemUIScrollView";
            break;
        case OCHUIKitDemoUITableView:
            return @"OCHUIKitDemoUITableView";
            break;
        default:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromOCHUIKitDemo(OCHUIKitDemo item) {
    switch (item) {
        case OCHUIKitDemoUIButton:
            return [UIButtonDemoViewController new];
            break;
        case OCHUIKitDemoUILabel:
            return [UILabelDemoViewController new];
            break;
        case OCHUIKitDemoUICollectionView:
            return [UICollectionViewDemoController new];
            break;;
        case OCHUIKitDemoUISearchbar:
            return [UIKitUISearchbarDemoViewController new];
            break;
        case OCHUIKitDemoUIScrollView:
            return [[UIScrollViewDemoController alloc] init];
            break;
        case OCHUIKitDemoUITableView:
            return [[UITableViewDemoViewController alloc] init];
            break;
        default:
            return nil;
            break;
    }
}

NSArray<NSNumber *> * OCHUIKitCustomAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = OCHUIKitCustomBeg; i < OCHUIKitCustomEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString *NSStringFromOCHUIKitCustom(OCHUIKitCustom item) {
    switch (item) {
        case OCHUIKitCustomValueStepper:
            return @"OCHUIKitCustomValueStepper";
        default:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromOCHUIKitCustom(OCHUIKitCustom item) {
    switch (item) {
        case OCHUIKitCustomValueStepper:
            return [OCHValueStepperDemoController new];
            break;
        default:
            return nil;
            break;
    }
}

typedef NS_ENUM(NSUInteger, SectionType) {
    SectionTypeUIKitCustom,
    SectionTypeUIKitDemo,
};

@interface OCHUIKitDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHTableSection<NSString *, NSArray<NSNumber *> *> *> *sections;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation OCHUIKitDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[
        [[OCHTableSection alloc] initWithLabel:@"UIKitCustom" value:OCHUIKitCustomAllItems()],
        [[OCHTableSection alloc] initWithLabel:@"UIKitDemo" value:OCHUIKitDemoAllItems()],
    ];
    [self configureTableView];
    if (OCHStore.sharedInstance.appState.isFirstLaunch) {
        [self showAlertWithTitle:@"is first launch" message:@"YES"];
    }
    else {
        [self showAlertWithTitle:@"is first launch" message:@"NO"];
    }
}

- (void)configureTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].value.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (SectionTypeUIKitCustom == indexPath.section) {
        cell.textLabel.text = NSStringFromOCHUIKitCustom(self.sections[indexPath.section].value[indexPath.row].unsignedIntegerValue);
    } else {
        cell.textLabel.text = NSStringFromOCHUIKitDemo(self.sections[indexPath.section].value[indexPath.row].unsignedIntegerValue);
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].label;
}

// MARK: - UITableViewDataDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (SectionTypeUIKitCustom == indexPath.section) {
        UIViewController *vc = UIViewControllerFromOCHUIKitCustom(indexPath.row);
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        UIViewController *vc = UIViewControllerFromOCHUIKitDemo(indexPath.row);
        [self.navigationController pushViewController:vc animated:YES];
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

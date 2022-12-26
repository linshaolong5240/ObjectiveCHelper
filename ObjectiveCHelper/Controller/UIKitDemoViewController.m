//
//  UIKitDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "UIKitDemoViewController.h"
@import Masonry;

#import "OCHStore.h"
#import "OCHTableSection.h"

#import "UIButtonDemoViewController.h"
#import "UILabelDemoViewController.h"
#import "UICollectionViewDemoController.h"
#import "UIKitUISearchbarDemoViewController.h"
#import "UIPageControlDemoViewController.h"
#import "UIModalPresentationStyleDemoViewController.h"
#import "UINavigationBarDemoController.h"
#import "UISearchControllerDemoController.h"
#import "UIScrollViewDemoController.h"
#import "UITableViewDemoViewController.h"

//Custom
#import "OCHLinearGradientViewController.h"
#import "OCHValueStepperDemoController.h"
#import "QRCodeViewController.h"
#import "OCHPageViewControllerDemoController.h"
#import "OCHWebViewController.h"

NSArray<NSNumber *> * UIKitCustomItemAllCases(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i =     UIKitCustomItemBeg; i <     UIKitCustomItemEnd; i++) {
        [items addObject:@(i)];
    }
    
    return items.copy;
}

NSString *NSStringFromUIKitCustomItem(UIKitCustomItem item) {
    switch (item) {
        case UIKitCustomItemLinearGradientView:
            return @"OCHLinearGradientView";
            break;
        case UIKitCustomItemValueStepper:
            return @"OCHValueStepper";
            break;
        case UIKitCustomItemQRCodeView:
            return @"QRCodeView";
            break;
        case UIKitCustomItemPageViewController:
            return @"OCHPageViewControllerDemoController";
            break;
        case UIKitCustomItemWebViewController:
            return @"OCHWebViewController";
            break;
        case UIKitCustomItemEnd:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromUIKitCustomItem(UIKitCustomItem item) {
    switch (item) {
        case UIKitCustomItemLinearGradientView:
            return [[OCHLinearGradientViewController alloc] init];
        case UIKitCustomItemValueStepper:
            return [OCHValueStepperDemoController new];
            break;
        case UIKitCustomItemQRCodeView:
            return [QRCodeViewController new];
            break;
        case UIKitCustomItemPageViewController:
            return [OCHPageViewControllerDemoController new];
        case UIKitCustomItemWebViewController:
            return [OCHWebViewController new];
        case UIKitCustomItemEnd:
            return nil;
            break;
    }
}


NSArray<NSNumber *> * UIKitDemoItemAllCases(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = UIKitDemoItemBeg; i < UIKitDemoItemEnd; i++) {
        [items addObject:@(i)];
    }
    
    return items.copy;
}

NSString * NSStringFromUIKitDemo(UIKitDemoItem item) {
    switch (item) {
        case UIKitDemoItemUIButton:
            return @"UIKitDemoItemUIButton";
        case UIKitDemoItemUILabel:
            return @"UIKitDemoItemUILabel";
            break;
        case UIKitDemoItemUICollectionView:
            return @"UIKitDemoItemUICollectionView";
            break;
        case UIKitDemoItemUIPageControl:
            return @"UIKitDemoItemUIPageControl";
            break;
        case UIKitDemoItemUIModalPresentationStyle:
            return @"UIModalPresentationStyle";
        case UIKitDemoItemUINavigationBar:
            return @"UINavigationBar";
            break;
        case UIKitDemoItemUISearchbar:
            return @"UIKitDemoItemUISearchbar";
            break;
        case UIKitDemoItemUISearchController:
            return @"UIKitDemoItemUISearchController";
            break;
        case UIKitDemoItemUIScrollView:
            return @"UIKitDemoItemUIScrollView";
            break;
        case UIKitDemoItemUITableView:
            return @"UITableView";
            break;
        case UIKitDemoItemEnd:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromUIKitDemo(UIKitDemoItem item) {
    switch (item) {
        case UIKitDemoItemUIButton:
            return [UIButtonDemoViewController new];
            break;
        case UIKitDemoItemUILabel:
            return [UILabelDemoViewController new];
            break;
        case UIKitDemoItemUICollectionView:
            return [UICollectionViewDemoController new];
            break;;
        case UIKitDemoItemUIPageControl:
            return [UIPageControlDemoViewController new];
            break;
        case UIKitDemoItemUIModalPresentationStyle:
            return [UIModalPresentationStyleDemoViewController new];
        case UIKitDemoItemUINavigationBar:
            return [UINavigationBarDemoController new];
            break;
        case UIKitDemoItemUISearchbar:
            return [UIKitUISearchbarDemoViewController new];
            break;
        case UIKitDemoItemUISearchController:
            return [UISearchControllerDemoController new];
            break;
        case UIKitDemoItemUIScrollView:
            return [[UIScrollViewDemoController alloc] init];
            break;
        case UIKitDemoItemUITableView:
            return [[UITableViewDemoViewController alloc] init];
            break;
        case UIKitDemoItemEnd:
            return [[UIViewController alloc] init];
            break;
    }
}

typedef NS_ENUM(NSUInteger, SectionType) {
    SectionTypeUIKitCustom,
    SectionTypeUIKitDemo,
};

@interface UIKitDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHTableSection<NSString *, NSArray<NSNumber *> *> *> *sections;
@property(nonatomic, strong) UITableView *tableView;

@end

@implementation UIKitDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = @[
        [[OCHTableSection alloc] initWithLabel:@"UIKitCustom" value:UIKitCustomItemAllCases()],
        [[OCHTableSection alloc] initWithLabel:@"UIKitDemo" value:UIKitDemoItemAllCases()],
    ];
    [self configureTableView];
//    if (OCHStore.sharedInstance.appState.isFirstLaunch) {
//        [self showAlertWithTitle:@"is first launch" message:@"YES"];
//    }
//    else {
//        [self showAlertWithTitle:@"is first launch" message:@"NO"];
//    }
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
        cell.textLabel.text = NSStringFromUIKitCustomItem(self.sections[indexPath.section].value[indexPath.row].unsignedIntegerValue);
    } else {
        cell.textLabel.text = NSStringFromUIKitDemo(self.sections[indexPath.section].value[indexPath.row].unsignedIntegerValue);
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].label;
}

// MARK: - UITableViewDataDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (SectionTypeUIKitCustom == indexPath.section) {
        UIViewController *vc = UIViewControllerFromUIKitCustomItem(indexPath.row);
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        UIViewController *vc = UIViewControllerFromUIKitDemo(indexPath.row);
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

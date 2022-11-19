//
//  UIKitDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

#import "UIKitDemoViewController.h"
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
        case UIKitDemoItemUISearchbar:
            return @"UIKitDemoItemUISearchbar";
            break;
        case UIKitDemoItemUIScrollView:
            return @"UIKitDemoItemUIScrollView";
            break;
        case UIKitDemoItemUITableView:
            return @"UIKitDemoItemUITableView";
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
        case UIKitDemoItemUISearchbar:
            return [UIKitUISearchbarDemoViewController new];
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

NSArray<NSNumber *> * UIKitCustomItemAllCases(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i =     UIKitCustomItemBeg; i <     UIKitCustomItemEnd; i++) {
        [items addObject:@(i)];
    }
    
    return items.copy;
}

NSString *NSStringFromUIKitCustomItem(UIKitCustomItem item) {
    switch (item) {
        case UIKitCustomItemValueStepper:
            return @"OCHUIKitCustomValueStepper";
        case UIKitCustomItemEnd:
            return @"";
            break;
    }
}

UIViewController * UIViewControllerFromUIKitCustomItem(UIKitCustomItem item) {
    switch (item) {
        case UIKitCustomItemValueStepper:
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

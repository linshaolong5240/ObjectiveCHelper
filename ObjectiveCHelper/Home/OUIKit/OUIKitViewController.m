//
//  OUIKitViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/9.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUIKitViewController.h"
#import "OCHStringArraySection.h"

#import "OUITableViewCellViewController.h"

typedef NS_ENUM(NSInteger, OUISection) {
    OUISectionTableViewCell,
    OUISectionNumber,
};

NSArray<NSNumber *> *OUISectionAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < OUISectionNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

NSString *NSStringFromOUISection(OUISection section) {
    switch (section) {
        case OUISectionTableViewCell:
            return @"OUIKitSectionTableViewCell";
            break;
        case OUISectionNumber:
            return @"OUIKitSectionNumber";
            break;
    }
}

typedef NS_ENUM(NSInteger, OUITableViewCellItem) {
    OUITableViewCellItemTextSwitch,
    OUITableViewCellItemlNumber,
};

NSArray<NSNumber *> *OUITableViewCellAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < OUITableViewCellItemlNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

NSString *NSStringFromOUITableViewCellItem(OUITableViewCellItem item) {
    switch (item) {
        case OUITableViewCellItemTextSwitch:
            return @"OUITableViewCellItemCellText";
            break;
        case OUITableViewCellItemlNumber:
            return @"OUITableViewCellItemlNumber";
            break;
    }
}

@interface OUIKitViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHStringArraySection<NSNumber *> *> *sections;

@end

@implementation OUIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = [[OUISectionAllCases().rac_sequence map:^OCHStringArraySection<NSNumber *> * _Nullable(NSNumber * _Nullable value) {
        OUISection section = value.integerValue;
        NSArray<NSNumber *> *items = @[];
        switch (section) {
            case OUISectionTableViewCell:
                items = OUITableViewCellAllCases();
                break;
            case OUISectionNumber:
                break;;
        }
        return [OCHStringArraySection<NSNumber *> sectionWithTitle:NSStringFromOUISection(value.integerValue) items:items];
    }] array];
    
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];;
    tableView.backgroundColor = UIColor.clearColor;
    if (@available(iOS 15.0, *)) {
        tableView.sectionHeaderTopPadding = 0;
    }
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    OUISection section = indexPath.section;
    switch (section) {
        case OUISectionTableViewCell:
        {
            OUITableViewCellItem item = indexPath.row;
            switch (item) {
                case OUITableViewCellItemTextSwitch:
                    break;
                case OUITableViewCellItemlNumber:
                    break;
            }
        }
            break;
        case OUISectionNumber:
            break;
    }
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

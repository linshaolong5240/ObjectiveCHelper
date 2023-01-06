//
//  OCHViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/6.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OCHViewController.h"
#import "OCHIndexArraySection.h"
#import "OCHStringArraySection.h"

typedef NS_ENUM(NSInteger, OCHSection) {
    OCHSectionOUIKit,
};

NSString *NSStringFromOCHSection(OCHSection section) {
    switch (section) {
        case OCHSectionOUIKit:
            return @"OUIKit";
            break;
    }
}

typedef NS_ENUM(NSInteger, OCHUI) {
    OCHUITableViewCell,
};

typedef NS_ENUM(NSInteger, OCHTableViewCell) {
    OCHTableViewCellText,
};

@interface OCHViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, copy) NSArray<OCHIndexArraySection<NSNumber *> *> *sections;

@end

@implementation OCHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OCH";
    self.sections = @[
        [OCHIndexArraySection<NSNumber *> sectionWithIndex:OCHSectionOUIKit
                                                      items:@[@(OCHUITableViewCell)]],
    ];
    [self configureView];
}

- (void)configureView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
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
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return NSStringFromOCHSection(self.sections[section].index);
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

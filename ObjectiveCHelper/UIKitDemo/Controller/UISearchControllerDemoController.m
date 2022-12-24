//
//  UISearchControllerDemoController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/1.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UISearchControllerDemoController.h"
@import Masonry;

@interface UISearchControllerDemoController () <UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property(nonatomic, copy) NSArray<NSString *> *items;
@property(nonatomic, copy) NSArray<NSString *> *resultItems;

@property(nonatomic, assign) BOOL showSearchResult;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UISearchController *searchController;

@end

@implementation UISearchControllerDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UISearchControllerDemoController";
    self.items = @[
        @"aaaa",
        @"abbb",
        @"abcc",
        @"abcd",
        @"aaaa",
        @"abbb",
        @"abcc",
        @"abcd",
        @"aaaa",
        @"abbb",
        @"abcc",
        @"abcd",
        @"aaaa",
        @"abbb",
        @"abcc",
        @"abcd",
    ];
    self.resultItems = @[];
    self.showSearchResult = false;
    
    [self configureContentView];
}

- (void)configureContentView {
    UISearchController *searchController = [[UISearchController alloc] init];
    searchController.delegate = self;
    searchController.searchResultsUpdater = self;
    self.searchController = searchController;
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.tableHeaderView = searchController.searchBar;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    self.tableView = tableView;
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.showSearchResult ? self.resultItems.count : self.items.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.showSearchResult ? self.resultItems[indexPath.row] : self.items[indexPath.row];
    return cell;
}

// MARK: - UISearchControllerDelegate
// These methods are called when automatic presentation or dismissal occurs. They will not be called if you present or dismiss the search controller yourself.
- (void)willPresentSearchController:(UISearchController *)searchController {
    
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    
}

- (void)didDismissSearchController:(UISearchController *)searchController {
    
}

// Called after the search controller's search bar has agreed to begin editing or when 'active' is set to YES. If you choose not to present the controller yourself or do not implement this method, a default presentation is performed on your behalf.
- (void)presentSearchController:(UISearchController *)searchController {
    
}

- (void)searchController:(UISearchController *)searchController willChangeToSearchBarPlacement:(UINavigationItemSearchBarPlacement)newPlacement API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos) {
    
}

- (void)searchController:(UISearchController *)searchController didChangeFromSearchBarPlacement:(UINavigationItemSearchBarPlacement)previousPlacement API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos) {
    
}

// MARK: - UISearchResultsUpdating

// Called when the search bar's text or scope has changed or when the search bar becomes first responder.
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    BOOL shouldSearch =  searchController.searchBar.text.length > 0;
    if (shouldSearch) {
        NSString *searchkey = searchController.searchBar.text;
        self.resultItems = [[self.items.rac_sequence filter:^BOOL(NSString *  _Nullable value) {
            return [value containsString:searchkey];
        }] array];
        self.showSearchResult = YES;
    } else {
        self.showSearchResult = false;
    }
    [self.tableView reloadData];
}

// Called when user selects one of the search suggestion buttons displayed under the keyboard on tvOS.
- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController selectingSearchSuggestion:(nonnull id<UISearchSuggestion>)searchSuggestion  API_AVAILABLE(ios(16.0)){
    
}

@end

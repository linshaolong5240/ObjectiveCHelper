//
//  ContactsViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/24.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "ContactsViewController.h"
@import Contacts;
@import ReactiveObjC;

@interface ContactsViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, assign) CNAuthorizationStatus authorizationStatus;

@property(nonatomic, strong) CNContactStore *store;

@property(nonatomic, copy) NSArray<CNContact *> *items;

@property(nonatomic, strong) UITableView *tableView;


@end

@implementation ContactsViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _authorizationStatus = CNAuthorizationStatusNotDetermined;
        _store = [[CNContactStore alloc] init];
        _items = [NSArray array];
        _tableView = [[UITableView alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
    [self checkAuthorizationStatus];
}

- (void)configureView {
    self.tableView.frame = self.view.bounds;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)checkAuthorizationStatus {
    self.authorizationStatus = [CNContactStore authorizationStatusForEntityType:(CNEntityTypeContacts)];
    switch (self.authorizationStatus) {
        case CNAuthorizationStatusNotDetermined:
            [self requestAuthorization];
            break;
        case CNAuthorizationStatusRestricted:
            break;
        case CNAuthorizationStatusDenied:
            break;
        case CNAuthorizationStatusAuthorized:
            [self requestAuthorizationSuccess];
            break;
    }
}

- (void)requestAuthorization {
    @weakify(self)
    [self.store requestAccessForEntityType:(CNEntityTypeContacts) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        @strongify(self)
        self.authorizationStatus = [CNContactStore authorizationStatusForEntityType:(CNEntityTypeContacts)];
        if (error) {
            return;
        }
        if (!granted) {
            return;
        }
        [self requestAuthorizationSuccess];
    }];
}

- (void)requestAuthorizationSuccess {
    [self fecthContacts];
}

- (void)fecthContacts {
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self)
        NSMutableArray<CNContact *> *contacts = [NSMutableArray array];
        NSError *error;
        NSArray<id <CNKeyDescriptor>> *keys = @[
            [CNContactFormatter descriptorForRequiredKeysForStyle:(CNContactFormatterStyleFullName)],
            CNContactPhoneNumbersKey,
        ];
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
        [self.store enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
            [contacts addObject:contact];
        }];
        
        if (error) {
#if DEBUG
            NSLog(@"fecthContacts error: %@", error);
#endif
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self fecthContactsDone:contacts];
        });
    });
}

- (void)fecthContactsDone:(NSArray<CNContact *> *)contacts {
    self.items = contacts;
    [self.tableView reloadData];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    CNContact *item = self.items[indexPath.row];
    NSMutableString *name = [NSMutableString string];
    if (item.givenName) {
        [name appendString:item.givenName];
    }
    [name appendString:@" "];
    if (item.middleName) {
        [name appendString:item.middleName];
    }
    [name appendString:@" "];
    if (item.familyName) {
        [name appendString:item.familyName];
    }
    [name appendString:@" "];
    if (item.phoneNumbers.firstObject.value.stringValue) {
        [name appendString:item.phoneNumbers.firstObject.value.stringValue];
    }
    cell.textLabel.text = name;//[NSString stringWithFormat:@"%@ %@ %@", item.givenName, item.middleName, item.familyName];
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

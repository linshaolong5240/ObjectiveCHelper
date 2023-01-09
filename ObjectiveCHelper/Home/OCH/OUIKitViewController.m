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

typedef NS_ENUM(NSInteger, OUIKitSection) {
    OUIKitSectionTableViewCell,
    OUIKitSectionNumber,
};

NSArray<NSNumber *> *OUIKitSectionAllCases(void) {
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < OUIKitSectionNumber; i++) {
        [array addObject:@(i)];
    }
    return array;
}

NSString *NSStringFromOUIKitSection(OUIKitSection section) {
    switch (section) {
        case OUIKitSectionTableViewCell:
            return @"OUIKitSectionTableViewCell";
            break;
        case OUIKitSectionNumber:
            return @"OUIKitSectionNumber";
            break;
    }
}

typedef NS_ENUM(NSInteger, OUITableViewCellItem) {
    OUITableViewCellItemCellText,
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
        case OUITableViewCellItemCellText:
            return @"OUITableViewCellItemCellText";
            break;
        case OUITableViewCellItemlNumber:
            return @"OUITableViewCellItemlNumber";
            break;
    }
}

@interface OUIKitViewController ()

@property(nonatomic, copy) NSArray<OCHStringArraySection<NSNumber *> *> *sections;

@end

@implementation OUIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sections = [[OUIKitSectionAllCases().rac_sequence map:^OCHStringArraySection<NSNumber *> * _Nullable(NSNumber * _Nullable value) {
        OUIKitSection section = value.integerValue;
        switch (section) {
            case OUIKitSectionTableViewCell:
            {
                OUITableViewCellViewController *vc = [OUITableViewCellViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case OUIKitSectionNumber:
                break;;
        }
        return [OCHStringArraySection<NSNumber *> sectionWithTitle:NSStringFromOUIKitSection(value.integerValue) items:@[]];
    }] array];
}

@end

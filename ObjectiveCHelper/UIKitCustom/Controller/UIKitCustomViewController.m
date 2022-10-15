//
//  UIKitCustomViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/14.
//

#import "UIKitCustomViewController.h"

NSArray<NSNumber *> * UIKitCustomAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = UIKitCustomBeg; i < UIKitCustomEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

@interface UIKitCustomViewController ()

@end

@implementation UIKitCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

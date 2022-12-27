//
//  FrameworkSystemDispatchViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/27.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "FrameworkSystemDispatchViewController.h"

@interface FrameworkSystemDispatchViewController ()

@end

@implementation FrameworkSystemDispatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Dispatch";
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_async main");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"dispatch_get_global_queue global");
    });
    
    NSLog(@"dispatch_after start: %@", [NSDate now]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_after done: %@", [NSDate now]);
    });
}

@end

//
//  ReactiveObjCDemoViewModel.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/1.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "ReactiveObjCDemoViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation ReactiveObjCDemoViewModel

- (RACSignal *)rac_loginValidSignal {
    return [RACSignal
        combineLatest:@[ RACObserve(self, username), RACObserve(self, email) ]
        reduce:^(NSString *username, NSString *email) {
            return @(username.length > 0 || email.length > 0);
        }];
}

- (void)login {
    
}

@end

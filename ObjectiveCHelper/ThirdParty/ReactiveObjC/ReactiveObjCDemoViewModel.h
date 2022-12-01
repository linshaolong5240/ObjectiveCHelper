//
//  ReactiveObjCDemoViewModel.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/1.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReactiveObjCDemoViewModel : NSObject

@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *email;
@property(nonatomic, copy) NSString *password;


- (RACSignal *)rac_loginValidSignal;
- (void)login;

@end

NS_ASSUME_NONNULL_END

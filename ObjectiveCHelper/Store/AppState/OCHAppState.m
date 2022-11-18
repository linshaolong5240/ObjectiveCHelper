//
//  OCHAppState.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHAppState.h"
#import "OCHSetting.h"

static NSString * const OCHAppStateLaunchCount = @"OCHAppStateLaunchCount";

@implementation OCHAppState

- (instancetype)init {
    self = [super init];
    if (self) {
        _setting = [[OCHSetting alloc] init];
    }
    return self;
}

- (NSInteger)launchCount {
    return [NSUserDefaults.standardUserDefaults integerForKey:OCHAppStateLaunchCount];
}

- (void)setLaunchCount:(NSInteger)launchCount {
    [NSUserDefaults.standardUserDefaults setInteger:launchCount forKey:OCHAppStateLaunchCount];
}

- (BOOL)isFirstLaunch {
    return self.launchCount == 1;
}
@end

//
//  OCHLinearGradientViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/13.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHLinearGradientViewController.h"
#import <Masonry/Masonry.h>

#import "OCHLinearGradientView.h"

@interface OCHLinearGradientViewController ()

@end

@implementation OCHLinearGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"OCHLinearGradientView";
    OCHLinearGradientView *linearGradient = [[OCHLinearGradientView alloc] initWithFrame:(CGRectZero) start:(OCHLinearGradientPostionTopLeft) end:(OCHLinearGradientPostionBottomRight) colors:@[UIColor.orangeColor, UIColor.systemPinkColor] locations:nil];
    [self.view addSubview:linearGradient];
    [linearGradient mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

@end

//
//  OCHUICollectionViewDemoHeaderView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/11.
//

#import "OCHUICollectionViewDemoHeaderView.h"

@implementation OCHUICollectionViewDemoHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self configureContentView];
    
    return self;
}

- (void)configureContentView {
    self.textLabel = [UILabel new];
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
    }];
}

@end

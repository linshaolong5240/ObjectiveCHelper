//
//  OMKLocationAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/8.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKLocationAnnotationView.h"

@implementation OMKLocationAnnotationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (instancetype)initWithAnnotation:(OMKPointAnnotation *)anntotatioon {
    self = [self initWithFrame:CGRectMake(0, 0, 63, 63)];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    UIImageView *pointImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    pointImageView.image = [UIImage imageNamed:@"omk_point_location_user"];
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.bounds.size.width - 44) / 2.0, 0, 44, 24)];
    bubbleImageView.image = [UIImage imageNamed:@"omk_point_location_employee"];
    
    [self addSubview:pointImageView];
    [self addSubview:bubbleImageView];
}

@end

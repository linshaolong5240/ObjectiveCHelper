//
//  OMKACustomerLocationAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Apple on 2022/11/14.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKACustomerLocationAnnotationView.h"

@implementation OMKACustomerLocationAnnotationView

- (instancetype)initWithAnnotation:(id <MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.canShowCallout = NO;
        [self configureView];
    }
    return self;
}

- (void)configureView {
    self.image = [UIImage imageNamed:@"omk_customer_annotation_location"];
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"omk_customer_annotation_bubble"]];
    [self addSubview:bubbleImageView];

    [bubbleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_top);
            make.centerX.equalTo(self);
    }];
}

@end

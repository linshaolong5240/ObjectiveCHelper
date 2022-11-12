//
//  OMKPointAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKPointAnnotationView.h"

@implementation OMKPointAnnotationView

- (instancetype)initWithAnnotation:(OMKPointAnnotation *)annotation {
    self = [super initWithAnnotation:annotation];
    if (self) {
        [self configureView];
    }
    return self;
}


- (void)configureView {
    self.backgroundColor = UIColor.orangeColor;
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 16, 16);
    self.layer.cornerRadius = 8;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = 2;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = self.annotation.title;
    [titleLabel sizeToFit];
    UILabel *subtitleLabel = [[UILabel alloc] init];
    subtitleLabel.text = self.annotation.subtitle;
    [subtitleLabel sizeToFit];
    
    UIStackView *vstack = [[UIStackView alloc] init];
    vstack.backgroundColor = UIColor.orangeColor;
    vstack.axis = UILayoutConstraintAxisVertical;
    if (titleLabel.text) {
        [vstack addArrangedSubview: titleLabel];
    }
    if (subtitleLabel.text) {
        [vstack addArrangedSubview: subtitleLabel];
    }
    [self addSubview:vstack];
    CGFloat width = titleLabel.bounds.size.width > subtitleLabel.bounds.size.width ? titleLabel.bounds.size.width : subtitleLabel.bounds.size.width;
    
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_top).offset(- 10);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(width);
    }];
}

@end

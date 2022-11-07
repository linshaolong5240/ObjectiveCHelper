//
//  OMKPointAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKPointAnnotationView.h"
#import "OMKPointAnnotation.h"

@interface OMKPointAnnotationView ()

@property(nonatomic, copy) OMKPointAnnotation *annotation;

@end

@implementation OMKPointAnnotationView

- (instancetype)initWithFrame:(CGRect)frame annotation:(OMKPointAnnotation *)annotation {
    self = [super initWithFrame:frame];
    if (self) {
        _annotation = annotation;
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    self.backgroundColor = UIColor.orangeColor;
    self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 16, 16);
    self.layer.cornerRadius = 8;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = 2;
    
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.text = self.annotation.title;
    [titleLable sizeToFit];
    UILabel *subtitleLable = [[UILabel alloc] init];
    subtitleLable.text = self.annotation.subtitle;
    [subtitleLable sizeToFit];
    
    UIStackView *vstack = [[UIStackView alloc] init];
    vstack.backgroundColor = UIColor.blueColor;
    vstack.axis = UILayoutConstraintAxisVertical;
    if (titleLable.text) {
        [vstack addArrangedSubview: titleLable];
    }
    if (subtitleLable.text) {
        [vstack addArrangedSubview: subtitleLable];
    }
    [self addSubview:vstack];
    CGFloat width = titleLable.bounds.size.width > subtitleLable.bounds.size.width ? titleLable.bounds.size.width : subtitleLable.bounds.size.width;
    
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_top).offset(- 10);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(width);
    }];
    
}

@end

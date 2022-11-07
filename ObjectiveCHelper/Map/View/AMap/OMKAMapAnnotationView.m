//
//  OMKAMapAnnotationView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OMKAMapAnnotationView.h"

@implementation OMKAMapAnnotationView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

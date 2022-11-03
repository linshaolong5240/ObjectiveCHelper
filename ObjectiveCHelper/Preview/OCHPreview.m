//
//  OCHPreview.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/9/30.
//

#import "OCHPreview.h"

@interface OCHPreview ()

@property(nonatomic, strong) UIStackView *contentView;

@end

@implementation OCHPreview

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(!self) return nil;
    
    self.backgroundColor = UIColor.orangeColor;
    
    [self configureContentView];
    
    return self;
}

- (void)configureContentView {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

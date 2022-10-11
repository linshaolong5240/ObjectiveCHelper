//
//  OCHCollectionViewDemoCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/11.
//

#import "OCHCollectionViewDemoCell.h"

@implementation OCHCollectionViewDemoCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureContentView];
    }
    return self;
}

-(void)configureContentView {
    UIView *backgroundView = [UIView new];
    backgroundView.backgroundColor = UIColor.grayColor;
    UIView *selectedBackgroundView = [UIView new];
    selectedBackgroundView.backgroundColor = UIColor.blueColor;
    
    self.backgroundView = backgroundView;
    self.selectedBackgroundView = selectedBackgroundView;
}

@end

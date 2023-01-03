//
//  UICollectionViewDemoCell.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/11.
//

#import "UICollectionViewDemoCell.h"
#import <Masonry.h>

@implementation UICollectionViewDemoCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textLabel = [UILabel new];
        _textLabel.numberOfLines = 0;
        if (@available(iOS 13.0, *)) {
            _imageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"heart"] highlightedImage:[UIImage systemImageNamed:@"heart.fill"]];
        } else {
            _imageView = [UIImageView new];
            _imageView.backgroundColor = UIColor.blueColor;
        }
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
    
    [self.contentView addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
}

@end

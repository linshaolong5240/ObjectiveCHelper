//
//  JXCategoryListContentViewDemoView.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/9.
//

#import "JXCategoryListContentViewDemoView.h"
#import "JXCategoryView.h"

@interface JXCategoryListContentViewDemoView () <JXCategoryListContentViewDelegate>

@end

@implementation JXCategoryListContentViewDemoView

// MARK: - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  YCAccessoryPrecurementFilterBar.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/8.
//

#import "YCAccessoryPrecurementFilterBar.h"
#import "YCAccessoryPrecurementSortButton.h"

@interface YCAccessoryPrecurementFilterBar ()

@property(nonatomic, assign) YCAccessoryPrecurementSortType currentSortType;

@property(nonatomic, strong) UIStackView *contentView;
@property(nonatomic, strong) NSArray<YCAccessoryPrecurementSortButton *> *sortButtons;
@property(nonatomic, strong) UIButton *filterButton;

@end

@implementation YCAccessoryPrecurementFilterBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.currentSortType = YCAccessoryPrecurementSortTypeDistance;
        [self configureContentView];
    }
    return self;
}

- (void)configureContentView {
    self.contentView = [[UIStackView alloc] init];
    self.contentView.axis = UILayoutConstraintAxisHorizontal;
    self.contentView.spacing =
    self.contentView.distribution = UIStackViewDistributionEqualSpacing;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
    }];
    
    NSMutableArray *sortButtons = [NSMutableArray array];
    
    for(NSInteger i = 0; i < YCAccessoryPrecurementSortTypeEnd; i++) {
        YCAccessoryPrecurementSortButton *button = [self makeSortButtonFrom:i];
        if (self.currentSortType == i) {
            [button updateToNextButtonState];
        }
        [sortButtons addObject:button];
        [self.contentView addArrangedSubview:button];
    }
    
    self.sortButtons = sortButtons;

    self.filterButton = [[UIButton alloc] init];
    self.filterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.filterButton setTitle:@"筛选" forState:UIControlStateNormal];
    [self.filterButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    self.filterButton.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    [self.filterButton addTarget:self action:@selector(filterButtonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addArrangedSubview:self.filterButton];
}

- (void)sortButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSString *type = NSStringFromYCAccessoryPrecurementSortType(button.tag);
    NSLog(@"sortButtonOnClicked: %@", type);
#endif
    if (self.currentSortType == button.tag) {
        [self.sortButtons[button.tag] updateToNextButtonState];
    } else {
        [self.sortButtons[self.currentSortType] resetButtonState];
        [self.sortButtons[button.tag] updateToNextButtonState];
        self.currentSortType = button.tag;
    }
}

- (void)filterButtonOnClicked:(UIButton *)button event:(UIControlEvents)event {
#if DEBUG
    NSLog(@"filterButtonOnClicked");
#endif
}

- (YCAccessoryPrecurementSortButton *)makeSortButtonFrom:(YCAccessoryPrecurementSortType)type {
    YCAccessoryPrecurementSortButton *button = YCAccessoryPrecurementSortButton.new;
    button.tag = type;
    button.label.text = NSStringFromYCAccessoryPrecurementSortType(type);
    [button addTarget:self action:@selector(sortButtonOnClicked:event:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

NSArray<NSNumber *> * YCAccessoryPrecurementFilterItemAllItems(void) {
    NSMutableArray<NSNumber *> *items = [NSMutableArray array];
    for(NSInteger i = 0; i <     YCAccessoryPrecurementSortTypeEnd; i++) {
        [items addObject:@(i)];
    }

    return items.copy;
}

NSString * NSStringFromYCAccessoryPrecurementSortType(YCAccessoryPrecurementSortType item) {
    switch (item) {
        case YCAccessoryPrecurementSortTypeDistance:
            return @"距离";
            break;
        case YCAccessoryPrecurementSortTypePrice:
            return @"价格";
            break;
        case YCAccessoryPrecurementSortTypeSales:
            return @"销量";
            break;
        default:
            return @"";
            break;
    }
}

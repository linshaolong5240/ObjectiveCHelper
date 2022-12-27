//
//  UILabelDemoViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/20.
//

#import "UILabelDemoViewController.h"

@interface UILabelDemoViewController ()

@end

@implementation UILabelDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UILabel Demo";
    [self configureContentView];
}

- (void)configureContentView {
    UILabel *label = [[UILabel alloc] init];
    label.attributedText = [NSAttributedString attributedStringWithLabel:@"price:"
                                                               labelFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]
                                                              labelColor:UIColor.grayColor
                                                                   value:@"$298.45" valueFont:[UIFont systemFontOfSize:20 weight:UIFontWeightMedium]
                                                              valueColor:UIColor.redColor];
    
    [self.contentView addArrangedSubview:label];
}

-(NSAttributedString *)makeAttributedString:(NSString *)prefix value:(NSString *)value {
    NSDictionary<NSAttributedStringKey, id> *prefixAttr = @{
        NSFontAttributeName:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular],
        NSForegroundColorAttributeName:UIColor.grayColor,
    };
    NSDictionary<NSAttributedStringKey, id> *valueAttr = @{
        NSFontAttributeName:[UIFont systemFontOfSize:12 weight:UIFontWeightRegular],
        NSForegroundColorAttributeName:UIColor.blackColor,
    };
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] init];
    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:prefix attributes:prefixAttr]];
    [attrString appendAttributedString:[[NSAttributedString alloc] initWithString:value attributes:valueAttr]];
    return attrString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

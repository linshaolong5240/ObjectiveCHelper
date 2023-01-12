//
//  OUILabelCheckmarkTableViewCellData.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2023/1/11.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

#import "OUILabelCheckmarkTableViewCellData.h"

@implementation OUILabelCheckmarkTableViewCellData

- (instancetype)initWithText:(NSString *)text selected:(BOOL)selected {
    self = [super init];
    if (self) {
        _text= text;
        _selected = selected;
    }
    return self;
}

- (instancetype)init {
    self = [self initWithText:@"" selected:NO];
    if (self) {
        
    }
    return self;
}

+ (instancetype)dataWithText:(NSString *)text selected:(BOOL)selected {
    OUILabelCheckmarkTableViewCellData *data = [[OUILabelCheckmarkTableViewCellData alloc] initWithText:text selected:selected];
    return data;
}

@end

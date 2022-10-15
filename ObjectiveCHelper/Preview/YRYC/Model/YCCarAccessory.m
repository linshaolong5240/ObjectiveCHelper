//
//  YCCarAccessory.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import "YCCarAccessory.h"

@implementation YCCarAccessory

+ (YCCarAccessory *)accseeoryWithName:(NSString *)name oem:(NSString *)oem quality:(NSString *)quality warranty: (NSString *)warranty {
    YCCarAccessory *accessory = [YCCarAccessory new];
    
    accessory.name = name;
    accessory.oem = oem;
    accessory.quality = quality;
    accessory.warranty = warranty;
    
    return accessory;
}

@end

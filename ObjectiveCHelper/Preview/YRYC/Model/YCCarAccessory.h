//
//  YCCarAccessory.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCCarAccessory : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *oem;
@property(nonatomic, strong) NSString *quality;
@property(nonatomic, strong) NSString *warranty;

+ (YCCarAccessory *)accseeoryWithName:(NSString *)name oem:(NSString *)oem quality:(NSString *)quality warranty: (NSString *)warranty;

@end

NS_ASSUME_NONNULL_END

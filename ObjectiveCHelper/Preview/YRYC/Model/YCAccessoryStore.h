//
//  YCAccessoryStore.h
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCAccessoryStore : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *locationString;

+ (YCAccessoryStore *)storeWithName:(NSString *)name locationString:(NSString*)locationString;

@end

NS_ASSUME_NONNULL_END

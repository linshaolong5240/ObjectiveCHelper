//
//  UIImage+OCH.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/11/23.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "UIImage+OCH.h"

@implementation UIImage (OCH)

+ (UIImage *)imageWithImageLight:(UIImage *)lightImage dark:(UIImage *)darkImage
{
    if (@available(iOS 13.0, *)) {
        UITraitCollection *const scaleTraitCollection = [UITraitCollection currentTraitCollection];
        UITraitCollection *const darkUnscaledTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        UITraitCollection *const darkScaledTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[scaleTraitCollection, darkUnscaledTraitCollection]];
        UIImage *image = [lightImage imageWithConfiguration:[lightImage.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]]];
        darkImage = [darkImage imageWithConfiguration:[darkImage.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]];
        [image.imageAsset registerImage:darkImage withTraitCollection:darkScaledTraitCollection];
        return image;
    } else {
        return lightImage;
    }
}

@end

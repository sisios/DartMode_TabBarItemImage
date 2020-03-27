//
//  UIColor+iOS13_DartModel.m
//  DartModel
//
//  Created by 未思语 on 2020/3/27.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UIColor+iOS13_DartModel.h"


@implementation UIColor (iOS13_DartModel)
+(UIColor *)ios_13LigthColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            } else {
                return lightColor;
            }
        }];
    }
    return nil;
}
@end

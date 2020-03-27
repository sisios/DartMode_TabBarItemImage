//
//  UITabBarController+iOS13_DartModel.m
//  DartModel
//
//  Created by 未思语 on 2020/3/27.
//  Copyright © 2020 mac. All rights reserved.
//

#import "UITabBarController+iOS13_DartModel.h"
#import "AppDelegate.h"

@implementation UITabBarController (iOS13_DartModel)
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (@available(iOS 13.0, *)){
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UITabBarController *tabbar = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        NSArray *navcs = tabbar.viewControllers;
        
        if (previousTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            int i = 0;
            for (UINavigationController *navc in navcs) {
                UIViewController *vc = (UIViewController *)([navc.viewControllers firstObject]);
                vc.tabBarItem.selectedImage = [[UIImage imageNamed:delegate.selectImgS[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                vc.tabBarItem.image = [[UIImage imageNamed:delegate.normalImgS[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                i++;
            }
            [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
           
        } else {
           int i = 0;
            for (UINavigationController *navc in navcs) {
                UIViewController *vc = (UIViewController *)([navc.viewControllers firstObject]);
                vc.tabBarItem.selectedImage = [[UIImage imageNamed:delegate.selectDartImgS[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                vc.tabBarItem.image = [[UIImage imageNamed:delegate.normalDartImgS[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                i++;
            }
            [[UITabBar appearance] setTintColor:[UIColor blackColor]];
        }
    }
}
@end

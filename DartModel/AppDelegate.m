//
//  AppDelegate.m
//  DartModel
//
//  Created by 未思语 on 2020/3/27.
//  Copyright © 2020 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIColor+iOS13_DartModel.h"


@interface AppDelegate ()
{
    UITabBarController *tabbar;
    UIViewController *oneVc;
    UIViewController *twoVc;
    UIViewController *threeVc;
    UIViewController *fourVc;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    tabbar = [[UITabBarController alloc]init];
    //情况1:暗黑模式切换中，只有unselectTabbarItem变化
//    [self case1_initialVC];
    //情况2:暗黑模式切换中，unselectTabbarItem跟selectTabbarItem 都需要变化
    [self case2_initialVC];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
}

//情况1
-(void)case1_initialVC {
    self.titleS = @[@"vc1",@"vc2",@"vc3",@"vc4"];
    self.normalImgS = @[@"tabbar_1_normal",@"tabbar_2_normal",@"tabbar_3_normal",@"tabbar_4_normal"];
    self.selectImgS = @[@"tabbar_1_select",@"tabbar_2_select",@"tabbar_3_select",@"tabbar_4_select"];
    oneVc = [ViewController new];
    [self addOneChildVC:oneVc title:self.titleS[0] normalImage:self.normalImgS[0] selectImage:self.selectImgS[0]];
    twoVc = [ViewController new];
    [self addOneChildVC:twoVc title:self.titleS[1] normalImage:self.normalImgS[1] selectImage:self.selectImgS[1]];
    threeVc = [ViewController new];
    [self addOneChildVC:threeVc title:self.titleS[2] normalImage:self.normalImgS[2] selectImage:self.selectImgS[2]];
    fourVc = [ViewController new];
    [self addOneChildVC:fourVc title:self.titleS[3] normalImage:self.normalImgS[3] selectImage:self.selectImgS[3]];
    
    
}
-(void)addOneChildVC:(UIViewController *)subVC title:(NSString *)title normalImage:(NSString *)normalStr selectImage:(NSString *)selectStr {
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [[UIImage imageNamed:normalStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    subVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:subVC];
    navc.navigationBar.tintColor = [UIColor ios_13LigthColor:[UIColor redColor] darkColor:[UIColor whiteColor]];
    navc.navigationItem.title = title;
    [tabbar addChildViewController:navc];
    if (@available(iOS 13.0, *)) {
        [UITabBar appearance].barTintColor = [UIColor ios_13LigthColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
        navc.navigationBar.barTintColor = [UIColor ios_13LigthColor:[UIColor blueColor] darkColor:[UIColor redColor]];
        
        [subVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor ios_13LigthColor:[UIColor redColor] darkColor:[UIColor whiteColor]]} forState:UIControlStateSelected];
        [subVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor ios_13LigthColor:[UIColor blueColor] darkColor:[UIColor whiteColor]]} forState:UIControlStateNormal];
        tabbar.tabBar.backgroundColor = [UIColor ios_13LigthColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
        tabbar.tabBar.barTintColor = [UIColor ios_13LigthColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
        

    }
}

//情况2
-(void)case2_initialVC {
     self.titleS = @[@"vc1",@"vc2",@"vc3",@"vc4"];
    //日间模式
     self.normalImgS = @[@"tabbar_news_normal_2",@"tabbar_video_normal_2",@"tabbar_icourse_normal_2",@"tabbar_mine_normal_2"];
     self.selectImgS = @[@"tabbar_news_select_2",@"tabbar_video_select_2",@"tabbar_icourse_select_2",@"tabbar_mine_select_2"];
    //夜间模式
    self.normalDartImgS = @[@"tabbar_news_normal_1",@"tabbar_video_normal_1",@"tabbar_icourse_normal_1",@"tabbar_mine_normal_1"];
    self.selectDartImgS = @[@"tabbar_news_select_1",@"tabbar_video_select_1",@"tabbar_icourse_select_1",@"tabbar_mine_select_1"];
    oneVc = [ViewController new];
    twoVc = [ViewController new];
    threeVc = [ViewController new];
    fourVc = [ViewController new];
    
    if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {//夜间模式
        
        [self addOneChildVC:oneVc title:self.titleS[0] normalImage:self.normalDartImgS[0] selectImage:self.selectDartImgS[0]];
       
        [self addOneChildVC:twoVc title:self.titleS[1] normalImage:self.normalDartImgS[1] selectImage:self.selectDartImgS[1]];
        
        [self addOneChildVC:threeVc title:self.titleS[2] normalImage:self.normalDartImgS[2] selectImage:self.selectDartImgS[2]];
        
        [self addOneChildVC:fourVc title:self.titleS[3] normalImage:self.normalDartImgS[3] selectImage:self.selectDartImgS[3]];
    } else {
        [self addOneChildVC:oneVc title:self.titleS[0] normalImage:self.normalImgS[0] selectImage:self.selectImgS[0]];
        
         [self addOneChildVC:twoVc title:self.titleS[1] normalImage:self.normalImgS[1] selectImage:self.selectImgS[1]];
         
         [self addOneChildVC:threeVc title:self.titleS[2] normalImage:self.normalImgS[2] selectImage:self.selectImgS[2]];
         
         [self addOneChildVC:fourVc title:self.titleS[3] normalImage:self.normalImgS[3] selectImage:self.selectImgS[3]];
    }
    
}

@end

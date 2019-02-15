//
//  LLFBaseTabBarViewController.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "LLFBaseTabBarViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface LLFBaseTabBarViewController ()

@end

@implementation LLFBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = RGBACOLOR(14, 20, 23, 1);

    NSDictionary *attrs = @{NSForegroundColorAttributeName:UIColorFromRGB(0x909192)};
    NSDictionary *selectedAttrs = @{NSForegroundColorAttributeName:UIColorFromRGB(0xB99A59)};
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setChildViewControllerWith:[[OneViewController alloc]init] :@"首页" :@"bs_hui" :@"bs_red"];
    [self setChildViewControllerWith:[[TwoViewController  alloc]init] :@"发现" :@"bs_hui" :@"bs_red"];
    [self setChildViewControllerWith:[[ThreeViewController alloc]init] :@"消息" :@"bs_hui" :@"bs_red"];
    [self setChildViewControllerWith:[[FourViewController alloc]init] :@"我的" :@"bs_hui" :@"bs_red"];
}

#pragma mark - private

- (void)setChildViewControllerWith:(UIViewController *)viewController :(NSString *)title :(NSString *)image :(NSString *)selectedImage
{
    LLFBaseNavigationeController *navigation = [[LLFBaseNavigationeController alloc]initWithRootViewController:viewController];
    viewController.navigationItem.title = title;
    navigation.tabBarItem.title = title;
    navigation.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigation.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navigation];
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

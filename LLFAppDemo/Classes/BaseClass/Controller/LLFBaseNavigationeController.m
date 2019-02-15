//
//  LLFBaseNavigationeController.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/14.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "LLFBaseNavigationeController.h"

@interface LLFBaseNavigationeController ()

@end

@implementation LLFBaseNavigationeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    NSLog(@"viewControllers  %lu",(unsigned long)self.viewControllers.count);
    if (self.viewControllers.count > 1)
    {
        //如果不是根式图控制器的话就创建左右导航条按钮
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"arrow_left_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(backToViewController)];
        viewController.navigationItem.leftBarButtonItems = @[leftBarButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
}

#pragma mark -private

- (void)backToViewController{
    [self popViewControllerAnimated:YES];
}

@end

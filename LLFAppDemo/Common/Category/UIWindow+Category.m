//
//  UIWindow+Category.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "UIWindow+Category.h"

@implementation UIWindow (Category)

- (void)switchRootViewController
{
    NSString *versonKey = @"CFBundleVersion";
    
    NSString *lastVerson = [[NSUserDefaults standardUserDefaults]objectForKey:versonKey];
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVerson = [infoDict objectForKey:versonKey];
    
    if ([lastVerson isEqualToString:currentVerson])
    {
        self.rootViewController = nil;
        self.rootViewController = [[LLFBaseTabBarViewController alloc] init];
    }
    else
    {
        self.rootViewController = [[NewFeatureViewController alloc]init];
        [[NSUserDefaults standardUserDefaults] setObject:currentVerson forKey:versonKey];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
}

@end

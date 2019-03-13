//
//  LLFBaseViewController.h
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/14.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLFBaseViewController : UIViewController

/**
 *  去登陆
 */
- (void)gotoLogin;

/**
 *  去注册
 */
- (void)gotoRegist;

/**
 *  关闭键盘
 */
- (void)closeKeyboard;

@end

NS_ASSUME_NONNULL_END

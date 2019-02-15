//
//  AppConfig.h
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

/* ****************************************************************************************************************** */

#ifdef DEBUG

#define DOMAIN_PATH                 @"http://114.55.232.19/caicai/api/v1/"

#else

#define DOMAIN_PATH                 @"http://apiv2.wocaicai.com/caicai/api/v1/"

#endif

/* ****************************************************************************************************************** */

#ifdef DEBUG

#define NSLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define NSLog( s, ... )

#endif

/* ****************************************************************************************************************** */


//获取屏幕宽度
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width

//获取屏幕高度
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

/* ****************************************************************************************************************** */
/**  颜色 **/

#define UIColorFromRGB(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0f green:((float)((hexValue & 0xFF00) >> 8))/255.0f blue:((float)(hexValue & 0xFF))/255.0f alpha:1.0]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


/* ****************************************************************************************************************** */

//** 沙盒路径 **/
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/* ****************************************************************************************************************** */

/**
 * 常用单例
 */
#define kUserDefaults   [NSUserDefaults standardUserDefaults]
#define kWindow         [[UIApplication sharedApplication] keyWindow]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

/**
 * View 圆角和加边框
 */
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
 * View 圆角
 */
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/* ****************************************************************************************************************** */
/**  其他 **/

//判断是否登录
#define IS_LOGIN [[NSUserDefaults standardUserDefaults] boolForKey:UD_IS_LOGIN]

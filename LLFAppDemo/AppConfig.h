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

/* *****************************************************只适用于竖屏************************************************************* */

//获取屏幕宽度
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width

//获取屏幕高度
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

// 判断是否为iPhone X 系列 根据底部有没有安全距离 横屏34 竖屏21
#define iPhoneXSeriess \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// iPhone X 系列 (安全区域 734 = 812 - kStatusBarHeight - KIndicatorHeight)

// 状态栏高度
#define kStatusBarHeight        [[UIApplication sharedApplication] statusBarFrame].size.height
// tabBar高度
#define kBottomBarHeight        (iPhoneXSeriess ? 83.f : 49.f)
// 导航栏高度
#define kNavigationBarHeight    (iPhoneXSeriess ? 88.f : 64.f)
// home indicator
#define KIndicatorHeight        (iPhoneXSeriess ? 34.f : 0.f)

//不同屏幕尺寸字体适配
#define kScreenWidthRatio  (KScreenWidth / 375.0)
#define kScreenHeightRatio (KScreenHeight / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
//#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenWidthRatio)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]

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

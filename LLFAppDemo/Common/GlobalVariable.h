//
//  GlobalVariable.h
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//
/**
 * 静态全局变量
 *之前常用的字符串常量，一般是抽成宏，但是苹果不推荐我们抽成宏，推荐我们使用const常量。
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalVariable : NSObject

#pragma mark - UserDefault字段
/**是否在登陆状态(BOOL)*/
UIKIT_EXTERN NSString *const UD_IS_LOGIN;
/**token*/
UIKIT_EXTERN NSString *const UD_ACCESS_TOKEN;
/**未读消息数*/
UIKIT_EXTERN NSString *const UD_UNREAD_COUNT;
/**金币数*/
UIKIT_EXTERN NSString *const UD_COIN_COUNT;
/**钻石数数*/
UIKIT_EXTERN NSString *const UD_DIAMOND_COUNT;
/**门票数数*/
UIKIT_EXTERN NSString *const UD_TICKETS_COUNT;
/**报名开始弹窗不再提示*/
UIKIT_EXTERN NSString *const UD_NO_REMINDER;
/**是否每日一菜弹窗*/
UIKIT_EXTERN NSString *const UD_IS_DAILY;
/**环信密码*/
UIKIT_EXTERN NSString *const UD_CHAT_PASSWORD;
/**环信账号 和 信鸽设置账号。 username*/
UIKIT_EXTERN NSString *const UD_CHAT_USERNAME;
/**好友邀请消息数*/
UIKIT_EXTERN NSString *const UD_FRIEND_COUNT;


#pragma mark - 通知名

/**登陆成功通知*/
UIKIT_EXTERN NSString *const NTF_LOGIN_SUCCESS;
/**退出登陆通知*/
UIKIT_EXTERN NSString *const NTF_LOGOUT_SUCCESS;
/**金币通知*/
UIKIT_EXTERN NSString *const NTF_COIN_CHANGE;
/**报名成功通知刷新首页数据*/
UIKIT_EXTERN NSString *const NTF_APPLY_SUCCESS;
/**报名成功通知刷新  官方比赛列表  数据*/
UIKIT_EXTERN NSString *const NTF_APPLY_OFFICE_SUCCESS;
/**创建俱乐部成功通知刷新  俱乐部列表  数据*/
UIKIT_EXTERN NSString *const NTF_CLUB_CREATE_SUCCESS;
/**俱乐部发布公告成功通知刷新  俱乐部公告列表  数据*/
UIKIT_EXTERN NSString *const NTF_CLUB_Publish_NOTICE_SUCCESS;
/**通知刷新  好友列表  数据*/
UIKIT_EXTERN NSString *const NTF_Mine_Friends_NOTICE_SUCCESS;
/**通知发送题目到群里面*/
UIKIT_EXTERN NSString *const NTF_CLUB_SEND_QUESTION_SUCCESS;
/**开奖成功 刷新开奖列表  数据*/
UIKIT_EXTERN NSString *const NTF_CLUB_OPEN_PRAISE_SUCCESS;
/**有关俱乐部部分设置后返回上一个页面 刷新房间信息  数据*/
UIKIT_EXTERN NSString *const NTF_CLUB_SETTING_SUCCESS;
@end

NS_ASSUME_NONNULL_END

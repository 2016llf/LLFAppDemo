//
//  GlobalVariable.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "GlobalVariable.h"

@implementation GlobalVariable

#pragma mark - UserDefault字段

NSString *const UD_IS_LOGIN = @"ud_is_login";

NSString *const UD_ACCESS_TOKEN = @"ud_access_token";

NSString *const UD_UNREAD_COUNT = @"ud_unread_count";

NSString *const UD_COIN_COUNT = @"ud_coin_count";

NSString *const UD_DIAMOND_COUNT = @"ud_diamond_count";

NSString *const UD_TICKETS_COUNT = @"ud_tickets_count";

NSString *const UD_NO_REMINDER = @"ud_no_reminder";

NSString *const UD_IS_DAILY = @"ud_is_daily";

NSString *const UD_CHAT_PASSWORD = @"ud_chat_password";

NSString *const UD_CHAT_USERNAME = @"ud_chat_username";

NSString *const UD_FRIEND_COUNT = @"ud_friend_count";


#pragma mark - 通知名

NSString *const NTF_LOGIN_SUCCESS = @"notification_login_success";

NSString *const NTF_LOGOUT_SUCCESS = @"notification_logout_success";

NSString *const NTF_COIN_CHANGE = @"notification_coin_change";

NSString *const NTF_APPLY_SUCCESS = @"notification_apply_success";

NSString *const NTF_APPLY_OFFICE_SUCCESS = @"notification_apply_offic_success";

NSString *const NTF_CLUB_CREATE_SUCCESS = @"notification_club_create_success";

NSString *const NTF_CLUB_Publish_NOTICE_SUCCESS = @"notification_club_publish_notice_success";

NSString *const NTF_Mine_Friends_NOTICE_SUCCESS = @"notification_mine_friends_notice_success";

NSString *const NTF_CLUB_SEND_QUESTION_SUCCESS = @"notification_club_question_success";

NSString *const NTF_CLUB_OPEN_PRAISE_SUCCESS = @"notification_club_open_praise_success";

NSString *const NTF_CLUB_SETTING_SUCCESS = @"notification_club_setting_success";


@end

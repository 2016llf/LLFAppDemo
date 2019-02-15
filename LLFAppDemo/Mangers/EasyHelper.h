//
//  EasyHelper.h
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EasyHelper : NSObject

/** 获取一个dateFormatter(公用) */
+ (NSDateFormatter *)shareDateFormatter;


/** 展示HUD信息 */
+ (void)showHUDWithMsg:(NSString *)msg duration:(NSTimeInterval)duration;

/** 展示加载菊花 */
+ (void)showLoadingFade;

/** 展示加载菊花InView */
+ (void)showLoadingFadeInView:(UIView *)view;

/** 移除加载菊花 */
+ (void)dismissLoadingFade;

/** 移除加载菊花InView */
+ (void)dismissLoadingFadeInView:(UIView *)view;

/** 获取色块图片 */
+ (UIImage *)getPureColorImageWithColor:(UIColor *)color size:(CGSize)size;

/** 缩放图片 */
+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size;

/** 对图片缩放并去模糊化处理 */
+ (UIImage *)excludeFuzzyImageFromCIImage:(CIImage *)image size: (CGFloat)size;



/**输入只能是数字*/
+ (BOOL)isdateNumber:(NSString*)number;

/**正则判断手机号码地址格式*/
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**判断字符串是否是空字符串的方法*/
+(BOOL) isBlankString:(NSString *)string ;

+ (BOOL)isAllChinese:(NSString *)str;
+ (BOOL)isEnglishLetter:(NSString *)str;
+ (BOOL)isPureUnsignedInt:(NSString *)string;

+ (NSString *)typeOfImageData:(NSData *)data;

/**SHA256加密方法*/
//+ (NSString *)hmacSha256:(NSString *)hashString hmacKey:(NSString *)key;
//+ (NSString *)hmacSha256:(NSString *)hashString token:(BOOL)token;

/**日期格式转字符串*/
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format;

/**字符串转日期格式*/
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format;

/**获取GMT时间*/
+ (NSString *)dateWithGMT;

///以秒为整数值 时间戳->字符串
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

///以秒为整数值 时间秒->字符串(只有在倒计时的题目地方用的了)
+ (NSString *)timeWithSeconds:(long)timeInteger;
@end

NS_ASSUME_NONNULL_END

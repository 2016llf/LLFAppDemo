//
//  EasyHelper.m
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import "EasyHelper.h"

@implementation EasyHelper

static NSDateFormatter *dateFormatter;

+ (NSDateFormatter *)shareDateFormatter {
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    return dateFormatter;
}

+ (void)showHUDWithMsg:(NSString *)msg duration:(NSTimeInterval)duration {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
//        hud.detailsLabelText = msg;
        hud.detailsLabel.text = msg;
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 1秒之后再消失
//        [hud hide:YES afterDelay:duration];
        [hud hideAnimated:YES afterDelay:duration];

    });
}

+ (void)showLoadingFade {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        // 先移除先前的效果
        BOOL shouldShowNew = YES;
        for (UIWindow *tWindow in [UIApplication sharedApplication].windows) {
            if (tWindow == window) {
                MBProgressHUD *hud = [window viewWithTag:19921128];
                if (hud) {
                    shouldShowNew = NO;
                }
            } else {
                MBProgressHUD *hud = [window viewWithTag:19921128];
                if (hud) {
//                    [hud hidean:NO];
                    [hud hideAnimated:NO];
                }
            }
        }
        
        // 添加新的效果
        if (shouldShowNew) {
            MBProgressHUD *hud = [MBProgressHUD  showHUDAddedTo:window animated:YES];
            hud.tag = 19921128;
            hud.mode = MBProgressHUDModeIndeterminate;//枚举类型不同的效果
            
//            hud.labelText = @"加载中...";
            hud.label.text = @"加载中...";

        }
    });
    
}

/** 展示加载菊花InView */
+ (void)showLoadingFadeInView:(UIView *)view
{
    // 先移除先前的效果
    [self dismissLoadingFadeInView:view];
    // 添加新的效果
    MBProgressHUD *hud = [MBProgressHUD  showHUDAddedTo:view animated:YES];
    hud.tag = 19921129;
    hud.mode = MBProgressHUDModeIndeterminate;//枚举类型不同的效果
//    hud.labelText = @"加载中...";
    hud.label.text = @"加载中...";

}

+ (void)dismissLoadingFade {
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            MBProgressHUD *hud = [window viewWithTag:19921128];
//            [hud hid:YES];
            [hud hideAnimated:YES];
        }
    });
}

/** 移除加载菊花InView */
+ (void)dismissLoadingFadeInView:(UIView *)view
{
    MBProgressHUD *hud = [view viewWithTag:19921129];
    //[hud hid:YES];
    [hud hideAnimated:YES];}


#pragma mark - 图片处理

+ (UIImage *)getPureColorImageWithColor:(UIColor *)color size:(CGSize)size {
    // stroke 画线，fill 填充(面)
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor); // 设置填充颜色
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height)); // 填充矩形区域
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)excludeFuzzyImageFromCIImage:(CIImage *)image size: (CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    //通过比例计算，让最终的图像大小合理（正方形是我们想要的）
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent)); size_t width = CGRectGetWidth(extent) * scale; size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext * context = [CIContext contextWithOptions: nil];
    CGImageRef bitmapImage = [context createCGImage: image fromRect: extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    //切记ARC模式下是不会对CoreFoundation框架的对象进行自动释放的，所以要我们手动释放
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage); CGColorSpaceRelease(colorSpace); return [UIImage imageWithCGImage: scaledImage];
}


#pragma mark - 输入只能是数字

+ (BOOL)isdateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

#pragma mark - 正则判断手机号码地址格式

+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 16[6], 17[5, 6, 7, 8], 18[0-9], 170[0-9], 19[89]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705,198
     * 联通号段: 130,131,132,155,156,185,186,145,175,176,1709,166
     * 电信号段: 133,153,180,181,189,177,1700,199
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|6[6]|7[05-8]|8[0-9]|9[89])\\d{8}$";
    
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478]|9[8])\\d{8}$)|(^1705\\d{7}$)";
    
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|66|7[56]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    
    NSString *CT = @"(^1(33|53|77|8[019]|99)\\d{8}$)|(^1700\\d{7}$)";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)
       || ([regextestcm evaluateWithObject:mobileNum] == YES)
       || ([regextestct evaluateWithObject:mobileNum] == YES)
       || ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - 判断字符串是否是空字符串的方法

+(BOOL) isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
    
}

#pragma mark 字符串处理

+ (BOOL)isAllChinese:(NSString *)str {
    for (int i = 0; i < str.length; i++) {
        unichar a = [str characterAtIndex:i];
        if (!(a > 0x4e00 && a < 0x9fff)) {// 含有非中文字符
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isEnglishLetter:(NSString *)str {
    for (int i = 0; i < str.length; i++) {
        char a = [str characterAtIndex:i];
        if (!((a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z'))) {// 含有非英文字符
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isPureUnsignedInt:(NSString *)string {
    if (string.length == 0) {
        return NO;
    }
    NSScanner *scan = [NSScanner scannerWithString:string];
    unsigned *val = NULL;
    return [scan scanHexInt:val] && [scan isAtEnd];
}


+ (NSString *)typeOfImageData:(NSData *)data {
    const char * bytes = data.bytes;
    
    if (bytes[1] == 'P' && bytes[2] == 'N' && bytes[3] == 'G') {
        return @"png";
    } else if (bytes[0] == 'G' && bytes[1] == 'I' && bytes[2] == 'F') {
        return @"gif";
    } else if (bytes[6] == 'J' && bytes[7] == 'F' && bytes[8] == 'I' && bytes[9] == 'F') {
        return @"gif";
    }
    return nil;
}
#pragma mark - 加密方法

///日期格式转字符串
+ (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format
{
    [[EasyHelper shareDateFormatter] setDateFormat:format];
    NSString *strDate = [[EasyHelper shareDateFormatter] stringFromDate:date];
    return strDate;
}

///字符串转日期格式
+ (NSDate *)stringToDate:(NSString *)dateString withDateFormat:(NSString *)format
{
    
    [[EasyHelper shareDateFormatter] setDateFormat:format];
    
    NSDate *date = [[EasyHelper shareDateFormatter] dateFromString:dateString];
    
    ///将世界时间转化为中国区时间
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    
    return localeDate;
}


+ (NSString *)dateWithGMT{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter  setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter  setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en"]];
    [dateFormatter  setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return currentDateStr;
}

///以秒为整数值的时间戳转换
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}



+ (NSString *)timeWithSeconds:(long)timeInteger
{
    NSString* dateString;
    
    if (timeInteger < 60 && timeInteger > 1) {
        long seconds = timeInteger % 60;
        dateString = [NSString stringWithFormat:@"%ld秒后结束",seconds];
    }
    else if (timeInteger >= 60 && timeInteger < 3600){
        long minutes = (timeInteger%(3600*24)%3600)/60;
        
        long seconds = timeInteger % 60;
        
        dateString = [NSString stringWithFormat:@"%ld分钟%ld秒后结束",minutes,seconds];
        
    }
    else if (timeInteger >= 3600 && timeInteger < 3600 * 24){
        long hours = timeInteger%(3600*24)/3600;
        
        long minutes = (timeInteger%(3600*24)%3600)/60;
        
        long seconds = timeInteger % 60;
        
        dateString = [NSString stringWithFormat:@"%ld小时%ld分钟%ld秒后结束",hours,minutes,seconds];
        
    }
    else if (timeInteger >= 3600 * 24 ){
        
        long days = timeInteger/(3600*24);
        
        long hours = timeInteger%(3600*24)/3600;
        
        if (hours > 1) {
            dateString = [NSString stringWithFormat:@"%ld天%ld小时后结束",days,hours];
        }else{
            dateString = [NSString stringWithFormat:@"%ld天后结束",days];
        }
    }
    else if (timeInteger == 0 ){
        dateString = [NSString stringWithFormat:@"已到期"];
    }
    return dateString;
}

@end


//
//  ConnectManger.h
//  LLFAppDemo
//
//  Created by 帮啦跑腿 on 2019/2/15.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectManger : NSObject

+ (ConnectManger *)sharedInstance;
/**
 *get请求
 */
-(void)getRequestWithUrl:(NSString*)url
              parameters:(id)parameters
                   token:(BOOL)token
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure;
/**
 * post请求
 */
- (void)postRequestWithUrl:(NSString *)URLString
             parametersDic:(NSDictionary*)parametersDic
                parameters:(id)parameters
                     token:(BOOL)token
                   success:(void(^)(id responseObject))success
                   failure:(void(^)(NSError *error))failure;


/**
 * patch请求
 */
- (void)patchRequestWithUrl:(NSString *)URLString
              parametersDic:(NSDictionary*)parametersDic
                 parameters:(id)parameters
                      token:(BOOL)token
                    success:(void(^)(id responseObject))success
                    failure:(void(^)(NSError *error))failure;



/**
 * delete请求
 */
- (void)deleteRequestWithUrl:(NSString *)URLString
                  parameters:(id)parameters
                       token:(BOOL)token
                     success:(void(^)(id responseObject))success
                     failure:(void(^)(NSError *error))failure;



/**
 * 上传图片
 */
- (void)postImageWithUrl:(NSString*)url
              parameters:(id)parameters
                   token:(BOOL)token
              imageArray:(NSArray *)array
                 success:(void (^)(id responseObject))success
    successBackfailError:(void (^)(id responseObject))successBackfailError
                 failure:(void(^)(NSError *error))failure;


///检测网络
-(void)startReachability;

@end

NS_ASSUME_NONNULL_END

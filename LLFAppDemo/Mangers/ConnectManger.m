////
////  ConnectManger.m
////  LLFAppDemo
////
////  Created by 帮啦跑腿 on 2019/2/15.
////  Copyright © 2019 刘龙飞. All rights reserved.
////
//
//#import "ConnectManger.h"
//
//@implementation ConnectManger
//
//
//+ (ConnectManger *)sharedInstance {
//    static ConnectManger * _sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedInstance = [[ConnectManger alloc] init];
//    });
//    return _sharedInstance;
//}
//
//
////get
//-(void)getRequestWithUrl:(NSString*)URLString
//              parameters:(id)parameters
//                   token:(BOOL)token
//                 success:(void(^)(id responseObject))success
//                 failure:(void(^)(NSError *error))failure
//{
//    NSLog(@"%@",URLString);
//    NSString * dateString = [EasyHelper dateWithGMT];
//    
//    NSString * parameterStr = [NSString stringWithFormat:@"date: %@",dateString];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:dateString forHTTPHeaderField:@"date"];
//    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"X-Api-Key"];
//    [manager.requestSerializer setValue:[EasyHelper hmacSha256:parameterStr token:token] forHTTPHeaderField:@"Authorization"];
//    
//    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        if (failure) {
//            failure(error);
//            [self startReachability];
//            
//        }
//    }];
//}
//
//
//
////post
//- (void)postRequestWithUrl:(NSString *)URLString
//             parametersDic:(NSDictionary*)parametersDic
//                parameters:(id)parameters
//                     token:(BOOL)token
//                   success:(void(^)(id responseObject))success
//                   failure:(void(^)(NSError *error))failure
//{
//    NSLog(@"%@",URLString);
//    
//    [EasyHelper showLoadingFade];
//    
//    NSString * dateString = [EasyHelper dateWithGMT];
//    //排序
//    NSArray *keyArr =  [parametersDic.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
//    NSString * parameterStr = [NSString stringWithFormat:@"date: %@\n",dateString];
//    for (int i = 0 ; i < keyArr.count; i ++) {
//        NSString * valueStr = [parametersDic objectForKey:[keyArr objectAtIndex:i]];
//        parameterStr = [parameterStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@\n",[keyArr objectAtIndex:i],[valueStr URLEncode]]];
//    }
//    
//    parameterStr = [parameterStr substringToIndex:parameterStr.length-1];
//    
//    //    NSLog(@"%@",parameterStr);
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:dateString forHTTPHeaderField:@"date"];
//    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"X-Api-Key"];
//    [manager.requestSerializer setValue:[EasyHelper hmacSha256:parameterStr token:token] forHTTPHeaderField:@"Authorization"];
//    
//    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//        [EasyHelper dismissLoadingFade];
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        [EasyHelper dismissLoadingFade];
//        if (failure) {
//            failure(error);
//            [self startReachability];
//            
//        }
//    }];
//}
//
//
//
////patch
//- (void)patchRequestWithUrl:(NSString *)URLString
//              parametersDic:(NSDictionary*)parametersDic
//                 parameters:(id)parameters
//                      token:(BOOL)token
//                    success:(void(^)(id responseObject))success
//                    failure:(void(^)(NSError *error))failure
//{
//    NSLog(@"%@",URLString);
//    [EasyHelper showLoadingFade];
//    
//    NSString * dateString = [EasyHelper dateWithGMT];
//    //排序
//    NSArray *keyArr =  [parametersDic.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
//    NSString * parameterStr = [NSString stringWithFormat:@"date: %@\n",dateString];
//    for (int i = 0 ; i < keyArr.count; i ++) {
//        NSString * valueStr = [parametersDic objectForKey:[keyArr objectAtIndex:i]];
//        parameterStr = [parameterStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@\n",[keyArr objectAtIndex:i],[valueStr URLEncode]]];
//    }
//    
//    parameterStr = [parameterStr substringToIndex:parameterStr.length-1];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:dateString forHTTPHeaderField:@"date"];
//    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"X-Api-Key"];
//    [manager.requestSerializer setValue:[EasyHelper hmacSha256:parameterStr token:token] forHTTPHeaderField:@"Authorization"];
//    
//    
//    [manager PATCH:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [EasyHelper dismissLoadingFade];
//        NSLog(@"%@",responseObject);
//        if (success) {
//            success(responseObject);
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        [EasyHelper dismissLoadingFade];
//        if (failure) {
//            failure(error);
//            [self startReachability];
//            
//        }
//        
//    }];
//}
//
////delete
//- (void)deleteRequestWithUrl:(NSString *)URLString
//                  parameters:(id)parameters
//                       token:(BOOL)token
//                     success:(void(^)(id responseObject))success
//                     failure:(void(^)(NSError *error))failure
//{
//    NSLog(@"%@",URLString);
//    [EasyHelper showLoadingFade];
//    
//    NSString * dateString = [EasyHelper dateWithGMT];
//    
//    NSString * parameterStr = [NSString stringWithFormat:@"date: %@",dateString];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:dateString forHTTPHeaderField:@"date"];
//    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"X-Api-Key"];
//    [manager.requestSerializer setValue:[EasyHelper hmacSha256:parameterStr token:token] forHTTPHeaderField:@"Authorization"];
//    
//    
//    [manager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [EasyHelper dismissLoadingFade];
//        NSLog(@"%@",responseObject);
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        [EasyHelper dismissLoadingFade];
//        if (failure) {
//            failure(error);
//            [self startReachability];
//            
//        }
//    }];
//}
//
////图片上传
//- (void)postImageWithUrl:(NSString*)url
//              parameters:(id)parameters
//                   token:(BOOL)token
//              imageArray:(NSArray *)array
//                 success:(void (^)(id responseObject))success
//    successBackfailError:(void (^)(id responseObject))successBackfailError
//                 failure:(void(^)(NSError *error))failure
//{
//    NSLog(@"%@",url);
//    [EasyHelper showLoadingFade];
//    
//    NSString * dateString = [EasyHelper dateWithGMT];
//    
//    NSString * parameterStr = [NSString stringWithFormat:@"date: %@",dateString];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:dateString forHTTPHeaderField:@"date"];
//    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"X-Api-Key"];
//    [manager.requestSerializer setValue:[EasyHelper hmacSha256:parameterStr token:token] forHTTPHeaderField:@"Authorization"];
//    
//    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (UIImage *image in array){
//            NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
//            if (imageData.length > 200) {
//                imageData = UIImageJPEGRepresentation(image, 200 / imageData.length);
//            };
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            formatter.dateFormat =@"yyyyMMddHHmmss";
//            NSString *str = [formatter stringFromDate:[NSDate date]];
//            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
//            [formData appendPartWithFileData:imageData
//                                        name:@"image"
//                                    fileName:fileName
//                                    mimeType:@"image/jpeg"];
//        }
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [EasyHelper dismissLoadingFade];
//        NSLog(@"%@",responseObject);
//        if (success){
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [EasyHelper dismissLoadingFade];
//        if (failure) {
//            failure(error);
//            [self startReachability];
//        }
//    }];
//    
//}
//
//
//
//
//-(void)startReachability{
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        // 当网络状态改变时调用
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                //                NSLog(@"未知网络");
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                //                NSLog(@"没有网络");
//                [EasyHelper showHUDWithMsg:@"你的网络不给力" duration:2];
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                //                NSLog(@"手机自带网络");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                //                NSLog(@"WIFI");
//                break;
//        }
//    }];
//}
//
//
//@end

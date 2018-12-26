//
//  NetWorkHelper.m
//  YBCH
//
//  Created by 贾增辉 on 2017/3/24.
//  Copyright © 2017年 kkjr. All rights reserved.
//

#import "NetWorkHelper.h"
#import "AFNetworking.h"
@implementation NetWorkHelper
+ (NetWorkHelper *)shareNetWorkEngine {
    static NetWorkHelper *netWorkEngine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorkEngine = [[NetWorkHelper alloc]init];
        
    });
    return netWorkEngine;
}
- (void)GetRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur {
    AFHTTPSessionManager *manager=[self Wangluo];
    
    [manager GET:urlStr parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);
    }];
}


- (void)PostResponseNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur {
//        [MBProgressHUD showMessage:@"loding..." ToView:nil];

    AFHTTPSessionManager *manager=[self Wangluo];
    
    [manager POST:urlStr parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
//        [MBProgressHUD hideHUD];
        if (responseObject==nil) {
            //Dlog(@"网络请求超时");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failur(error);
        //[MBProgressHUD hideHUD];

    }];
}
-(AFHTTPSessionManager*)Wangluo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //网络请求超时
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json",@"text/javascript",@"text/plain", nil];
    return manager;
}

+ (NSDictionary *)dataToDictionary:(NSData *)data
{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    return [self jsonToDictionary:str];
}
+ (NSDictionary *)jsonToDictionary:(NSString *)jsonString
{
    NSDictionary *JSON;
    if (jsonString && ![jsonString isEqual:[NSNull null]]) {
        NSError *error;
        JSON = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    }
    return JSON;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
// 上传多张图片
-(void)uploadMostImageWithURLString:(NSString *)URLString
                          parameters:(id)parameters
                         uploadDatas:(NSArray *)uploadDatas
                          uploadName:(NSString *)uploadName
                             success:(void (^)())success
                             failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id< AFMultipartFormData >  _Nonnull formData) {
        for (int i=0; i<uploadDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", uploadName, i];
            [formData appendPartWithFileData:uploadDatas[i] name:uploadName fileName:imageName mimeType:@"image/png"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}



@end

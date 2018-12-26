//
//  NetWorkHelper.h
//  YBCH
//
//  Created by 贾增辉 on 2017/3/24.
//  Copyright © 2017年 kkjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkHelper : NSObject
+ (NetWorkHelper *)shareNetWorkEngine;
- (void)GetRequestNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;

- (void)PostResponseNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter dataImg:(NSData*)data success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;

- (void)PostResponseNetInfoWithURLStrViaNet:(NSString *)urlStr parameters:(NSDictionary *)parameter success:(void (^)(id responseObject))success failur:(void (^)(id error))failur;
//data转字典
+ (NSDictionary *)dataToDictionary:(NSData *)data;
+ (NSDictionary *)jsonToDictionary:(NSString *)jsonString;
//json转化字典+h5
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
// 上传多张图片
-(void)uploadMostImageWithURLString:(NSString *)URLString
                          parameters:(id)parameters
                         uploadDatas:(NSArray *)uploadDatas
                          uploadName:(NSString *)uploadName
                             success:(void (^)())success
                             failure:(void (^)(NSError *))failure;
@end

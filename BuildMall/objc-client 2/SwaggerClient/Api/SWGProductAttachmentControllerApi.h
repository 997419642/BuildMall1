#import <Foundation/Foundation.h>
#import "SWGMessageResult.h"
#import "SWGProductAttachment.h"
#import "SWGApi.h"

/**
* Youmu Cloud Framework Swagger API 
* https://www.51wood.com
*
* OpenAPI spec version: 1.0
* Contact: archerchu@163.com
*
* NOTE: This class is auto generated by the swagger code generator program.
* https://github.com/swagger-api/swagger-codegen.git
* Do not edit the class manually.
*/



@interface SWGProductAttachmentControllerApi: NSObject <SWGApi>

extern NSString* kSWGProductAttachmentControllerApiErrorDomain;
extern NSInteger kSWGProductAttachmentControllerApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingDELETEWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingGETWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingHEADWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingOPTIONSWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingPATCHWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingPOSTWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 根据的商品id显示产品图片
/// 根据的商品id显示产品图片
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param goodsId 根据的商品id显示产品图片
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) productAttachmentListUsingPUTWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingDELETEWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingGETWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingHEADWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingOPTIONSWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingPATCHWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingPOSTWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 为一个订单添加装货信息
/// 为一个订单添加装货信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param productAttachment productAttachment (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateProductAttachmentUsingPUTWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;



@end

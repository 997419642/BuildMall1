#import <Foundation/Foundation.h>
#import "SWGMessageResult.h"
#import "SWGProductGoodsStoreBean.h"
#import "SWGScreenGoods.h"
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



@interface SWGGoodsControllerApi: NSObject <SWGApi>

extern NSString* kSWGGoodsControllerApiErrorDomain;
extern NSInteger kSWGGoodsControllerApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingDELETEWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingGETWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingHEADWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingOPTIONSWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingPATCHWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingPOSTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除商品根据商品id修改状态
/// 删除商品根据商品id修改状态
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param _id 商品id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteGoodsInfoUsingPUTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingDELETEWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingGETWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingHEADWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingOPTIONSWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingPATCHWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingPOSTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示商品信息列表
/// 显示商品信息列表
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) getGoodsUsingPUTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 添加板材商品信息
/// 添加板材商品信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param bean bean (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) insertGoodInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 添加原木商品信息
/// 添加原木商品信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param bean bean (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) insertGoodsLogInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingDELETEWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingGETWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingHEADWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingOPTIONSWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingPATCHWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingPOSTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有库存及条件查询
/// 查询所有库存及条件查询
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) selectStockUsingPUTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品原木信息编辑
/// 商品板材信息编辑
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param bean bean (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateGoodsInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品原木信息编辑
/// 商品原木信息编辑
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param bean bean (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) updateGoodsLogInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;



@end

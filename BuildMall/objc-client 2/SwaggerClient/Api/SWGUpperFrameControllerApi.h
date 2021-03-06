#import <Foundation/Foundation.h>
#import "SWGMessageResult.h"
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



@interface SWGUpperFrameControllerApi: NSObject <SWGApi>

extern NSString* kSWGUpperFrameControllerApiErrorDomain;
extern NSInteger kSWGUpperFrameControllerApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 批量浮动价格
/// 批量浮动价格
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param type 类型
/// @param price 批量定价 (optional)
/// @param batchPrice 批量浮动价格 (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) batchPriceUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    type: (NSNumber*) type
    price: (NSNumber*) price
    batchPrice: (NSNumber*) batchPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingDELETE1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingGET1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingHEAD1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingOPTIONS1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingPATCH1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingPOST1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 删除产品的上架信息
/// 删除产品的上架信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) deleteProductUsingPUT1WithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 上架资源根据类目id显示筛选信息
/// 上架资源根据类目id显示筛选信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param categoryId 类目id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionAttributeListUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 显示上架资源类目信息
/// 显示上架资源类目信息
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameConditionUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingDELETEWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingGETWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingHEADWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingOPTIONSWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingPATCHWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingPOSTWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 查询所有产品的上下架信息及筛选
/// 查询所有产品的上下架信息及筛选
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param status 状态值
/// @param screenGoods screenGoods (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductListUsingPUTWithAuthorization: (NSString*) authorization
    status: (NSNumber*) status
    screenGoods: (SWGScreenGoods*) screenGoods
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 产品上架或者是下架
/// 产品上架或者是下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 上架或者是下架值
/// @param productId productId (optional)
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameProductUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    productId: (NSArray<NSNumber*>*) productId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:204 message:"No Content",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;


/// 商品自动上下架
/// 商品自动上下架
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// @param storeId 店铺id
/// @param statusId 状态值
/// 
///  code:200 message:"OK",
///  code:201 message:"Created",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return SWGMessageResult*
-(NSURLSessionTask*) upperFrameStateUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    statusId: (NSNumber*) statusId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;



@end

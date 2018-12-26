#import <Foundation/Foundation.h>
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



@interface SWGSolrControllerApi: NSObject <SWGApi>

extern NSString* kSWGSolrControllerApiErrorDomain;
extern NSInteger kSWGSolrControllerApiMissingParamErrorCode;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient NS_DESIGNATED_INITIALIZER;

/// 所有信息添加solr
/// 所有信息添加solr
///
/// @param authorization 令牌 (default to 去其他请求中获取heard中token参数)
/// 
///  code:200 message:"OK",
///  code:401 message:"Unauthorized",
///  code:403 message:"Forbidden",
///  code:404 message:"Not Found"
///
/// @return void
-(NSURLSessionTask*) testUsingGETWithAuthorization: (NSString*) authorization
    completionHandler: (void (^)(NSError* error)) handler;



@end

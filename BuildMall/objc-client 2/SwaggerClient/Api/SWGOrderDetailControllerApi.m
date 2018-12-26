#import "SWGOrderDetailControllerApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGApiClient.h"
#import "SWGMessageResult.h"
#import "SWGOrderDetailBean.h"
#import "SWGLoadingCustomBean.h"


@interface SWGOrderDetailControllerApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation SWGOrderDetailControllerApi

NSString* kSWGOrderDetailControllerApiErrorDomain = @"SWGOrderDetailControllerApiErrorDomain";
NSInteger kSWGOrderDetailControllerApiMissingParamErrorCode = 234513;

@synthesize apiClient = _apiClient;

#pragma mark - Initialize methods

- (instancetype) init {
    return [self initWithApiClient:[SWGApiClient sharedClient]];
}


-(instancetype) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        _apiClient = apiClient;
        _mutableDefaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

-(NSString*) defaultHeaderForKey:(NSString*)key {
    return self.mutableDefaultHeaders[key];
}

-(void) setDefaultHeaderValue:(NSString*) value forKey:(NSString*)key {
    [self.mutableDefaultHeaders setValue:value forKey:key];
}

-(NSDictionary *)defaultHeaders {
    return self.mutableDefaultHeaders;
}

#pragma mark - Api Methods

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingDELETEWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingGETWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingHEADWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"HEAD"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingOPTIONSWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"OPTIONS"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingPATCHWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PATCH"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///

-(NSURLSessionTask*) customAddBoardGoodsUsingPOSTWithAuthorization: (NSString*) authorization bean: (SWGLoadingCustomBean*) bean completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }
    
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];
    
    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }
    
    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";
    
    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];
    
    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;
    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                               if(handler) {
                                   handler((SWGMessageResult*)data, error);
                               }
                           }];
}


//-(NSURLSessionTask*) customAddBoardGoodsUsingPOSTWithAuthorization: (NSString*) authorization
//    bean: (NSString*) bean
//    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
//    // verify the required parameter 'authorization' is set
//    if (authorization == nil) {
//        NSParameterAssert(authorization);
//        if(handler) {
//            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
//            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
//            handler(nil, error);
//        }
//        return nil;
//    }
//
//    // verify the required parameter 'bean' is set
//    if (bean == nil) {
//        NSParameterAssert(bean);
//        if(handler) {
//            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
//            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
//            handler(nil, error);
//        }
//        return nil;
//    }
//
//    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];
//
//    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
//
//    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
//    if (bean != nil) {
//        queryParams[@"bean"] = bean;
//    }
//    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
//    [headerParams addEntriesFromDictionary:self.defaultHeaders];
//    if (authorization != nil) {
//        headerParams[@"Authorization"] = authorization;
//    }
//    // HTTP header `Accept`
//    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
//    if(acceptHeader.length > 0) {
//        headerParams[@"Accept"] = acceptHeader;
//    }
//
//    // response content type
//    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";
//
//    // request content type
//    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];
//
//    // Authentication setting
//    NSArray *authSettings = @[];
//
//    id bodyParam = nil;
//    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
//
//    return [self.apiClient requestWithPath: resourcePath
//                                    method: @"POST"
//                                pathParams: pathParams
//                               queryParams: queryParams
//                                formParams: formParams
//                                     files: localVarFiles
//                                      body: bodyParam
//                              headerParams: headerParams
//                              authSettings: authSettings
//                        requestContentType: requestContentType
//                       responseContentType: responseContentType
//                              responseType: @"SWGMessageResult*"
//                           completionBlock: ^(id data, NSError *error) {
//                                if(handler) {
//                                    handler((SWGMessageResult*)data, error);
//                                }
//                            }];
//}

///
/// 自定义添加板材商品
/// 自定义添加板材商品
///  @param authorization 令牌 
///
///  @param bean json对象 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) customAddBoardGoodsUsingPUTWithAuthorization: (NSString*) authorization
    bean: (NSString*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'bean' is set
    if (bean == nil) {
        NSParameterAssert(bean);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"bean"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertLoadingCustom"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (bean != nil) {
        queryParams[@"bean"] = bean;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingDELETEWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingGETWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingHEADWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"HEAD"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingOPTIONSWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"OPTIONS"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingPATCHWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PATCH"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingPOSTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 删除详细订单
/// 删除详细订单
///  @param authorization 令牌 
///
///  @param _id 详细订单ID 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderDetailUsingPUTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter '_id' is set
    if (_id == nil) {
        NSParameterAssert(_id);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"_id"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/deleteOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (_id != nil) {
        queryParams[@"id"] = _id;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingDELETEWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingGETWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingHEADWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"HEAD"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingOPTIONSWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"OPTIONS"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingPATCHWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PATCH"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    NSLog(@"%@==%@",bodyParam,resourcePath);
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为某一个订单添加商品
/// 为某一个订单添加商品
///  @param authorization 令牌 
///
///  @param bean bean (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertOrderDetailUsingPUTWithAuthorization: (NSString*) authorization
    bean: (SWGOrderDetailBean*) bean
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/insertOrderDetail"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    bodyParam = bean;

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingDELETEWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingGETWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingHEADWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"HEAD"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"OPTIONS"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingPATCHWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PATCH"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingPOSTWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 订单详情更新价格
/// 订单详情更新价格
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param buyPrice 商品价格 
///
///  @param totalPrice 总金额 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateMoneyUsingPUTWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateMoney"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingDELETEWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"DELETE"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingGETWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingHEADWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"HEAD"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"OPTIONS"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingPATCHWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PATCH"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingPOSTWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}

///
/// 为订单商品加减件数更新库存
/// 为订单商品加减件数更新库存
///  @param authorization 令牌 
///
///  @param orderDetailId 详细订单id 
///
///  @param orderId 订单id 
///
///  @param goodsId 商品id 
///
///  @param lockNum 可售量 
///
///  @param buyPrice 单价 
///
///  @param totalPrice 总金额 
///
///  @param buyNumber 数量值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateNumPlusUsingPUTWithAuthorization: (NSString*) authorization
    orderDetailId: (NSNumber*) orderDetailId
    orderId: (NSNumber*) orderId
    goodsId: (NSNumber*) goodsId
    lockNum: (NSNumber*) lockNum
    buyPrice: (NSNumber*) buyPrice
    totalPrice: (NSNumber*) totalPrice
    buyNumber: (NSNumber*) buyNumber
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderDetailId' is set
    if (orderDetailId == nil) {
        NSParameterAssert(orderDetailId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderDetailId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'goodsId' is set
    if (goodsId == nil) {
        NSParameterAssert(goodsId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"goodsId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'lockNum' is set
    if (lockNum == nil) {
        NSParameterAssert(lockNum);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"lockNum"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyPrice' is set
    if (buyPrice == nil) {
        NSParameterAssert(buyPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'totalPrice' is set
    if (totalPrice == nil) {
        NSParameterAssert(totalPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"totalPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyNumber' is set
    if (buyNumber == nil) {
        NSParameterAssert(buyNumber);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyNumber"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderDetailControllerApiErrorDomain code:kSWGOrderDetailControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/orderDetail/updateNumPlus"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderDetailId != nil) {
        queryParams[@"orderDetailId"] = orderDetailId;
    }
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (goodsId != nil) {
        queryParams[@"goodsId"] = goodsId;
    }
    if (lockNum != nil) {
        queryParams[@"lockNum"] = lockNum;
    }
    if (buyPrice != nil) {
        queryParams[@"buyPrice"] = buyPrice;
    }
    if (totalPrice != nil) {
        queryParams[@"totalPrice"] = totalPrice;
    }
    if (buyNumber != nil) {
        queryParams[@"buyNumber"] = buyNumber;
    }
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.apiClient.configuration.defaultHeaders];
    [headerParams addEntriesFromDictionary:self.defaultHeaders];
    if (authorization != nil) {
        headerParams[@"Authorization"] = authorization;
    }
    // HTTP header `Accept`
    NSString *acceptHeader = [self.apiClient.sanitizer selectHeaderAccept:@[@"*/*"]];
    if(acceptHeader.length > 0) {
        headerParams[@"Accept"] = acceptHeader;
    }

    // response content type
    NSString *responseContentType = [[acceptHeader componentsSeparatedByString:@", "] firstObject] ?: @"";

    // request content type
    NSString *requestContentType = [self.apiClient.sanitizer selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];

    return [self.apiClient requestWithPath: resourcePath
                                    method: @"PUT"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMessageResult*"
                           completionBlock: ^(id data, NSError *error) {
                                if(handler) {
                                    handler((SWGMessageResult*)data, error);
                                }
                            }];
}



@end

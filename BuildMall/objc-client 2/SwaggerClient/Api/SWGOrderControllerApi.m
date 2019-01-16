#import "SWGOrderControllerApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGApiClient.h"
#import "SWGMessageResult.h"
#import "SWGOrderDetailBean.h"


@interface SWGOrderControllerApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation SWGOrderControllerApi

NSString* kSWGOrderControllerApiErrorDomain = @"SWGOrderControllerApiErrorDomain";
NSInteger kSWGOrderControllerApiMissingParamErrorCode = 234513;

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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 删除订单及详细订单
/// 删除订单及详细订单
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) deleteOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/delete"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单信息列表
/// 显示订单信息列表
///  @param authorization 令牌 
///
///  @param orderId 订单编号 (optional)
///
///  @param buyerId 用户id (optional)
///
///  @param storeId 店铺id (optional)
///
///  @param orderStatus 显示状态0：未审核，1：审核通过，2：未通过 (optional)
///
///  @param dateId 时间筛选id (optional)
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) getOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/list"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
    }
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (dateId != nil) {
        queryParams[@"dateId"] = dateId;
    }
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    userId:(NSNumber*)userId
    orderStatus:(NSString*)orderStatus
    payType: (NSNumber*) payType
    prepayPrice: (NSString*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

//    if (prepayPrice == nil) {
//        NSParameterAssert(prepayPrice);
//        if(handler) {
//            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
//            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
//            handler(nil, error);
//        }
//        return nil;
//    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (userId != nil) {
        queryParams[@"userId"] = userId;
    }
    if (payType != nil) {
        queryParams[@"orderStatus"] = orderStatus;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 订单详情审核
/// 订单详情审核
///  @param authorization 令牌 
///
///  @param orderId 订单id 
///
///  @param payType 结算方式 
///
///  @param prepayPrice 预付金额 
///
///  @param invoiceType 是否含税 
///
///  @param collectType 收款方式 
///
///  @param paymentAccountId 收款账户id 
///
///  @param buyerId 买家id 
///
///  @param orderDetailList orderDetailList (optional)
///
///  @param tailMoney 账户余额 (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderInfoUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'payType' is set
    if (payType == nil) {
        NSParameterAssert(payType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"payType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'prepayPrice' is set
    if (prepayPrice == nil) {
        NSParameterAssert(prepayPrice);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"prepayPrice"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'invoiceType' is set
    if (invoiceType == nil) {
        NSParameterAssert(invoiceType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"invoiceType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'collectType' is set
    if (collectType == nil) {
        NSParameterAssert(collectType);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"collectType"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'paymentAccountId' is set
    if (paymentAccountId == nil) {
        NSParameterAssert(paymentAccountId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"paymentAccountId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'buyerId' is set
    if (buyerId == nil) {
        NSParameterAssert(buyerId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"buyerId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/orderUpdate"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (payType != nil) {
        queryParams[@"payType"] = payType;
    }
    if (prepayPrice != nil) {
        queryParams[@"prepayPrice"] = prepayPrice;
    }
    if (tailMoney != nil) {
        queryParams[@"tailMoney"] = tailMoney;
    }
    if (invoiceType != nil) {
        queryParams[@"invoiceType"] = invoiceType;
    }
    if (collectType != nil) {
        queryParams[@"collectType"] = collectType;
    }
    if (paymentAccountId != nil) {
        queryParams[@"paymentAccountId"] = paymentAccountId;
    }
    if (buyerId != nil) {
        queryParams[@"buyerId"] = buyerId;
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
    bodyParam = orderDetailList;

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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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
/// 审核订单修改订单状态
/// 审核订单修改订单状态
///  @param authorization 令牌 
///
///  @param orderId 订单编号 
///
///  @param orderStatus 状态值 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) updateOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderId' is set
    if (orderId == nil) {
        NSParameterAssert(orderId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderId"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'orderStatus' is set
    if (orderStatus == nil) {
        NSParameterAssert(orderStatus);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"orderStatus"] };
            NSError* error = [NSError errorWithDomain:kSWGOrderControllerApiErrorDomain code:kSWGOrderControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/order/update"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (orderId != nil) {
        queryParams[@"orderId"] = orderId;
    }
    if (orderStatus != nil) {
        queryParams[@"orderStatus"] = orderStatus;
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

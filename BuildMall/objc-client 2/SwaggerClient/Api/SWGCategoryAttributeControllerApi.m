#import "SWGCategoryAttributeControllerApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGApiClient.h"
#import "SWGMallCategoryAttribute.h"
#import "SWGMessageResult.h"


@interface SWGCategoryAttributeControllerApi ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *mutableDefaultHeaders;

@end

@implementation SWGCategoryAttributeControllerApi

NSString* kSWGCategoryAttributeControllerApiErrorDomain = @"SWGCategoryAttributeControllerApiErrorDomain";
NSInteger kSWGCategoryAttributeControllerApiMissingParamErrorCode = 234513;

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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingDELETEWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingGETWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingHEADWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingOPTIONSWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingPATCHWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingPOSTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 根据类目id和属性名称查询属性信息
/// 根据类目id和属性名称查询属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @param attrName 属性名称 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) categoryAttributeListUsingPUTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    attrName: (NSString*) attrName
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'attrName' is set
    if (attrName == nil) {
        NSParameterAssert(attrName);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"attrName"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/categoryAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (categoryId != nil) {
        queryParams[@"categoryId"] = categoryId;
    }
    if (attrName != nil) {
        queryParams[@"attrName"] = attrName;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 所有筛选条件信息
/// 所有筛选条件信息
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) conditionListUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/conditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理根据类目显示所有的筛选条件
/// 商品管理根据类目id显示所有的筛选条件
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @param categoryId 类目id (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionAttributeListUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionAttributeList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 商品管理显示类目
/// 商品管理显示类目
///  @param authorization 令牌 
///
///  @param storeId 店铺id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) goodsConditionListUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'storeId' is set
    if (storeId == nil) {
        NSParameterAssert(storeId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"storeId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/goodsConditionList"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (storeId != nil) {
        queryParams[@"storeId"] = storeId;
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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingDELETEWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingGETWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingHEADWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingOPTIONSWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingPATCHWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingPOSTWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 添加类目的属性信息
/// 添加类目的属性信息
///  @param authorization 令牌 
///
///  @param mallCategoryAttribute mallCategoryAttribute (optional)
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) insertMallCategoryAttributeUsingPUTWithAuthorization: (NSString*) authorization
    mallCategoryAttribute: (SWGMallCategoryAttribute*) mallCategoryAttribute
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/insertMallCategoryAttribute"];

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
    bodyParam = mallCategoryAttribute;

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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingDELETEWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingGETWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingHEADWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingOPTIONSWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingPATCHWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingPOSTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息及品牌信息
/// 根据类目id显示属性信息及品牌信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryAttributeUsingPUTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategoryAttribute"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingDELETEWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingGETWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingHEADWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingOPTIONSWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingPATCHWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingPOSTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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
/// 根据类目id显示属性信息
/// 根据类目id显示属性信息
///  @param authorization 令牌 
///
///  @param categoryId 类目id 
///
///  @returns SWGMessageResult*
///
-(NSURLSessionTask*) showCategoryUsingPUTWithAuthorization: (NSString*) authorization
    categoryId: (NSNumber*) categoryId
    completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler {
    // verify the required parameter 'authorization' is set
    if (authorization == nil) {
        NSParameterAssert(authorization);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"authorization"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    // verify the required parameter 'categoryId' is set
    if (categoryId == nil) {
        NSParameterAssert(categoryId);
        if(handler) {
            NSDictionary * userInfo = @{NSLocalizedDescriptionKey : [NSString stringWithFormat:NSLocalizedString(@"Missing required parameter '%@'", nil),@"categoryId"] };
            NSError* error = [NSError errorWithDomain:kSWGCategoryAttributeControllerApiErrorDomain code:kSWGCategoryAttributeControllerApiMissingParamErrorCode userInfo:userInfo];
            handler(nil, error);
        }
        return nil;
    }

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/categoryAttribute/showCategory"];

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
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



@end

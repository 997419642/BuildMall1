# SWGBrandControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBrandUsingDELETE**](SWGBrandControllerApi.md#getbrandusingdelete) | **DELETE** /brandTable/list | 显示所有品牌信息
[**getBrandUsingGET**](SWGBrandControllerApi.md#getbrandusingget) | **GET** /brandTable/list | 显示所有品牌信息
[**getBrandUsingHEAD**](SWGBrandControllerApi.md#getbrandusinghead) | **HEAD** /brandTable/list | 显示所有品牌信息
[**getBrandUsingOPTIONS**](SWGBrandControllerApi.md#getbrandusingoptions) | **OPTIONS** /brandTable/list | 显示所有品牌信息
[**getBrandUsingPATCH**](SWGBrandControllerApi.md#getbrandusingpatch) | **PATCH** /brandTable/list | 显示所有品牌信息
[**getBrandUsingPOST**](SWGBrandControllerApi.md#getbrandusingpost) | **POST** /brandTable/list | 显示所有品牌信息
[**getBrandUsingPUT**](SWGBrandControllerApi.md#getbrandusingput) | **PUT** /brandTable/list | 显示所有品牌信息
[**insertBrandInfoUsingDELETE**](SWGBrandControllerApi.md#insertbrandinfousingdelete) | **DELETE** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingGET**](SWGBrandControllerApi.md#insertbrandinfousingget) | **GET** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingHEAD**](SWGBrandControllerApi.md#insertbrandinfousinghead) | **HEAD** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingOPTIONS**](SWGBrandControllerApi.md#insertbrandinfousingoptions) | **OPTIONS** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingPATCH**](SWGBrandControllerApi.md#insertbrandinfousingpatch) | **PATCH** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingPOST**](SWGBrandControllerApi.md#insertbrandinfousingpost) | **POST** /brandTable/insert | 添加品牌信息
[**insertBrandInfoUsingPUT**](SWGBrandControllerApi.md#insertbrandinfousingput) | **PUT** /brandTable/insert | 添加品牌信息


# **getBrandUsingDELETE**
```objc
-(NSURLSessionTask*) getBrandUsingDELETEWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingDELETEWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingGET**
```objc
-(NSURLSessionTask*) getBrandUsingGETWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingGETWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingHEAD**
```objc
-(NSURLSessionTask*) getBrandUsingHEADWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingHEADWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingOPTIONS**
```objc
-(NSURLSessionTask*) getBrandUsingOPTIONSWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingOPTIONSWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingPATCH**
```objc
-(NSURLSessionTask*) getBrandUsingPATCHWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingPATCHWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingPOST**
```objc
-(NSURLSessionTask*) getBrandUsingPOSTWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingPOSTWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBrandUsingPUT**
```objc
-(NSURLSessionTask*) getBrandUsingPUTWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示所有品牌信息

显示所有品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 显示所有品牌信息
[apiInstance getBrandUsingPUTWithAuthorization:authorization
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->getBrandUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingDELETE**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingDELETEWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingDELETEWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingGET**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingGETWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingGETWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingHEAD**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingHEADWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingHEADWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingOPTIONS**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingOPTIONSWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingOPTIONSWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingPATCH**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingPATCHWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingPATCHWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingPOST**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingPOSTWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingPOSTWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertBrandInfoUsingPUT**
```objc
-(NSURLSessionTask*) insertBrandInfoUsingPUTWithAuthorization: (NSString*) authorization
    brandTable: (SWGBrandTable*) brandTable
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加品牌信息

添加品牌信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGBrandTable* brandTable = [[SWGBrandTable alloc] init]; // brandTable (optional)

SWGBrandControllerApi*apiInstance = [[SWGBrandControllerApi alloc] init];

// 添加品牌信息
[apiInstance insertBrandInfoUsingPUTWithAuthorization:authorization
              brandTable:brandTable
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGBrandControllerApi->insertBrandInfoUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **brandTable** | [**SWGBrandTable***](SWGBrandTable.md)| brandTable | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


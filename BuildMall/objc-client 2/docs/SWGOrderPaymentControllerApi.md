# SWGOrderPaymentControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**selectOrderPaymentUsingDELETE**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingdelete) | **DELETE** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingGET**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingget) | **GET** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingHEAD**](SWGOrderPaymentControllerApi.md#selectorderpaymentusinghead) | **HEAD** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingOPTIONS**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingoptions) | **OPTIONS** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingPATCH**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingpatch) | **PATCH** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingPOST**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingpost) | **POST** /orderPayment/list | 显示该店铺所有的账户信息
[**selectOrderPaymentUsingPUT**](SWGOrderPaymentControllerApi.md#selectorderpaymentusingput) | **PUT** /orderPayment/list | 显示该店铺所有的账户信息


# **selectOrderPaymentUsingDELETE**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingDELETEWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingDELETEWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingGET**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingGETWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingGETWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingHEAD**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingHEADWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingHEADWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingOPTIONS**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingOPTIONSWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingOPTIONSWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingPATCH**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingPATCHWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingPATCHWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingPOST**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingPOSTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingPOSTWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPaymentUsingPUT**
```objc
-(NSURLSessionTask*) selectOrderPaymentUsingPUTWithAuthorization: (NSString*) authorization
    storeId: (NSNumber*) storeId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示该店铺所有的账户信息

显示该店铺所有的账户信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* storeId = @789; // 店铺id

SWGOrderPaymentControllerApi*apiInstance = [[SWGOrderPaymentControllerApi alloc] init];

// 显示该店铺所有的账户信息
[apiInstance selectOrderPaymentUsingPUTWithAuthorization:authorization
              storeId:storeId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPaymentControllerApi->selectOrderPaymentUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **storeId** | **NSNumber***| 店铺id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


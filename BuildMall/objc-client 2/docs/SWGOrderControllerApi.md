# SWGOrderControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteOrderUsingDELETE**](SWGOrderControllerApi.md#deleteorderusingdelete) | **DELETE** /order/delete | 删除订单及详细订单
[**deleteOrderUsingGET**](SWGOrderControllerApi.md#deleteorderusingget) | **GET** /order/delete | 删除订单及详细订单
[**deleteOrderUsingHEAD**](SWGOrderControllerApi.md#deleteorderusinghead) | **HEAD** /order/delete | 删除订单及详细订单
[**deleteOrderUsingOPTIONS**](SWGOrderControllerApi.md#deleteorderusingoptions) | **OPTIONS** /order/delete | 删除订单及详细订单
[**deleteOrderUsingPATCH**](SWGOrderControllerApi.md#deleteorderusingpatch) | **PATCH** /order/delete | 删除订单及详细订单
[**deleteOrderUsingPOST**](SWGOrderControllerApi.md#deleteorderusingpost) | **POST** /order/delete | 删除订单及详细订单
[**deleteOrderUsingPUT**](SWGOrderControllerApi.md#deleteorderusingput) | **PUT** /order/delete | 删除订单及详细订单
[**getOrderUsingDELETE**](SWGOrderControllerApi.md#getorderusingdelete) | **DELETE** /order/list | 订单信息列表
[**getOrderUsingGET**](SWGOrderControllerApi.md#getorderusingget) | **GET** /order/list | 订单信息列表
[**getOrderUsingHEAD**](SWGOrderControllerApi.md#getorderusinghead) | **HEAD** /order/list | 订单信息列表
[**getOrderUsingOPTIONS**](SWGOrderControllerApi.md#getorderusingoptions) | **OPTIONS** /order/list | 订单信息列表
[**getOrderUsingPATCH**](SWGOrderControllerApi.md#getorderusingpatch) | **PATCH** /order/list | 订单信息列表
[**getOrderUsingPOST**](SWGOrderControllerApi.md#getorderusingpost) | **POST** /order/list | 订单信息列表
[**getOrderUsingPUT**](SWGOrderControllerApi.md#getorderusingput) | **PUT** /order/list | 订单信息列表
[**updateOrderInfoUsingDELETE**](SWGOrderControllerApi.md#updateorderinfousingdelete) | **DELETE** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingGET**](SWGOrderControllerApi.md#updateorderinfousingget) | **GET** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingHEAD**](SWGOrderControllerApi.md#updateorderinfousinghead) | **HEAD** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingOPTIONS**](SWGOrderControllerApi.md#updateorderinfousingoptions) | **OPTIONS** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingPATCH**](SWGOrderControllerApi.md#updateorderinfousingpatch) | **PATCH** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingPOST**](SWGOrderControllerApi.md#updateorderinfousingpost) | **POST** /order/orderUpdate | 订单详情审核
[**updateOrderInfoUsingPUT**](SWGOrderControllerApi.md#updateorderinfousingput) | **PUT** /order/orderUpdate | 订单详情审核
[**updateOrderUsingDELETE**](SWGOrderControllerApi.md#updateorderusingdelete) | **DELETE** /order/update | 审核订单修改订单状态
[**updateOrderUsingGET**](SWGOrderControllerApi.md#updateorderusingget) | **GET** /order/update | 审核订单修改订单状态
[**updateOrderUsingHEAD**](SWGOrderControllerApi.md#updateorderusinghead) | **HEAD** /order/update | 审核订单修改订单状态
[**updateOrderUsingOPTIONS**](SWGOrderControllerApi.md#updateorderusingoptions) | **OPTIONS** /order/update | 审核订单修改订单状态
[**updateOrderUsingPATCH**](SWGOrderControllerApi.md#updateorderusingpatch) | **PATCH** /order/update | 审核订单修改订单状态
[**updateOrderUsingPOST**](SWGOrderControllerApi.md#updateorderusingpost) | **POST** /order/update | 审核订单修改订单状态
[**updateOrderUsingPUT**](SWGOrderControllerApi.md#updateorderusingput) | **PUT** /order/update | 审核订单修改订单状态


# **deleteOrderUsingDELETE**
```objc
-(NSURLSessionTask*) deleteOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingDELETEWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingGET**
```objc
-(NSURLSessionTask*) deleteOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingGETWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingHEAD**
```objc
-(NSURLSessionTask*) deleteOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingHEADWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingOPTIONS**
```objc
-(NSURLSessionTask*) deleteOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingOPTIONSWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingPATCH**
```objc
-(NSURLSessionTask*) deleteOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingPATCHWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingPOST**
```objc
-(NSURLSessionTask*) deleteOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingPOSTWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrderUsingPUT**
```objc
-(NSURLSessionTask*) deleteOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除订单及详细订单

删除订单及详细订单

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 删除订单及详细订单
[apiInstance deleteOrderUsingPUTWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->deleteOrderUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingDELETE**
```objc
-(NSURLSessionTask*) getOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingDELETEWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingGET**
```objc
-(NSURLSessionTask*) getOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingGETWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingHEAD**
```objc
-(NSURLSessionTask*) getOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingHEADWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingOPTIONS**
```objc
-(NSURLSessionTask*) getOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingOPTIONSWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingPATCH**
```objc
-(NSURLSessionTask*) getOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingPATCHWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingPOST**
```objc
-(NSURLSessionTask*) getOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingPOSTWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrderUsingPUT**
```objc
-(NSURLSessionTask*) getOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSString*) orderId
    buyerId: (NSNumber*) buyerId
    storeId: (NSNumber*) storeId
    orderStatus: (NSNumber*) orderStatus
    dateId: (NSNumber*) dateId
    categoryId: (NSNumber*) categoryId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单信息列表

显示订单信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSString* orderId = @"orderId_example"; // 订单编号 (optional)
NSNumber* buyerId = @789; // 用户id (optional)
NSNumber* storeId = @789; // 店铺id (optional)
NSNumber* orderStatus = @56; // 显示状态0：未审核，1：审核通过，2：未通过 (optional)
NSNumber* dateId = @56; // 时间筛选id (optional)
NSNumber* categoryId = @789; // 类目id (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单信息列表
[apiInstance getOrderUsingPUTWithAuthorization:authorization
              orderId:orderId
              buyerId:buyerId
              storeId:storeId
              orderStatus:orderStatus
              dateId:dateId
              categoryId:categoryId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->getOrderUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSString***| 订单编号 | [optional] 
 **buyerId** | **NSNumber***| 用户id | [optional] 
 **storeId** | **NSNumber***| 店铺id | [optional] 
 **orderStatus** | **NSNumber***| 显示状态0：未审核，1：审核通过，2：未通过 | [optional] 
 **dateId** | **NSNumber***| 时间筛选id | [optional] 
 **categoryId** | **NSNumber***| 类目id | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingDELETE**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingDELETEWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingGET**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingGETWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingHEAD**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingHEADWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingOPTIONS**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingOPTIONSWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingPATCH**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingPATCHWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingPOST**
```objc
-(NSURLSessionTask*) updateOrderInfoUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    payType: (NSNumber*) payType
    prepayPrice: (NSNumber*) prepayPrice
    invoiceType: (NSNumber*) invoiceType
    collectType: (NSNumber*) collectType
    paymentAccountId: (NSNumber*) paymentAccountId
    buyerId: (NSNumber*) buyerId
    orderDetailList: (NSArray<SWGOrderDetailBean>*) orderDetailList
    tailMoney: (NSNumber*) tailMoney
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingPOSTWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderInfoUsingPUT**
```objc
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
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

订单详情审核

订单详情审核

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id
NSNumber* payType = @56; // 结算方式
NSNumber* prepayPrice = @1.2; // 预付金额
NSNumber* invoiceType = @56; // 是否含税
NSNumber* collectType = @789; // 收款方式
NSNumber* paymentAccountId = @789; // 收款账户id
NSNumber* buyerId = @789; // 买家id
NSArray<SWGOrderDetailBean>* orderDetailList = @[[[SWGOrderDetailBean alloc] init]]; // orderDetailList (optional)
NSNumber* tailMoney = @789; // 账户余额 (optional)

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 订单详情审核
[apiInstance updateOrderInfoUsingPUTWithAuthorization:authorization
              orderId:orderId
              payType:payType
              prepayPrice:prepayPrice
              invoiceType:invoiceType
              collectType:collectType
              paymentAccountId:paymentAccountId
              buyerId:buyerId
              orderDetailList:orderDetailList
              tailMoney:tailMoney
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderInfoUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 
 **payType** | **NSNumber***| 结算方式 | 
 **prepayPrice** | **NSNumber***| 预付金额 | 
 **invoiceType** | **NSNumber***| 是否含税 | 
 **collectType** | **NSNumber***| 收款方式 | 
 **paymentAccountId** | **NSNumber***| 收款账户id | 
 **buyerId** | **NSNumber***| 买家id | 
 **orderDetailList** | [**NSArray&lt;SWGOrderDetailBean&gt;***](SWGOrderDetailBean.md)| orderDetailList | [optional] 
 **tailMoney** | **NSNumber***| 账户余额 | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingDELETE**
```objc
-(NSURLSessionTask*) updateOrderUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingDELETEWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingGET**
```objc
-(NSURLSessionTask*) updateOrderUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingGETWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingHEAD**
```objc
-(NSURLSessionTask*) updateOrderUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingHEADWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingOPTIONS**
```objc
-(NSURLSessionTask*) updateOrderUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingOPTIONSWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingPATCH**
```objc
-(NSURLSessionTask*) updateOrderUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingPATCHWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingPOST**
```objc
-(NSURLSessionTask*) updateOrderUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingPOSTWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrderUsingPUT**
```objc
-(NSURLSessionTask*) updateOrderUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
    orderStatus: (NSNumber*) orderStatus
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

审核订单修改订单状态

审核订单修改订单状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单编号
NSNumber* orderStatus = @56; // 状态值

SWGOrderControllerApi*apiInstance = [[SWGOrderControllerApi alloc] init];

// 审核订单修改订单状态
[apiInstance updateOrderUsingPUTWithAuthorization:authorization
              orderId:orderId
              orderStatus:orderStatus
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderControllerApi->updateOrderUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单编号 | 
 **orderStatus** | **NSNumber***| 状态值 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


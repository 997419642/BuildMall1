# SWGOrderPackControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**insertLoadingCustomUsingDELETE**](SWGOrderPackControllerApi.md#insertloadingcustomusingdelete) | **DELETE** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingGET**](SWGOrderPackControllerApi.md#insertloadingcustomusingget) | **GET** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingHEAD**](SWGOrderPackControllerApi.md#insertloadingcustomusinghead) | **HEAD** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingOPTIONS**](SWGOrderPackControllerApi.md#insertloadingcustomusingoptions) | **OPTIONS** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingPATCH**](SWGOrderPackControllerApi.md#insertloadingcustomusingpatch) | **PATCH** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingPOST**](SWGOrderPackControllerApi.md#insertloadingcustomusingpost) | **POST** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertLoadingCustomUsingPUT**](SWGOrderPackControllerApi.md#insertloadingcustomusingput) | **PUT** /orderPack/insertLoadingCustom | 装货信息自定义添加
[**insertOrderPackUsingDELETE**](SWGOrderPackControllerApi.md#insertorderpackusingdelete) | **DELETE** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingGET**](SWGOrderPackControllerApi.md#insertorderpackusingget) | **GET** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingHEAD**](SWGOrderPackControllerApi.md#insertorderpackusinghead) | **HEAD** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingOPTIONS**](SWGOrderPackControllerApi.md#insertorderpackusingoptions) | **OPTIONS** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingPATCH**](SWGOrderPackControllerApi.md#insertorderpackusingpatch) | **PATCH** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingPOST**](SWGOrderPackControllerApi.md#insertorderpackusingpost) | **POST** /orderPack/insert | 为一个订单添加装货信息
[**insertOrderPackUsingPUT**](SWGOrderPackControllerApi.md#insertorderpackusingput) | **PUT** /orderPack/insert | 为一个订单添加装货信息
[**selectOrderPackUsingDELETE**](SWGOrderPackControllerApi.md#selectorderpackusingdelete) | **DELETE** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingGET**](SWGOrderPackControllerApi.md#selectorderpackusingget) | **GET** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingHEAD**](SWGOrderPackControllerApi.md#selectorderpackusinghead) | **HEAD** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingOPTIONS**](SWGOrderPackControllerApi.md#selectorderpackusingoptions) | **OPTIONS** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingPATCH**](SWGOrderPackControllerApi.md#selectorderpackusingpatch) | **PATCH** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingPOST**](SWGOrderPackControllerApi.md#selectorderpackusingpost) | **POST** /orderPack/list | 根据订单id显示装货信息
[**selectOrderPackUsingPUT**](SWGOrderPackControllerApi.md#selectorderpackusingput) | **PUT** /orderPack/list | 根据订单id显示装货信息
[**selectStockUsingDELETE1**](SWGOrderPackControllerApi.md#selectstockusingdelete1) | **DELETE** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingGET1**](SWGOrderPackControllerApi.md#selectstockusingget1) | **GET** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingHEAD1**](SWGOrderPackControllerApi.md#selectstockusinghead1) | **HEAD** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingOPTIONS1**](SWGOrderPackControllerApi.md#selectstockusingoptions1) | **OPTIONS** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingPATCH1**](SWGOrderPackControllerApi.md#selectstockusingpatch1) | **PATCH** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingPOST1**](SWGOrderPackControllerApi.md#selectstockusingpost1) | **POST** /orderPack/selectStock | 装货单显示所有商品的库存
[**selectStockUsingPUT1**](SWGOrderPackControllerApi.md#selectstockusingput1) | **PUT** /orderPack/selectStock | 装货单显示所有商品的库存


# **insertLoadingCustomUsingDELETE**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingDELETEWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingDELETEWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingGET**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingGETWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingGETWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingHEAD**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingHEADWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingHEADWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingOPTIONS**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingOPTIONSWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingPATCH**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingPATCHWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingPATCHWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingPOST**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingPOSTWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingPOSTWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertLoadingCustomUsingPUT**
```objc
-(NSURLSessionTask*) insertLoadingCustomUsingPUTWithAuthorization: (NSString*) authorization
    orderPackBean: (SWGOrderPackBean*) orderPackBean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货信息自定义添加

装货信息自定义添加

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGOrderPackBean* orderPackBean = [[SWGOrderPackBean alloc] init]; // orderPackBean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货信息自定义添加
[apiInstance insertLoadingCustomUsingPUTWithAuthorization:authorization
              orderPackBean:orderPackBean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertLoadingCustomUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderPackBean** | [**SWGOrderPackBean***](SWGOrderPackBean.md)| orderPackBean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingDELETE**
```objc
-(NSURLSessionTask*) insertOrderPackUsingDELETEWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingDELETEWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingGET**
```objc
-(NSURLSessionTask*) insertOrderPackUsingGETWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingGETWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingHEAD**
```objc
-(NSURLSessionTask*) insertOrderPackUsingHEADWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingHEADWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingOPTIONS**
```objc
-(NSURLSessionTask*) insertOrderPackUsingOPTIONSWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingOPTIONSWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingPATCH**
```objc
-(NSURLSessionTask*) insertOrderPackUsingPATCHWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingPATCHWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingPOST**
```objc
-(NSURLSessionTask*) insertOrderPackUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingPOSTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertOrderPackUsingPUT**
```objc
-(NSURLSessionTask*) insertOrderPackUsingPUTWithAuthorization: (NSString*) authorization
    bean: (NSArray<SWGOrderPackBean>*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSArray<SWGOrderPackBean>* bean = @[[[SWGOrderPackBean alloc] init]]; // bean (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance insertOrderPackUsingPUTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->insertOrderPackUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**NSArray&lt;SWGOrderPackBean&gt;***](SWGOrderPackBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingDELETE**
```objc
-(NSURLSessionTask*) selectOrderPackUsingDELETEWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingDELETEWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingGET**
```objc
-(NSURLSessionTask*) selectOrderPackUsingGETWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingGETWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingHEAD**
```objc
-(NSURLSessionTask*) selectOrderPackUsingHEADWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingHEADWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingOPTIONS**
```objc
-(NSURLSessionTask*) selectOrderPackUsingOPTIONSWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingOPTIONSWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingPATCH**
```objc
-(NSURLSessionTask*) selectOrderPackUsingPATCHWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingPATCHWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingPOST**
```objc
-(NSURLSessionTask*) selectOrderPackUsingPOSTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingPOSTWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectOrderPackUsingPUT**
```objc
-(NSURLSessionTask*) selectOrderPackUsingPUTWithAuthorization: (NSString*) authorization
    orderId: (NSNumber*) orderId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据订单id显示装货信息

根据订单id显示商品装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* orderId = @56; // 订单id

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 根据订单id显示装货信息
[apiInstance selectOrderPackUsingPUTWithAuthorization:authorization
              orderId:orderId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectOrderPackUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **orderId** | **NSNumber***| 订单id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingDELETE1**
```objc
-(NSURLSessionTask*) selectStockUsingDELETE1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingDELETE1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingDELETE1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingGET1**
```objc
-(NSURLSessionTask*) selectStockUsingGET1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingGET1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingGET1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingHEAD1**
```objc
-(NSURLSessionTask*) selectStockUsingHEAD1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingHEAD1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingHEAD1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingOPTIONS1**
```objc
-(NSURLSessionTask*) selectStockUsingOPTIONS1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingOPTIONS1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingOPTIONS1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingPATCH1**
```objc
-(NSURLSessionTask*) selectStockUsingPATCH1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingPATCH1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingPATCH1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingPOST1**
```objc
-(NSURLSessionTask*) selectStockUsingPOST1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingPOST1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingPOST1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingPUT1**
```objc
-(NSURLSessionTask*) selectStockUsingPUT1WithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

装货单显示所有商品的库存

装货单显示所有商品的库存

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];

// 装货单显示所有商品的库存
[apiInstance selectStockUsingPUT1WithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGOrderPackControllerApi->selectStockUsingPUT1: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **screenGoods** | [**SWGScreenGoods***](SWGScreenGoods.md)| screenGoods | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


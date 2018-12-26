# SWGGoodsControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteGoodsInfoUsingDELETE**](SWGGoodsControllerApi.md#deletegoodsinfousingdelete) | **DELETE** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingGET**](SWGGoodsControllerApi.md#deletegoodsinfousingget) | **GET** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingHEAD**](SWGGoodsControllerApi.md#deletegoodsinfousinghead) | **HEAD** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingOPTIONS**](SWGGoodsControllerApi.md#deletegoodsinfousingoptions) | **OPTIONS** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingPATCH**](SWGGoodsControllerApi.md#deletegoodsinfousingpatch) | **PATCH** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingPOST**](SWGGoodsControllerApi.md#deletegoodsinfousingpost) | **POST** /goods/delete | 删除商品根据商品id修改状态
[**deleteGoodsInfoUsingPUT**](SWGGoodsControllerApi.md#deletegoodsinfousingput) | **PUT** /goods/delete | 删除商品根据商品id修改状态
[**getGoodsUsingDELETE**](SWGGoodsControllerApi.md#getgoodsusingdelete) | **DELETE** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingGET**](SWGGoodsControllerApi.md#getgoodsusingget) | **GET** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingHEAD**](SWGGoodsControllerApi.md#getgoodsusinghead) | **HEAD** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingOPTIONS**](SWGGoodsControllerApi.md#getgoodsusingoptions) | **OPTIONS** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingPATCH**](SWGGoodsControllerApi.md#getgoodsusingpatch) | **PATCH** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingPOST**](SWGGoodsControllerApi.md#getgoodsusingpost) | **POST** /goods/showGoods | 显示商品信息列表
[**getGoodsUsingPUT**](SWGGoodsControllerApi.md#getgoodsusingput) | **PUT** /goods/showGoods | 显示商品信息列表
[**insertGoodInfoUsingPOST**](SWGGoodsControllerApi.md#insertgoodinfousingpost) | **POST** /goods/insertGoodsInfo | 添加板材商品信息
[**insertGoodsLogInfoUsingPOST**](SWGGoodsControllerApi.md#insertgoodsloginfousingpost) | **POST** /goods/insertGoodsLogInfo | 添加原木商品信息
[**selectStockUsingDELETE**](SWGGoodsControllerApi.md#selectstockusingdelete) | **DELETE** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingGET**](SWGGoodsControllerApi.md#selectstockusingget) | **GET** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingHEAD**](SWGGoodsControllerApi.md#selectstockusinghead) | **HEAD** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingOPTIONS**](SWGGoodsControllerApi.md#selectstockusingoptions) | **OPTIONS** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingPATCH**](SWGGoodsControllerApi.md#selectstockusingpatch) | **PATCH** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingPOST**](SWGGoodsControllerApi.md#selectstockusingpost) | **POST** /goods/selectStock | 查询所有库存及条件查询
[**selectStockUsingPUT**](SWGGoodsControllerApi.md#selectstockusingput) | **PUT** /goods/selectStock | 查询所有库存及条件查询
[**updateGoodsInfoUsingPOST**](SWGGoodsControllerApi.md#updategoodsinfousingpost) | **POST** /goods/updateInfo | 商品原木信息编辑
[**updateGoodsLogInfoUsingPOST**](SWGGoodsControllerApi.md#updategoodsloginfousingpost) | **POST** /goods/updateGoodsLogInfo | 商品原木信息编辑


# **deleteGoodsInfoUsingDELETE**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingDELETEWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingDELETEWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingGET**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingGETWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingGETWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingHEAD**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingHEADWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingHEADWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingOPTIONS**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingOPTIONSWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingOPTIONSWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingPATCH**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingPATCHWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingPATCHWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingPOST**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingPOSTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingPOSTWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGoodsInfoUsingPUT**
```objc
-(NSURLSessionTask*) deleteGoodsInfoUsingPUTWithAuthorization: (NSString*) authorization
    _id: (NSNumber*) _id
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

删除商品根据商品id修改状态

删除商品根据商品id修改状态

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* _id = @789; // 商品id

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 删除商品根据商品id修改状态
[apiInstance deleteGoodsInfoUsingPUTWithAuthorization:authorization
              _id:_id
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->deleteGoodsInfoUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **_id** | **NSNumber***| 商品id | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGoodsUsingDELETE**
```objc
-(NSURLSessionTask*) getGoodsUsingDELETEWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingDELETEWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingDELETE: %@", error);
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

# **getGoodsUsingGET**
```objc
-(NSURLSessionTask*) getGoodsUsingGETWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingGETWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingGET: %@", error);
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

# **getGoodsUsingHEAD**
```objc
-(NSURLSessionTask*) getGoodsUsingHEADWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingHEADWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingHEAD: %@", error);
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

# **getGoodsUsingOPTIONS**
```objc
-(NSURLSessionTask*) getGoodsUsingOPTIONSWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingOPTIONSWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingOPTIONS: %@", error);
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

# **getGoodsUsingPATCH**
```objc
-(NSURLSessionTask*) getGoodsUsingPATCHWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingPATCHWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingPATCH: %@", error);
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

# **getGoodsUsingPOST**
```objc
-(NSURLSessionTask*) getGoodsUsingPOSTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingPOSTWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingPOST: %@", error);
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

# **getGoodsUsingPUT**
```objc
-(NSURLSessionTask*) getGoodsUsingPUTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

显示商品信息列表

显示商品信息列表

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 显示商品信息列表
[apiInstance getGoodsUsingPUTWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->getGoodsUsingPUT: %@", error);
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

# **insertGoodInfoUsingPOST**
```objc
-(NSURLSessionTask*) insertGoodInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加板材商品信息

添加板材商品信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductGoodsStoreBean* bean = [[SWGProductGoodsStoreBean alloc] init]; // bean (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 添加板材商品信息
[apiInstance insertGoodInfoUsingPOSTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->insertGoodInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**SWGProductGoodsStoreBean***](SWGProductGoodsStoreBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **insertGoodsLogInfoUsingPOST**
```objc
-(NSURLSessionTask*) insertGoodsLogInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

添加原木商品信息

添加原木商品信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductGoodsStoreBean* bean = [[SWGProductGoodsStoreBean alloc] init]; // bean (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 添加原木商品信息
[apiInstance insertGoodsLogInfoUsingPOSTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->insertGoodsLogInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**SWGProductGoodsStoreBean***](SWGProductGoodsStoreBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectStockUsingDELETE**
```objc
-(NSURLSessionTask*) selectStockUsingDELETEWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingDELETEWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingDELETE: %@", error);
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

# **selectStockUsingGET**
```objc
-(NSURLSessionTask*) selectStockUsingGETWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingGETWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingGET: %@", error);
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

# **selectStockUsingHEAD**
```objc
-(NSURLSessionTask*) selectStockUsingHEADWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingHEADWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingHEAD: %@", error);
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

# **selectStockUsingOPTIONS**
```objc
-(NSURLSessionTask*) selectStockUsingOPTIONSWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingOPTIONSWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingOPTIONS: %@", error);
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

# **selectStockUsingPATCH**
```objc
-(NSURLSessionTask*) selectStockUsingPATCHWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingPATCHWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingPATCH: %@", error);
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

# **selectStockUsingPOST**
```objc
-(NSURLSessionTask*) selectStockUsingPOSTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingPOSTWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingPOST: %@", error);
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

# **selectStockUsingPUT**
```objc
-(NSURLSessionTask*) selectStockUsingPUTWithAuthorization: (NSString*) authorization
    screenGoods: (SWGScreenGoods*) screenGoods
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

查询所有库存及条件查询

查询所有库存及条件查询

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGScreenGoods* screenGoods = [[SWGScreenGoods alloc] init]; // screenGoods (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 查询所有库存及条件查询
[apiInstance selectStockUsingPUTWithAuthorization:authorization
              screenGoods:screenGoods
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->selectStockUsingPUT: %@", error);
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

# **updateGoodsInfoUsingPOST**
```objc
-(NSURLSessionTask*) updateGoodsInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

商品原木信息编辑

商品板材信息编辑

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductGoodsStoreBean* bean = [[SWGProductGoodsStoreBean alloc] init]; // bean (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 商品原木信息编辑
[apiInstance updateGoodsInfoUsingPOSTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->updateGoodsInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**SWGProductGoodsStoreBean***](SWGProductGoodsStoreBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGoodsLogInfoUsingPOST**
```objc
-(NSURLSessionTask*) updateGoodsLogInfoUsingPOSTWithAuthorization: (NSString*) authorization
    bean: (SWGProductGoodsStoreBean*) bean
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

商品原木信息编辑

商品原木信息编辑

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductGoodsStoreBean* bean = [[SWGProductGoodsStoreBean alloc] init]; // bean (optional)

SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];

// 商品原木信息编辑
[apiInstance updateGoodsLogInfoUsingPOSTWithAuthorization:authorization
              bean:bean
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGGoodsControllerApi->updateGoodsLogInfoUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **bean** | [**SWGProductGoodsStoreBean***](SWGProductGoodsStoreBean.md)| bean | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


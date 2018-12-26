# SWGProductAttachmentControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**productAttachmentListUsingDELETE**](SWGProductAttachmentControllerApi.md#productattachmentlistusingdelete) | **DELETE** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingGET**](SWGProductAttachmentControllerApi.md#productattachmentlistusingget) | **GET** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingHEAD**](SWGProductAttachmentControllerApi.md#productattachmentlistusinghead) | **HEAD** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingOPTIONS**](SWGProductAttachmentControllerApi.md#productattachmentlistusingoptions) | **OPTIONS** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingPATCH**](SWGProductAttachmentControllerApi.md#productattachmentlistusingpatch) | **PATCH** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingPOST**](SWGProductAttachmentControllerApi.md#productattachmentlistusingpost) | **POST** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**productAttachmentListUsingPUT**](SWGProductAttachmentControllerApi.md#productattachmentlistusingput) | **PUT** /productAttachment/productAttachmentList | 根据的商品id显示产品图片
[**updateProductAttachmentUsingDELETE**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingdelete) | **DELETE** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingGET**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingget) | **GET** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingHEAD**](SWGProductAttachmentControllerApi.md#updateproductattachmentusinghead) | **HEAD** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingOPTIONS**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingoptions) | **OPTIONS** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingPATCH**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingpatch) | **PATCH** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingPOST**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingpost) | **POST** /productAttachment/updateProductAttachment | 为一个订单添加装货信息
[**updateProductAttachmentUsingPUT**](SWGProductAttachmentControllerApi.md#updateproductattachmentusingput) | **PUT** /productAttachment/updateProductAttachment | 为一个订单添加装货信息


# **productAttachmentListUsingDELETE**
```objc
-(NSURLSessionTask*) productAttachmentListUsingDELETEWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingDELETEWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingGET**
```objc
-(NSURLSessionTask*) productAttachmentListUsingGETWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingGETWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingHEAD**
```objc
-(NSURLSessionTask*) productAttachmentListUsingHEADWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingHEADWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingOPTIONS**
```objc
-(NSURLSessionTask*) productAttachmentListUsingOPTIONSWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingOPTIONSWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingPATCH**
```objc
-(NSURLSessionTask*) productAttachmentListUsingPATCHWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingPATCHWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingPOST**
```objc
-(NSURLSessionTask*) productAttachmentListUsingPOSTWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingPOSTWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **productAttachmentListUsingPUT**
```objc
-(NSURLSessionTask*) productAttachmentListUsingPUTWithAuthorization: (NSString*) authorization
    goodsId: (NSNumber*) goodsId
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

根据的商品id显示产品图片

根据的商品id显示产品图片

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
NSNumber* goodsId = @789; // 根据的商品id显示产品图片

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 根据的商品id显示产品图片
[apiInstance productAttachmentListUsingPUTWithAuthorization:authorization
              goodsId:goodsId
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->productAttachmentListUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **goodsId** | **NSNumber***| 根据的商品id显示产品图片 | 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingDELETE**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingDELETEWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingDELETEWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingDELETE: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingGET**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingGETWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingGETWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingHEAD**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingHEADWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingHEADWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingHEAD: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingOPTIONS**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingOPTIONSWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingOPTIONSWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingOPTIONS: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingPATCH**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingPATCHWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingPATCHWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingPATCH: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingPOST**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingPOSTWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingPOSTWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingPOST: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProductAttachmentUsingPUT**
```objc
-(NSURLSessionTask*) updateProductAttachmentUsingPUTWithAuthorization: (NSString*) authorization
    productAttachment: (SWGProductAttachment*) productAttachment
        completionHandler: (void (^)(SWGMessageResult* output, NSError* error)) handler;
```

为一个订单添加装货信息

为一个订单添加装货信息

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)
SWGProductAttachment* productAttachment = [[SWGProductAttachment alloc] init]; // productAttachment (optional)

SWGProductAttachmentControllerApi*apiInstance = [[SWGProductAttachmentControllerApi alloc] init];

// 为一个订单添加装货信息
[apiInstance updateProductAttachmentUsingPUTWithAuthorization:authorization
              productAttachment:productAttachment
          completionHandler: ^(SWGMessageResult* output, NSError* error) {
                        if (output) {
                            NSLog(@"%@", output);
                        }
                        if (error) {
                            NSLog(@"Error calling SWGProductAttachmentControllerApi->updateProductAttachmentUsingPUT: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]
 **productAttachment** | [**SWGProductAttachment***](SWGProductAttachment.md)| productAttachment | [optional] 

### Return type

[**SWGMessageResult***](SWGMessageResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


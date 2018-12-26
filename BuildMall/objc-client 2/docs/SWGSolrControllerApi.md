# SWGSolrControllerApi

All URIs are relative to *https://192.168.0.128:8099*

Method | HTTP request | Description
------------- | ------------- | -------------
[**testUsingGET**](SWGSolrControllerApi.md#testusingget) | **GET** /solr/messageAll | 所有信息添加solr


# **testUsingGET**
```objc
-(NSURLSessionTask*) testUsingGETWithAuthorization: (NSString*) authorization
        completionHandler: (void (^)(NSError* error)) handler;
```

所有信息添加solr

所有信息添加solr

### Example 
```objc

NSString* authorization = @"去其他请求中获取heard中token参数"; // 令牌 (default to 去其他请求中获取heard中token参数)

SWGSolrControllerApi*apiInstance = [[SWGSolrControllerApi alloc] init];

// 所有信息添加solr
[apiInstance testUsingGETWithAuthorization:authorization
          completionHandler: ^(NSError* error) {
                        if (error) {
                            NSLog(@"Error calling SWGSolrControllerApi->testUsingGET: %@", error);
                        }
                    }];
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **NSString***| 令牌 | [default to 去其他请求中获取heard中token参数]

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json;charset=UTF-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


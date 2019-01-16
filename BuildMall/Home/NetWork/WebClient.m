//
//  WebClient.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "WebClient.h"



@implementation WebClient

+ (instancetype)sharedClient {
    static WebClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sharedClient = [[WebClient alloc] initWithBaseURL:[NSURL URLWithString:onewebUrlOld] sessionConfiguration:configuration];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        AFJSONResponseSerializer *serial = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        serial.acceptableContentTypes  = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];

        _sharedClient.responseSerializer = serial;
//        _sharedClient.requestSerializer = [AFJSONRequestSerializer  serializer];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        _sharedClient.requestSerializer.timeoutInterval = 10;

        
    });
    return _sharedClient;
}

//订单接口
- (NSURLSessionDataTask *)post:(NSString *)urlString parameters:(NSMutableDictionary *)params complete:(responseBlock) block{
    self.requestSerializer.timeoutInterval = 10;
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",onewebUrlOld,urlString];
        

    NSLog(@"%@--%@",url,params);
    
//    NSString* str = [params mj_JSONString];
    
    return [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            NSLog(@"-==%@",responseObject);
            
            ResponseMode* model = [ResponseMode mj_objectWithKeyValues:responseObject];
            block(model,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"错误原因:%@",str);
    }];
    
}

//订单接口
- (NSURLSessionDataTask *)get:(NSString*)urlString parameters:(NSDictionary *)params complete:(responseBlock) block{
    NSString *url = [NSString stringWithFormat:@"%@%@",onewebUrlOld,urlString];
    
    return [self GET:url parameters:params progress:nil success:^(NSURLSessionDataTask *__unused task,id resultObject){
        if (block) {
            NSLog(@"-==%@",resultObject);

            ResponseMode *model =[ResponseMode mj_objectWithKeyValues:resultObject];
            block(model,nil);
        }
        
    }failure:^(NSURLSessionDataTask *__unused task,NSError *e){
        
        if (block) {
            block(nil,e);
        }
    }];
}

//买家提货信息接口
- (NSURLSessionDataTask *)postTwo:(NSString *)urlString parameters:(NSMutableDictionary *)params complete:(responseBlock) block{
    self.requestSerializer.timeoutInterval = 10;
    
    
    NSString * url = [NSString stringWithFormat:@"%@%@",twowebUrlOld,urlString];
    
    
    NSLog(@"%@--%@",url,params);
    
    //    NSString* str = [params mj_JSONString];
    
    return [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            NSLog(@"-==%@",responseObject);
            
            ResponseMode* model = [ResponseMode mj_objectWithKeyValues:responseObject];
            block(model,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"错误原因:%@",str);
    }];
    
}

//买家提货信息接口
- (NSURLSessionDataTask *)getTwo:(NSString*)urlString parameters:(NSDictionary *)params complete:(responseBlock) block{
    NSString *url = [NSString stringWithFormat:@"%@%@",twowebUrlOld,urlString];
    
    return [self GET:url parameters:params progress:nil success:^(NSURLSessionDataTask *__unused task,id resultObject){
        if (block) {
            NSLog(@"-==%@",resultObject);
            
            ResponseMode *model =[ResponseMode mj_objectWithKeyValues:resultObject];
            block(model,nil);
        }
        
    }failure:^(NSURLSessionDataTask *__unused task,NSError *e){
        
        if (block) {
            block(nil,e);
        }
    }];
}


//聊天
- (NSURLSessionDataTask *)postThree:(NSString *)urlString parameters:(NSMutableDictionary *)params complete:(responseBlock) block{
    self.requestSerializer.timeoutInterval = 10;
    
    NSString * url = [NSString stringWithFormat:@"%@%@",threewebUrlOld,urlString];

    NSLog(@"%@--%@",url,params);
    
    
    return [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            NSLog(@"-==%@",responseObject);
            
            ResponseMode* model = [ResponseMode mj_objectWithKeyValues:responseObject];
            block(model,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"错误原因:%@",str);
    }];
}

//聊天
- (NSURLSessionDataTask *)getThree:(NSString*)urlString parameters:(NSDictionary *)params complete:(responseBlock) block{
    NSString *url = [NSString stringWithFormat:@"%@%@",threewebUrlOld,urlString];
    NSLog(@"%@--%@",url,params);

    return [self GET:url parameters:params progress:nil success:^(NSURLSessionDataTask *__unused task,id resultObject){
        if (block) {
            NSLog(@"-==%@",resultObject);
            
            ResponseMode *model =[ResponseMode mj_objectWithKeyValues:resultObject];
            block(model,nil);
        }
        
    }failure:^(NSURLSessionDataTask *__unused task,NSError *e){
        
        if (block) {
            block(nil,e);
        }
    }];
}

//通过用户id获取imToken
-(void)getTokenWithUserId:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self getThree:@"/ImController/select" parameters:parames complete:block];
}

//装货单修改价格
-(void)orderPackUpdateMoney:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/orderPack/updateMoney" parameters:parames complete:block];
}

//取消订单
-(void)orderCancelOrder:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/order/cancelOrder" parameters:parames complete:block];
}

//关闭订单
-(void)orderCloseOrder:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/order/closeOrder" parameters:parames complete:block];
}

-(void)orderTableShowReturnedType:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self getTwo:@"/orderTable/showReturnedType" parameters:parames complete:block];

}


-(void)orderTableShowDeliveryInformation:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self getTwo:@"/orderTable/showDeliveryInformation" parameters:parames complete:block];
}


-(void)orderArrivalMoney:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/order/arrivalMoney" parameters:parames complete:block];
}

-(void)orderLogSelectOrderLog:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/orderLog/selectOrderLog" parameters:parames complete:block];
}

//自定义添加板材商品
-(void)orderDetailInsertLoadingCustom:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderDetail/insertLoadingCustom" parameters:parames complete:block];
}

//删除装货信息
-(void)orderPackCancelPackages:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/orderPack/cancelPackages" parameters:parames complete:block];

}

//比较包号是否已装货
-(void)OrderPackComparePackages:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/orderPack/comparePackages" parameters:parames complete:block];

}

//为一个订单添加装货信息
-(void)orderPackInsert:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderPack/insert" parameters:parames complete:block];
}

//上架资源根据类目id显示筛选信息
-(void)upperFrameConditionAttributeList:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/upperFrameProduct/upperFrameConditionAttributeList" parameters:parames complete:block];

}

-(void)mallGoodsAttributeDetailsStockList:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/mallGoodsAttributeDetails/stockList" parameters:parames complete:block];

}


//为某一个订单添加商品
-(void)orderDetailInsertOrderDetail:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderDetail/insertOrderDetail" parameters:parames complete:block];

}

-(void)orderOrderUpdate:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/order/orderUpdate" parameters:parames complete:block];

}

-(void)orderDetailUpdateNumPlus:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderDetail/updateNumPlus" parameters:parames complete:block];

}


//该店铺所有的账户信息
-(void)orderPaymentList:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderPayment/list" parameters:parames complete:block];

}

//删除详细订单
-(void)deleteOrderDetail:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/orderDetail/deleteOrderDetail" parameters:parames complete:block];

}

//删除订单
-(void)orderDelete:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/order/delete" parameters:parames complete:block];
}

//订单信息列表
-(void)myOrder:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/order/list" parameters:parames complete:block];
}

//添加商品页请求所有商品
-(void)goodsShowGoods:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self post:@"/goods/showGoods" parameters:parames complete:block];

}


-(void)orderPackList:(NSMutableDictionary *)parames complete:(responseBlock)block
{
    [self get:@"/orderPack/list" parameters:parames complete:block];

}

@end

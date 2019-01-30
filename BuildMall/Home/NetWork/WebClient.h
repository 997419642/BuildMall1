//
//  WebClient.h
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ResponseMode.h"
#import "RequestModel.h"

typedef void (^responseBlock)(ResponseMode *result, NSError *error);


@interface WebClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

-(void)userFriendsGroupGroupByUserId:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)userFriendsGroupInsertGroup:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)getTokenWithUserId:(NSMutableDictionary *)parames complete:(responseBlock)block;
-(void)orderPackUpdateMoney:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderCancelOrder:(NSMutableDictionary *)parames complete:(responseBlock)block;
-(void)orderCloseOrder:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderTableShowReturnedType:(NSMutableDictionary *)parames complete:(responseBlock)block;
-(void)orderTableShowDeliveryInformation:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderArrivalMoney:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderLogSelectOrderLog:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderDetailInsertLoadingCustom:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderPackCancelPackages:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)OrderPackComparePackages:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderPackInsert:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)upperFrameConditionAttributeList:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)mallGoodsAttributeDetailsStockList:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderDetailInsertOrderDetail:(NSMutableDictionary *)parames complete:(responseBlock)block;


-(void)orderPackList:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderOrderUpdate:(NSMutableDictionary *)parames complete:(responseBlock)block;


-(void)orderDetailUpdateNumPlus:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderPaymentList:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)goodsShowGoods:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)deleteOrderDetail:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)orderDelete:(NSMutableDictionary *)parames complete:(responseBlock)block;

-(void)myOrder:(NSMutableDictionary *)parames complete:(responseBlock)block;

@end

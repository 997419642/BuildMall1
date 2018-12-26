//
//  OrderManageModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/4.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderDetailModel.h"
#import "OrderLogModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderManageModel : NSObject


@property(nonatomic,copy)NSString* storeName;
@property(nonatomic,copy)NSString* orderSn;
@property(nonatomic,copy)NSString* createTime;
@property(nonatomic,copy)NSString* orderStatus;

@property(nonatomic,copy)NSString* storeId;

@property(nonatomic,copy)NSString* orderId;
@property(nonatomic,copy)NSString* totalPrice;//总价

@property(nonatomic,copy)NSString* packages;//包号
@property(nonatomic,copy)NSString* buyerName;

@property(nonatomic,copy)NSString* buyerId;

@property(nonatomic,copy)NSString* invoiceType;//发票类型

@property(nonatomic,copy)NSString* payType;//付款方式

@property(nonatomic,copy)NSString* payImage;


@property(nonatomic,strong)NSArray<OrderDetailModel*> *orderDetailList;

@property(nonatomic,strong)NSArray<OrderLogModel*> *orderLogList;

@property(nonatomic,strong)NSArray *actualMoney;

@property(nonatomic,copy)NSString *isPicker;

@end

NS_ASSUME_NONNULL_END

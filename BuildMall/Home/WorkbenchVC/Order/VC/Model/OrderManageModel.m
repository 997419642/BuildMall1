//
//  OrderManageModel.m
//  BuildMall
//
//  Created by 51wood on 2018/12/4.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderManageModel.h"

@implementation OrderManageModel
+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"orderDetailList"  : [OrderDetailModel class],
             @"orderLogList" : [OrderLogModel class]};
}
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"orderId":@"id"};
}


@end

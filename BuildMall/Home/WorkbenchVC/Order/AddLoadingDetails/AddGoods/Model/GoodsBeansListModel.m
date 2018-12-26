//
//  ProductTableListModel.m
//  BuildMall
//
//  Created by 51wood on 2018/12/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "GoodsBeansListModel.h"

@implementation GoodsBeansListModel


+(NSDictionary *)mj_objectClassInArray{
    return @{
             @"productTableList"  : [GoodsTableModel class],
          };
}


+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"orderId":@"id"};
}

@end

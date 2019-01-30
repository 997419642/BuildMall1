//
//  OrderDBModel.m
//  BuildMall
//
//  Created by 51wood on 2019/1/4.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "OrderDBModel.h"

@implementation OrderDBModel


//重写无法正确赋值的key-value对，保证KVC对model对象赋值不出错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"对象无法正确赋值的键值对：%@",key);
    //    if ([key isEqualToString:@"id"]) {
    //        _num_id = value;
    //    }
}

//自定义初始化方法实现：方便快速构建对象
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//打印方法，辅助校验model对象的属性查看是否成功
-(NSString *)description{
    return [NSString stringWithFormat:@"noticeId:%@,orderDetailId:%@,buyNumber:%@,buyPrice:%@,unitNum:%@,goodsId:%@,stockNum:%@,lockNum:%@,goodsNuit:%@,packages:%@,genshu:%@,houdu:%@,kuandu:%@,changdu:%@shuzhong:%@,pinpai:%@,dengji:%@",_noticeId,_orderDetailId,_buyNumber,_buyPrice,_unitNum,_goodsId,_stockNum,_lockNum,_goodsNuit,_packages,_genshu,_houdu,_kuandu,_changdu,_shuzhong,_pinpai,_dengji];
}

/**
 *  数据库字段与对象属性相互对应
 *
 *  @return 映射表
 */
-(NSDictionary *)columnPropertyMapping{
    //key为数据库字段名，value为model属性
    return @{@"Id":@"noticeId",
             @"norderDetailId":@"orderDetailId",
             @"nbuyNumber":@"buyNumber",
             @"nbuyPrice":@"buyPrice",
             @"nunitNum":@"unitNum",
             @"ngoodsId":@"goodsId",
             @"nstockNum":@"stockNum",
             @"nlockNum":@"lockNum",
             @"ngoodsNuit":@"goodsNuit",
             @"npackages":@"packages",
             @"ngenshu":@"genshu",
             @"nhoudu":@"houdu",
             @"nkuandu":@"kuandu",
             @"nchangdu":@"changdu",
             @"nshuzhong":@"shuzhong",
             @"npinpai":@"pinpai",
             @"ndengji":@"dengji",
             @"nisCus":@"isCus",
             @"ncangku":@"cangku",
             @"ncategoryId":@"categoryId"
             };
}
@end

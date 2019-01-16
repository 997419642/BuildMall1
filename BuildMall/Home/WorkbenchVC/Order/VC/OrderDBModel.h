//
//  OrderDBModel.h
//  BuildMall
//
//  Created by 51wood on 2019/1/4.
//  Copyright © 2019 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColumnPropertyMappingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDBModel : NSObject<ColumnPropertyMappingDelegate>

@property (strong , nonatomic) NSString *noticeId;


@property (strong , nonatomic) NSString *orderDetailId;
@property (strong , nonatomic) NSString *buyNumber;
@property (strong , nonatomic) NSString *buyPrice;
@property (strong , nonatomic) NSString *unitNum;
@property (strong , nonatomic) NSString *goodsId;
@property (strong , nonatomic) NSString *stockNum;
@property (strong , nonatomic) NSString *lockNum;
@property (strong , nonatomic) NSString *goodsNuit;
@property (strong , nonatomic) NSString *packages;
@property (strong , nonatomic) NSString *genshu;
@property (strong , nonatomic) NSString *houdu;
@property (strong , nonatomic) NSString *kuandu;
@property (strong , nonatomic) NSString *changdu;
@property (strong , nonatomic) NSString *shuzhong;
@property (strong , nonatomic) NSString *pinpai;
@property (strong , nonatomic) NSString *dengji;

@property (strong , nonatomic) NSString *isCus;
@property (strong , nonatomic) NSString *cangku;


-(instancetype)initWithDictionary:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END

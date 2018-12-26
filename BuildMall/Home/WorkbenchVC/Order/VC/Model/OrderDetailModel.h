//
//  OrderDetailModel.h
//  BuildMall
//
//  Created by 51wood on 2018/12/4.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailModel : NSObject

@property(nonatomic,copy)NSString* orderDetailId;

@property(nonatomic,copy)NSString* buyNumber;

@property(nonatomic,copy)NSString* categoryId;

@property(nonatomic,copy)NSString* buyPrice;
@property(nonatomic,copy)NSString* address;

@property(nonatomic,copy)NSString* goodsName;

@property(nonatomic,copy)NSString* unitNum;
@property(nonatomic,copy)NSString* unitPrice;//单价

@property(nonatomic,copy)NSString* goodsId;

@property(nonatomic,copy)NSString* stockNum;
@property(nonatomic,copy)NSString* lockNum;



@property(nonatomic,copy)NSString* goodsNuit;
@property(nonatomic,copy)NSString* grade;
@property(nonatomic,strong)NSArray *warestoreList;

@property(nonatomic,strong)NSArray *productTableList;

@property(nonatomic,strong)NSArray *lengthAttributesList;

@property(nonatomic,copy)NSString* packages;



@end

NS_ASSUME_NONNULL_END

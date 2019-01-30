//
//  LoadingListVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"
#import "OrderManageModel.h"
#import "OrderDetailModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface LoadingListVC : BasicVC
@property(nonatomic,strong)NSMutableArray* deliveryOrderArray;
@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,assign)float allPrice;
@property(nonatomic,assign)int allNum;
@property(nonatomic,assign)float allUnit;

@property(nonatomic,assign)NSInteger sectionNum;

@property(nonatomic,copy)NSString *orderSn;

@property(nonatomic,copy)void(^slectBlock)(NSInteger senctionNum,NSString* orderId);


@end

NS_ASSUME_NONNULL_END

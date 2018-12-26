//
//  OrderManagementDetailVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderManagementDetailVC : BasicVC

@property(nonatomic,copy)NSString* orderId;


@property(nonatomic,copy)NSString* orderIdTwo;


@property(nonatomic,assign)NSInteger sectionNum;

@property(nonatomic,copy)void(^slectBlock)(NSInteger senctionNum,NSString* orderId);







@end

NS_ASSUME_NONNULL_END

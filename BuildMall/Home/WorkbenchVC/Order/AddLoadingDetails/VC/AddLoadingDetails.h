//
//  AddLoadingDetails.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddLoadingDetails : BasicVC

//订单编号
@property(nonatomic,copy)NSString *orderId;
@property(nonatomic,copy)NSString *categoryId;

//订单ID
@property(nonatomic,copy)NSString *orderIdTrue;

@property(nonatomic,assign)NSInteger sectionNum;



@end

NS_ASSUME_NONNULL_END

//
//  AddCustomVC.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"
#import "OrderDetailModel.h"
#import "OrderManageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddCustomVC : BasicVC

@property(nonatomic,strong)OrderDetailModel* detailModel;

@property(nonatomic,strong)OrderManageModel* model;

@end

NS_ASSUME_NONNULL_END

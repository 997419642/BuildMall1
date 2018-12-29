//
//  AddCustomPlankVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/18.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"
#import "OrderDetailModel.h"
#import "OrderManageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddCustomPlankVC : BasicVC

@property(nonatomic,strong)OrderDetailModel* detailModel;

@property(nonatomic,strong)OrderManageModel* model;

@property(nonatomic,copy)NSString *categoryId;


@end

NS_ASSUME_NONNULL_END

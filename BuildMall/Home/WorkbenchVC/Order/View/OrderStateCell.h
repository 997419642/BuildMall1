//
//  OrderStateCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"

NS_ASSUME_NONNULL_BEGIN
//弃用

@interface OrderStateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderSnLable;

@property (weak, nonatomic) IBOutlet UILabel *orderPriceLable;

@property(nonatomic,strong)OrderManageModel* model;

@property (weak, nonatomic) IBOutlet UILabel *orderState;

@end

NS_ASSUME_NONNULL_END

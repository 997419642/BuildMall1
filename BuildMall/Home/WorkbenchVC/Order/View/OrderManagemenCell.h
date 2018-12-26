//
//  OrderManagemenCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderManagemenCell : UITableViewCell

@property(nonatomic,strong)OrderDetailModel* model;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;





@end

NS_ASSUME_NONNULL_END

//
//  OrderAdressCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderAdressCell : UITableViewCell

@property(nonatomic,strong)OrderDetailModel* model;

@property(nonatomic,strong)NSDictionary* dict;

@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UILabel *adresslable;

@end

NS_ASSUME_NONNULL_END

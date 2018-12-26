//
//  OrderDetailOneCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderLogModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailOneCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property(nonatomic,strong)OrderLogModel* model;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;


@property (weak, nonatomic) IBOutlet UILabel *statelable;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *boomView;
@property (weak, nonatomic) IBOutlet UIImageView *midlleImg;

@end

NS_ASSUME_NONNULL_END

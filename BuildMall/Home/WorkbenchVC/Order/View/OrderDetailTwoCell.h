//
//  OrderDetailTwoCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailModel.h"
#import "OrderManageModel.h"


@protocol OrderDetailTwoCellDelegate <NSObject>

- (void)deleteAction:(NSString *)orderID;



@end

@interface OrderDetailTwoCell : UITableViewCell

@property (nonatomic, weak) id<OrderDetailTwoCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *namelable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UITextField *priceTF;

@property(nonatomic,strong)OrderDetailModel* model;

@property (weak, nonatomic) IBOutlet UIButton *priceBtn;

@property (weak, nonatomic) IBOutlet UIButton *addNumBtn;

@property (weak, nonatomic) IBOutlet UILabel *keshouLable;

@property(nonatomic,strong)OrderManageModel *manegeModel;
@property (weak, nonatomic) IBOutlet UIButton *jiaBtn;
@property (weak, nonatomic) IBOutlet UIButton *jianBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UILabel *rightLable;

@end


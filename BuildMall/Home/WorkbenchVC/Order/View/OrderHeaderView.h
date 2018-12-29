//
//  OrderHeaderView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderHeaderView;

#import "OrderManageModel.h"

@protocol OrderHeaderViewDelegate <NSObject>

- (void)goStoreAction:(NSString *)orderID;



@end

@interface OrderHeaderView : UIView

@property (nonatomic, weak) id<OrderHeaderViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *miniteLable;

@property (weak, nonatomic) IBOutlet UILabel *secondsLable;

@property (weak, nonatomic) IBOutlet UILabel *orderNum;
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *stateLable;
@property (weak, nonatomic) IBOutlet UILabel *stateDetail;

@property (weak, nonatomic) IBOutlet UILabel *guanbiLable;
@property(nonatomic,strong)OrderManageModel* model;

@property (strong, nonatomic)NSTimer* timer;

@property(nonatomic,copy)NSString* timeStr;

@end



//
//  OrderFooterView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderFooterView;

#import "OrderManageModel.h"

#import "OrderDetailModel.h"

@protocol OrderFooterViewDelegate <NSObject>

- (void)deleteAction:(NSString *)orderID;



@end

NS_ASSUME_NONNULL_BEGIN

@interface OrderFooterView : UIView

@property (nonatomic, weak) id<OrderFooterViewDelegate> delegate;


@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;


@property(nonatomic,strong)OrderManageModel* model;


@end

NS_ASSUME_NONNULL_END

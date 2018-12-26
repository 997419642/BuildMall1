//
//  OrderStateCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderStateCell.h"

//弃用

@implementation OrderStateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(OrderManageModel *)model
{
    _model = model;
    _orderSnLable.text = [NSString stringWithFormat:@"订单编号：%@",model.orderSn];
    _orderPriceLable.text = [NSString stringWithFormat:@"订单金额：￥%@",model.totalPrice];
    if ([model.orderStatus isEqualToString:@"0"]) {
        _orderState.text = @"已取消";
    }else if ([model.orderStatus isEqualToString:@"1"])
    {
        _orderState.text = @"待审核";
    }else if ([model.orderStatus isEqualToString:@"2"])
    {
        _orderState.text = @"待付款";

    }else if ([model.orderStatus isEqualToString:@"3"])
    {
        _orderState.text = @"待收款";

    }else if ([model.orderStatus isEqualToString:@"4"])
    {
        _orderState.text = @"待装货";

    }else if ([model.orderStatus isEqualToString:@"5"])
    {
        _orderState.text = @"待装货确认";

    }else if([model.orderStatus isEqualToString:@"6"])
    {
        _orderState.text = @"待结算";

    }else if([model.orderStatus isEqualToString:@"7"])
    {
        _orderState.text = @"待确认结算";

    }else if ([model.orderStatus isEqualToString:@"8"])
    {
        _orderState.text = @"待发货";

    }else if ([model.orderStatus isEqualToString:@"9"])
    {
        _orderState.text = @"待收货";

    }else if ([model.orderStatus isEqualToString:@"12"])
    {
        _orderState.text = @"已关闭";

    }
}



@end

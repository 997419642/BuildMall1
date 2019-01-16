//
//  AddGoodCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddGoodCell.h"
#import "OrderManageModel.h"

@implementation AddGoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _left.layer.masksToBounds = YES;
    _left.layer.borderColor = [UIColor colorWithHexString:@"8AD0CE"].CGColor;
    _left.layer.borderWidth = 1;
    _left.layer.cornerRadius =2;
    
    _right.layer.masksToBounds = YES;
    _right.layer.borderColor = [UIColor colorWithHexString:@"8AD0CE"].CGColor;
    _right.layer.borderWidth = 1;
    _right.layer.cornerRadius =2;
    
    CGFloat img_W = _left.imageView.frame.size.width;
    CGFloat tit_W = _left.titleLabel.frame.size.width;
    _left.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + 10 / 2),
        .bottom = 0,
        .right  =   (img_W + 10 / 2),
    };
    
    _left.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W + 10 / 2),
    };
    
    
    CGFloat img_W0 = _right.imageView.frame.size.width;
    CGFloat tit_W0 = _right.titleLabel.frame.size.width;
    _right.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W0 + 10 / 2),
        .bottom = 0,
        .right  =   (img_W0 + 10 / 2),
    };
    
    _right.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W0 + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W0 + 10 / 2),
    };
}

- (void)setModel:(OrderManageModel *)model
{
    if ([model.orderStatus isEqualToString:@"0"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }else if ([model.orderStatus isEqualToString:@"1"])
    {
        _addBtn.hidden = NO;
        _customBtn.hidden = NO;
        _meddleView.hidden = NO;
        
    }else if ([model.orderStatus isEqualToString:@"2"])
    {
        _addBtn.hidden = NO;
        _customBtn.hidden = NO;
        _meddleView.hidden = NO;

    }else if ([model.orderStatus isEqualToString:@"3"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
        
    }else if ([model.orderStatus isEqualToString:@"4"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;

    }else if ([model.orderStatus isEqualToString:@"5"])
    {
        
    }else if ([model.orderStatus isEqualToString:@"6"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
        
    }else if ([model.orderStatus isEqualToString:@"7"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }else if ([model.orderStatus isEqualToString:@"8"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }else if ([model.orderStatus isEqualToString:@"9"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }else if ([model.orderStatus isEqualToString:@"12"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }else if ([model.orderStatus isEqualToString:@"10"])
    {
        _addBtn.hidden = YES;
        _customBtn.hidden = YES;
        _meddleView.hidden = YES;
    }
    
    NSMutableArray* numArray = [NSMutableArray array];
    NSMutableArray* unitArray = [NSMutableArray array];

    for (OrderDetailModel* model0 in model.orderDetailList) {
        [numArray addObject:model0.buyNumber];
        
        float num = [model0.unitNum floatValue] * [model0.buyNumber floatValue];
        [unitArray addObject:@(num)];
    }

    OrderDetailModel* detailModel = model.orderDetailList[0];
    
    int sum = [[numArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    float unit = [[unitArray valueForKeyPath:@"@sum.floatValue"] floatValue];

    if ((int)unit != unit) {
        
        _numLable.text = [NSString stringWithFormat:@"共%d件 %.3f%@",sum,unit,detailModel.goodsNuit];
    }else
    {
        _numLable.text = [NSString stringWithFormat:@"共%d件 %d%@",sum,(int)unit,detailModel.goodsNuit];
    }
    _allPriceLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
}

- (IBAction)addGoodsAction:(UIButton *)sender {
    
    [_delegate addgoods:_categoryId];
}

- (IBAction)addCustomGood:(UIButton *)sender {
    
    [_delegate addCustomgoods:_categoryId];
}

@end

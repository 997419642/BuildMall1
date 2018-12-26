//
//  OrderBoomCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderBoomCell.h"
#import <UIButton+WebCache.h>

@implementation OrderBoomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _shenheBtn.layer.cornerRadius = 5;
    _shenheBtn.layer.masksToBounds = YES;
    
    _closeBtn.layer.cornerRadius = 5;
    _closeBtn.layer.masksToBounds = YES;
    
    _sureLable.hidden = YES;
    _lookBtn.hidden = YES;
    _addLoadingDetails.hidden = YES;
    
    _addLoadingDetails.layer.masksToBounds = YES;
    _addLoadingDetails.layer.cornerRadius = 5;
    _lookBtn.layer.masksToBounds = YES;
    _lookBtn.layer.cornerRadius = 5;
    _lookBtn.layer.borderColor = MINE_Color.CGColor;
    _lookBtn.layer.borderWidth = 1;
    
    _oneBtn.userInteractionEnabled = NO;
    _twoBtn.userInteractionEnabled = NO;
    _threeBtn.userInteractionEnabled = NO;
    _payNum.userInteractionEnabled = NO;
    _remarkLable.hidden = YES;
    _remarkLable.text = @"";
    _threenameLable.hidden = YES;
    _weiKuanLable.hidden = YES;

}

-(void)setModel:(OrderManageModel *)model
{
    
    _model = model;
    if (model.actualMoney) {
        NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
        if (arr.count) {
            NSMutableDictionary* actualDict = arr[0];
            if (![actualDict[@"payImage"] isEqual:[NSNull null]]) {
                [_imgBtn sd_setImageWithURL:[NSURL URLWithString:actualDict[@"payImage"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"xxx"]];
            }
        }
    }
    
    if ([model.orderStatus isEqualToString:@"0"]) {
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            NSMutableArray* array = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* dicActual = array[0];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",dicActual[@"payAmount"]];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
            
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
    }else if ([model.orderStatus isEqualToString:@"1"])
    {
        //待卖家审核
        _top.constant = 0;
        _youhuiTF.hidden = YES;
        _youhuiLable.hidden = YES;
        _zhuanBtn.hidden = YES;
        _trueLable.hidden = YES;
        _actualTF.hidden = YES;
        _zhuanView.hidden = YES;
        _zheView.hidden = YES;
        _oneBtn.userInteractionEnabled = YES;
        _twoBtn.userInteractionEnabled = YES;
        _threeBtn.userInteractionEnabled = YES;
        _payNum.userInteractionEnabled = YES;
        
    }else if ([model.orderStatus isEqualToString:@"2"])
    {
        //卖家审核之后待买家付款
        _top.constant = 0;
        _youhuiTF.hidden = YES;
        _youhuiLable.hidden = YES;
        _zhuanBtn.hidden = YES;
        _trueLable.hidden = YES;
        _actualTF.hidden = YES;
        _zhuanView.hidden = YES;
        _zheView.hidden = YES;
        _oneBtn.userInteractionEnabled = YES;
        _twoBtn.userInteractionEnabled = YES;
        _threeBtn.userInteractionEnabled = YES;
        _payNum.userInteractionEnabled = YES;
        _addLoadingDetails.hidden = NO;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _shenheBtn.hidden = YES;
        _lookBtn.hidden = NO;

        _closeBtn.hidden = YES;
        [_addLoadingDetails setTitle:@"待付款" forState:UIControlStateNormal];
        _addLoadingDetails.userInteractionEnabled = NO;
        
        _addLoadingDetails.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
        
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            NSMutableArray* array = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* dicActual = array[0];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",dicActual[@"payAmount"]];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
            
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
    }else if ([model.orderStatus isEqualToString:@"3"])
    {
        //买家付款后待卖家确认收款
        _top.constant = 156.5;
        _youhuiTF.hidden = NO;
        _youhuiLable.hidden = NO;
        _zhuanBtn.hidden = NO;
        _trueLable.hidden = NO;
        _actualTF.hidden = NO;
        _zhuanView.hidden = NO;
        _zheView.hidden = NO;
        _shenheBtn.hidden = YES;
        _guizeBtn.hidden = YES;
        _sureLable.hidden = NO;
        _lookBtn.hidden = NO;
        _addLoadingDetails.hidden = NO;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        [_addLoadingDetails setTitle:@"确认到款" forState:UIControlStateNormal];
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            NSMutableArray* array = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* dicActual = array[0];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",dicActual[@"payAmount"]];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
            
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
    }else if ([model.orderStatus isEqualToString:@"4"])
    {
        //卖家到款后卖家待装货
        _top.constant = 60;
        _youhuiTF.hidden = YES;
        _youhuiLable.hidden = YES;
        _zhuanBtn.hidden = NO;
        _trueLable.hidden = YES;
        _actualTF.hidden = YES;
        _zhuanView.hidden = YES;
        _zheView.hidden = YES;
        _shenheBtn.hidden = YES;
        _guizeBtn.hidden = YES;
        _sureLable.hidden = NO;
        _lookBtn.hidden = NO;
        _addLoadingDetails.hidden = NO;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        [_oneBtn setTitle:@"提货方式" forState:UIControlStateNormal];
        [_twoBtn setTitle:@"物流车号" forState:UIControlStateNormal];
        [_threeBtn setTitle:@"司机姓名" forState:UIControlStateNormal];
        [_fourBtn setTitle:@"司机电话" forState:UIControlStateNormal];
        [_payNum setTitle:@"身份证号" forState:UIControlStateNormal];
        [_zhuanBtn setTitle:@"备注：" forState:UIControlStateNormal];
        _oneImg.hidden = YES;
        _twoImg.hidden = YES;
        _threeImg.hidden = YES;
        _fourImg.hidden = YES;
        _threeLable.hidden = YES;
        _threenameLable.hidden = NO;
        [_addLoadingDetails setTitle:@"添加装车明细" forState:UIControlStateNormal];
        
        if ([model.isPicker isEqualToString:@"1"]) {
            [_oneRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
            [_twoRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
            [_fourRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
            _threenameLable.text = @"未确认";
            [_fiveRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
            _addLoadingDetails.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
            _addLoadingDetails.userInteractionEnabled = NO;
            
        }else if([model.isPicker isEqualToString:@"0"])
        {
            _addLoadingDetails.userInteractionEnabled = YES;
            _addLoadingDetails.backgroundColor = MINE_Color;
            
        }
        
        
    }else if ([model.orderStatus isEqualToString:@"5"])
    {
        //卖家装货后待买家装货确认
    }else if ([model.orderStatus isEqualToString:@"6"])
    {
        
        //买家装货确认后买家待结算
        [_threeBtn setTitle:@"已支付定金" forState:UIControlStateNormal];
        _youhuiLable.text = @"需支付尾款";
        _youhuiTF.hidden = YES;
        _weiKuanLable.hidden = NO;
        _closeBtn.hidden = YES;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _sureLable.hidden = NO;
        _shenheBtn.hidden = YES;
        _lookBtn.hidden = NO;
        _addLoadingDetails.hidden = NO;
        [_addLoadingDetails setTitle:@"确认到款" forState:UIControlStateNormal];
        [_lookBtn setTitle:@"修改装货单" forState:UIControlStateNormal];

        [_addLoadingDetails setBackgroundColor:[UIColor colorWithHexString:@"D8D8D8"]];
        _addLoadingDetails.userInteractionEnabled = NO;
        
        NSMutableDictionary* dict = model.actualMoney[0];
        _threeLable.text = [NSString stringWithFormat:@"￥%@",dict[@"actualMoney"]];
        
        float priceNum = [model.totalPrice floatValue] - [dict[@"actualMoney"] floatValue];
        
        _weiKuanLable.text = [NSString stringWithFormat:@"￥%.2f",priceNum];
        
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            NSMutableArray* array = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* dicActual = array[0];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",dicActual[@"payAmount"]];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
            
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
        
    }else if ([model.orderStatus isEqualToString:@"7"])
    {
        //买家结算之后待卖家确认结算
        [_threeBtn setTitle:@"已支付定金" forState:UIControlStateNormal];
        _youhuiLable.text = @"需支付尾款";
        _youhuiTF.hidden = YES;
        _weiKuanLable.hidden = NO;
        _closeBtn.hidden = YES;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _sureLable.hidden = NO;
        _shenheBtn.hidden = YES;
        _lookBtn.hidden = NO;
        _addLoadingDetails.hidden = NO;
        [_addLoadingDetails setTitle:@"确认到款" forState:UIControlStateNormal];
        [_lookBtn setTitle:@"修改装货单" forState:UIControlStateNormal];
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            //需要在改改
            NSMutableDictionary* dict = model.actualMoney[0];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",dict[@"actualMoney"]];
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",@"0"];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
        //需要在改改
        NSMutableDictionary* dict = model.actualMoney[0];
        float priceNum = [model.totalPrice floatValue] - [dict[@"actualMoney"] floatValue];
        _weiKuanLable.text = [NSString stringWithFormat:@"￥%.2f",priceNum];
        
    }else if ([model.orderStatus isEqualToString:@"8"])
    {
        //卖家确认结算后卖家待发货
        _top.constant = 106.5;
        [_threeBtn setTitle:@"支付金额合计" forState:UIControlStateNormal];
        _youhuiLable.text = @"优惠金额";
        _youhuiTF.hidden = YES;
        _weiKuanLable.hidden = NO;
        _closeBtn.hidden = YES;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _sureLable.hidden = YES;
        _shenheBtn.hidden = NO;
        _lookBtn.hidden = YES;
        _addLoadingDetails.hidden = YES;
        _actualTF.hidden = YES;
        _trueLable.hidden = YES;
        _zheView.hidden = YES;
        [_shenheBtn setTitle:@"确认发货" forState:UIControlStateNormal];
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            //需要在改改

            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        


    }else if ([model.orderStatus isEqualToString:@"9"])
    {
        //卖家已发货卖家确认收货
        _top.constant = 106.5;
        [_threeBtn setTitle:@"支付金额合计" forState:UIControlStateNormal];
        _youhuiLable.text = @"优惠金额";
        _youhuiTF.hidden = YES;
        _weiKuanLable.hidden = NO;
        _closeBtn.hidden = YES;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _sureLable.hidden = YES;
        _shenheBtn.hidden = NO;
        _lookBtn.hidden = YES;
        _addLoadingDetails.hidden = YES;
        _actualTF.hidden = YES;
        _trueLable.hidden = YES;
        _zheView.hidden = YES;
        [_shenheBtn setTitle:@"待收货" forState:UIControlStateNormal];
        [_shenheBtn setBackgroundColor:[UIColor colorWithHexString:@"D8D8D8"]];
        _shenheBtn.userInteractionEnabled = NO;
        
        if ([model.payType isEqualToString:@"1"]) {
            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
            //需要在改改
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
            
        }else if ([model.payType isEqualToString:@"2"])
        {
            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }else
        {
            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
        }
        
        if ([model.invoiceType isEqualToString:@"0"]) {
            [_oneRightBtn setTitle:@"不含税" forState:UIControlStateNormal];
        }else
        {
            [_oneRightBtn setTitle:@"含税" forState:UIControlStateNormal];
        }
        
    }else if ([model.orderStatus isEqualToString:@"12"])
    {
        _top.constant = 0;
        _youhuiTF.hidden = YES;
        _youhuiLable.hidden = YES;
        _zhuanBtn.hidden = YES;
        _trueLable.hidden = YES;
        _actualTF.hidden = YES;
        _zhuanView.hidden = YES;
        _zheView.hidden = YES;
        _oneBtn.userInteractionEnabled = NO;
        _twoBtn.userInteractionEnabled = NO;
        _threeBtn.userInteractionEnabled = NO;
        _payNum.userInteractionEnabled = NO;
        _shneheOne.hidden = YES;
        _shenheTwo.hidden = YES;
        _shneheThree.hidden = YES;
        _sureLable.hidden = NO;
        _shouView.hidden = YES;
        [_shenheBtn setTitle:@"订单已关闭" forState:UIControlStateNormal];
        _shenheBtn.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
        _shenheBtn.userInteractionEnabled = NO;
        _closeBtn.hidden = YES;
    }
    
//    if (![_model.orderStatus isEqualToString:@"1"] && ![_model.orderStatus isEqualToString:@"6"]) {
//        if ([model.payType isEqualToString:@"1"]) {
//
//            [_twoRightBtn setTitle:@"定金加尾款" forState:UIControlStateNormal];
//            if (_model.actualMoney == nil) {
//                _threeLable.text = [NSString stringWithFormat:@"￥%@",@"200"];
//
//            }else
//            {
//                if ([_threeBtn.titleLabel.text isEqualToString:@"支付金额合计"]) {
//                       _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
//                }else
//                {
//                NSMutableArray* array = (NSMutableArray *)model.actualMoney;
//                NSMutableDictionary* dicActual = array[0];
//                _threeLable.text = [NSString stringWithFormat:@"￥%@",dicActual[@"payAmount"]];
//                }
//            }
//
//        }else if ([model.payType isEqualToString:@"2"])
//        {
//            [_twoRightBtn setTitle:@"先装车后全款" forState:UIControlStateNormal];
//            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
//
//        }else if ([model.payType isEqualToString:@"3"])
//        {
//            [_twoRightBtn setTitle:@"先全款后装车" forState:UIControlStateNormal];
//            _threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
//
//        }
//    }
    
}

-(void)setPickerDict:(NSMutableDictionary *)pickerDict
{
    //待装货状态获取买家取货信息
    _pickerDict = pickerDict;
    [_oneRightBtn setTitle:pickerDict[@"method"] forState:UIControlStateNormal];
    [_twoRightBtn setTitle:pickerDict[@"carNo"] forState:UIControlStateNormal];
    _threenameLable.text = pickerDict[@"carName"];

    [_fourRightBtn setTitle:pickerDict[@"mobile"] forState:UIControlStateNormal];
    [_fiveRightBtn setTitle:pickerDict[@"idCode"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)tiaoliAction:(UIButton *)sender {
    
}
- (IBAction)shenheAction:(UIButton *)sender {
    [_delegate shenheOrder:sender];
    
}
- (IBAction)closeAction:(id)sender {
    
    [_delegate closeAction:self];
}

- (IBAction)addLoadingAction:(UIButton *)sender {
    [_delegate addLoadingDetail:sender];
}

- (IBAction)lookAction:(UIButton *)sender {
    
    [_delegate lookAction:_model.orderStatus];
}
- (IBAction)oneAction:(UIButton *)sender {
    
    [_delegate oneBtnAction:sender];
}

- (IBAction)payNumAction:(UIButton *)sender {
    
    [_delegate payNumAction];
}



@end

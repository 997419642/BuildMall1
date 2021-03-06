//
//  OrderDetailTwoCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderDetailTwoCell.h"

@implementation OrderDetailTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

    _priceTF.text = @"14324258";
    
    _priceBtn.layer.cornerRadius = 3;
    _priceBtn.layer.masksToBounds = YES;
    _priceBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    _priceBtn.layer.borderWidth = 1;
    
}

- (IBAction)changeAction:(UIButton *)sender {
    
    
}

-(void)setDBModel:(OrderDBModel *)DBModel
{
    _DBModel = DBModel;
    
    if ([DBModel.categoryId isEqualToString:@"1"]) {
        //原木
        _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@",DBModel.shuzhong,DBModel.pinpai,DBModel.dengji,DBModel.kuandu,DBModel.changdu];
        _numLable.text = [NSString stringWithFormat:@"数量：%@%@",DBModel.unitNum,DBModel.goodsNuit];
        
    }else if([DBModel.categoryId isEqualToString:@"2"])
    {
        //板材
        _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@*%@",DBModel.shuzhong,DBModel.pinpai,DBModel.dengji,DBModel.houdu,DBModel.kuandu,DBModel.changdu];
        _numLable.text = [NSString stringWithFormat:@"数量：%@%@，%@支",DBModel.unitNum,DBModel.goodsNuit,DBModel.genshu];
    }
    _priceTF.text = DBModel.buyPrice;
    [_addNumBtn setTitle:DBModel.buyNumber forState:UIControlStateNormal];
    
    //stockNum 库存  lockNum锁定数量
    int keshouNum = [DBModel.stockNum intValue] - [DBModel.lockNum intValue];
    NSString* keshouStr = [NSString stringWithFormat:@"%d",keshouNum];
    _keshouLable.text = [NSString stringWithFormat:@"可售%@",keshouStr];
    if ([DBModel.isCus isEqualToString:@"YES"]) {
        _keshouLable.hidden = YES;
    }
    _adressLable.text = DBModel.cangku;
    
}

-(void)setManegeModel:(OrderManageModel *)manegeModel
{
    _manegeModel = manegeModel;
    
    if ([_manegeModel.orderStatus isEqualToString:@"0"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"1"])
    {
        _keshouLable.hidden = NO;
        _jiaBtn.hidden = NO;
        _jianBtn.hidden = NO;
        _deleteBtn.hidden = NO;
        _rightLable.hidden = YES;
        _addNumBtn.hidden = NO;
        _priceTF.hidden = NO;
        _priceBtn.hidden = NO;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"2"])
    {
        _keshouLable.hidden = NO;
        _jiaBtn.hidden = NO;
        _jianBtn.hidden = NO;
        _deleteBtn.hidden = NO;
        _rightLable.hidden = YES;
        _addNumBtn.hidden = NO;
        _priceTF.hidden = NO;
        _priceBtn.hidden = NO;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"3"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        

        
    }else if ([_manegeModel.orderStatus isEqualToString:@"4"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;

        
    }else if ([_manegeModel.orderStatus isEqualToString:@"5"])
    {
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"6"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"7"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
    }else if ([_manegeModel.orderStatus isEqualToString:@"8"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"9"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"12"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
        
    }else if ([_manegeModel.orderStatus isEqualToString:@"10"])
    {
        _keshouLable.hidden = YES;
        _jiaBtn.hidden = YES;
        _jianBtn.hidden = YES;
        _deleteBtn.hidden = YES;
        _rightLable.hidden = NO;
        _addNumBtn.hidden = YES;
        _priceTF.hidden = YES;
        _priceBtn.hidden = YES;
    }
}

-(void)setModel:(OrderDetailModel *)model
{
    _model = model;
    if (_model.packages != nil && ![_model.packages isEqualToString:@""]) {
         //如果数据是自定义添加的商品，赋值
        _keshouLable.hidden = YES;
        NSMutableDictionary* dict = [_model.packages mj_JSONObject];
        _rightLable.text = [NSString stringWithFormat:@"￥%@/%@",model.buyPrice,@"m³"];
        _priceTF.text = model.buyPrice;
        [_addNumBtn setTitle:model.buyNumber forState:UIControlStateNormal];

        if ([dict[@"categoryId"] isEqualToString:@"1"]) {
            //原木
            _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@",dict[@"shuzhong"],dict[@"pinpai"],dict[@"dengji"],dict[@"kuandu"],dict[@"changdu"]];
            
            NSMutableDictionary* dict = [model.packages mj_JSONObject];
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@",dict[@"lifangshu"],@"m³",model.buyNumber];
        }else if([dict[@"categoryId"] isEqualToString:@"2"])
        {
            //板材
            _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@*%@",dict[@"shuzhong"],dict[@"pinpai"],dict[@"dengji"],dict[@"houdu"],dict[@"kuandu"],dict[@"changdu"]];
            
            NSMutableDictionary* dict = [model.packages mj_JSONObject];
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@支",dict[@"lifangshu"],@"m³",dict[@"genshu"]];
        }
        
    }else
    {
        _rightLable.text = [NSString stringWithFormat:@"￥%@/%@",model.buyPrice,model.goodsNuit];
        
        NSMutableArray* productTableList = (NSMutableArray *)model.productTableList;
        NSMutableDictionary* tableDic = productTableList[0];
        NSMutableArray* productAttributeList = productTableList[0][@"productAttributeList"];
        
        NSMutableArray* lengthAttributesList = (NSMutableArray *)model.lengthAttributesList;
        
        NSMutableDictionary* modelDict = [NSMutableDictionary dictionary];
        
        for (NSMutableDictionary* dict in productAttributeList) {
            
            
            if ([dict[@"attrName"] isEqualToString:@"树种"]) {
                
                [modelDict setObject:dict[@"attrValue"] forKey:@"shuzhong"];
            }
            
            if ([dict[@"attrName"] isEqualToString:@"等级"]) {
                [modelDict setObject:dict[@"attrValue"] forKey:@"dengji"];
                
            }
            
            if ([dict[@"attrName"] isEqualToString:@"科系"]) {
                [modelDict setObject:dict[@"attrValue"] forKey:@"kexi"];
                
            }
            
            if ([dict[@"attrName"] isEqualToString:@"口径"] || [dict[@"attrName"] isEqualToString:@"宽度"]) {
                [modelDict setObject:dict[@"attrValue"] forKey:@"koujin"];
                
            }
            
            if ([dict[@"attrName"] isEqualToString:@"产地"]) {
                [modelDict setObject:dict[@"attrValue"] forKey:@"chandi"];
                
            }
            
            if ([dict[@"attrName"] isEqualToString:@"厚度"]) {
                [modelDict setObject:dict[@"attrValue"] forKey:@"houdu"];
            }
        }
        
        if ([model.categoryId isEqualToString:@"1"]) {
            //原木
            _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@",modelDict[@"shuzhong"],tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
            
            _numLable.text = [NSString stringWithFormat:@"数量：%@ %@*%@",model.unitNum,model.goodsNuit,model.buyNumber];
        }else if([model.categoryId isEqualToString:@"2"])
        {
            //板材
            _namelable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@*%@",modelDict[@"shuzhong"],tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
            
            NSMutableDictionary* dict = model.numAttributes[0];
            _numLable.text = [NSString stringWithFormat:@"数量：%@ %@*%@支",model.unitNum,model.goodsNuit,dict[@"specValue"]];
        }
        
        _priceTF.text = model.buyPrice;
        NSLog(@"==%@",model.buyPrice);
        [_addNumBtn setTitle:model.buyNumber forState:UIControlStateNormal];
        //stockNum 库存  lockNum锁定数量
        int keshouNum = [model.stockNum intValue] - [model.lockNum intValue];
        
        NSString* keshouStr = [NSString stringWithFormat:@"%d",keshouNum];
        _keshouLable.text = [NSString stringWithFormat:@"可售%@",keshouStr];
        
        NSMutableArray* arr = (NSMutableArray *)model.warestoreList;
        NSMutableDictionary* wareDict = arr[0];
        
         _adressLable.text = [NSString stringWithFormat:@"%@  地址:%@",wareDict[@"name"],wareDict[@"address"]];
    }
}

- (IBAction)deleteAction:(UIButton *)sender {
    
    [_delegate deleteAction:_DBModel.orderDetailId noticeId:_DBModel.noticeId];
}

@end

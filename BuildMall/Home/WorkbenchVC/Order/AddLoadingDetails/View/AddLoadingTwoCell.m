//
//  AddLoadingTwoCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingTwoCell.h"

@implementation AddLoadingTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

-(void)setHasTiStr:(NSString *)hasTiStr
{
    _hasTiStr = hasTiStr;
   
    _yitiLable.text = [NSString stringWithFormat:@"已提%@",_hasTiStr];
    
    if ([_hasTiStr intValue] >= [_detailModel.buyNumber intValue]) {
        self.userInteractionEnabled = NO;
    }
    
}

-(void)setDetailModel:(OrderDetailModel *)detailModel
{
    _detailModel = detailModel;

    //如果数据是自定义添加的商品，进行赋值
    if (detailModel.packages != nil && ![detailModel.packages isEqualToString:@""]) {
        
        NSMutableDictionary* dict = [detailModel.packages mj_JSONObject];
        _nameLable.text = dict[@"shuzhong"];
        _unitPriceLable.text = [NSString stringWithFormat:@"￥%@/%@",detailModel.buyPrice,@"m³"];


        if ([dict[@"categoryId"] isEqualToString:@"1"]) {
            //原木
            _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"kuandu"],dict[@"changdu"]];
            
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",dict[@"lifangshu"],@"m³",detailModel.buyNumber];
            
        }else if([dict[@"categoryId"] isEqualToString:@"2"])
        {
            //板材
            _spactilLable.text = [NSString stringWithFormat:@"%@,%@,%@*%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"houdu"],dict[@"kuandu"],dict[@"changdu"]];
            
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*(%@支)*%@件",dict[@"lifangshu"],@"m³",dict[@"genshu"],detailModel.buyNumber];
        }
    }else
    {
        NSMutableArray* productTableList = (NSMutableArray *)detailModel.productTableList;
        NSMutableDictionary* tableDic = productTableList[0];
        NSMutableArray* productAttributeList = productTableList[0][@"productAttributeList"];
        
        NSMutableArray* lengthAttributesList = (NSMutableArray *)detailModel.lengthAttributesList;
        
        
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
        
        _nameLable.text = modelDict[@"shuzhong"];
        
        if ([detailModel.categoryId isEqualToString:@"1"]) {
            //原木
            _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",detailModel.unitNum,detailModel.goodsNuit,detailModel.buyNumber];
        }else if([detailModel.categoryId isEqualToString:@"2"])
        {
            //板材
            _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
            
            //片数
            NSMutableDictionary* dict = _detailModel.numAttributes[0];
            
            _numLable.text = [NSString stringWithFormat:@"数量：%@%@*(%@支)*%@件",detailModel.unitNum,detailModel.goodsNuit,dict[@"specValue"],detailModel.buyNumber];
        }
        
        _unitPriceLable.text = [NSString stringWithFormat:@"￥%@/%@",detailModel.buyPrice,detailModel.goodsNuit];
        
  
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
  
}

@end

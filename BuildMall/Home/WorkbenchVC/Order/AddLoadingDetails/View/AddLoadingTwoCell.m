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

-(void)setDetailModel:(OrderDetailModel *)detailModel
{
    _detailModel = detailModel;
    
    
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
    
    if (!modelDict[@"houdu"]) {
        _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }else
    {
        _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }
    
    _unitPriceLable.text = [NSString stringWithFormat:@"￥%@/%@",detailModel.buyPrice,detailModel.goodsNuit];
    
    _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",detailModel.unitNum,detailModel.goodsNuit,detailModel.buyNumber];
    
    
    //如果数据是自定义添加的商品，进行赋值
    if (detailModel.packages != nil) {
        
        NSMutableDictionary* dict = [detailModel.packages mj_JSONObject];
        _nameLable.text = dict[@"species"];

        if (!dict[@"thickness"]) {
            _spactilLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",dict[@"brandName"],dict[@"grade"],dict[@"width"],dict[@"length"]];
        }else
        {
            _spactilLable.text = [NSString stringWithFormat:@"%@,%@,%@*%@*%@",dict[@"brandName"],dict[@"grade"],dict[@"thickness"],dict[@"width"],dict[@"length"]];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
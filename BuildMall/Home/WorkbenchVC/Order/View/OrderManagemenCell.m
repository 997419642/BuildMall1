//
//  OrderManagemenCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderManagemenCell.h"

@implementation OrderManagemenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

}


-(void)setModel:(OrderDetailModel *)model
{
    _model = model;
    
    _numLable.text = [NSString stringWithFormat:@"数量：%@件",model.buyNumber];
    
    if (model.packages != nil && ![model.packages isEqualToString:@""]) {
        _priceLable.text = [NSString stringWithFormat:@"￥%@/%@",model.buyPrice,@"m³"];
    }else{
   
        _priceLable.text = [NSString stringWithFormat:@"￥%@/%@",model.buyPrice,model.goodsNuit];
    }
    
    if (model.packages != nil && ![model.packages isEqualToString:@""]) {
        
        NSMutableDictionary* dict = [model.packages mj_JSONObject];
        _nameLable.text = dict[@"shuzhong"];

        if (!dict[@"houdu"]) {
            _volumeLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"kuandu"],dict[@"changdu"]];
        }else
        {
            _volumeLable.text = [NSString stringWithFormat:@"%@,%@,%@*%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"houdu"],dict[@"kuandu"],dict[@"changdu"]];
        }
    }else{
    
    
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
    
    _nameLable.text = modelDict[@"shuzhong"];
    
    if (!modelDict[@"houdu"]) {
        _volumeLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }else
    {
        _volumeLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

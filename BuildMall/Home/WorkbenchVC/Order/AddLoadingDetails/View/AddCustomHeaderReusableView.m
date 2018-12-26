//
//  AddCustomHeaderReusableView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddCustomHeaderReusableView.h"

@implementation AddCustomHeaderReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setModel:(OrderManageModel *)model
{
    _model = model;
}

-(void)setDetailmodel:(OrderDetailModel *)detailmodel
{
    _detailmodel = detailmodel;
    _nameLable.text = detailmodel.goodsName;
    
    NSMutableArray* productTableList = (NSMutableArray *)detailmodel.productTableList;
    NSMutableDictionary* tableDic = productTableList[0];
    NSMutableArray* productAttributeList = productTableList[0][@"productAttributeList"];
    
    NSMutableArray* lengthAttributesList = (NSMutableArray *)detailmodel.lengthAttributesList;
    
    
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
    

    _nameLable.text = tableDic[@"title"];
    _pinnameLable.text = modelDict[@"shuzhong"];
    
    if (!modelDict[@"houdu"]) {
        _spacelLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }else
    {
        _spacelLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    }
    
    _unitPriceLable.text = [NSString stringWithFormat:@"￥%@/%@",detailmodel.buyPrice,detailmodel.goodsNuit];
    
    _numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",detailmodel.unitNum,detailmodel.goodsNuit,detailmodel.buyNumber];
}


-(void)setDict:(NSMutableDictionary *)dict
{
    _dict = dict;
    _adressLable.text = [NSString stringWithFormat:@"%@  地址:%@",dict[@"name"],dict[@"address"]];
}

@end

//
//  AddOrderGoodsCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddOrderGoodsCell.h"
#import "GoodsTableModel.h"

@implementation AddOrderGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _parcksLable.hidden = YES;


}

-(void)setGenshuDict:(NSMutableDictionary *)genshuDict
{
    _genshuDict = genshuDict;
    
}

-(void)setDetailParkDict:(NSMutableDictionary *)detailParkDict
{
    _detailParkDict = detailParkDict;
    _parcksLable.text = detailParkDict[@"packetNumber"];
}

-(void)setParksModel:(GoodsBeansListModel *)parksModel
{
    _parksModel = parksModel;
    
    if (parksModel.categoryId == 2) {
        _parcksLable.hidden = NO;
        NSMutableDictionary* dict = parksModel.detailsBeanList[0];
        _parcksLable.text = dict[@"packetNumber"];
    }
    _priceLable.text = [NSString stringWithFormat:@"单价：￥%@",parksModel.unitPrice];

    if (parksModel.productTableList.count != 0) {
        
        GoodsTableModel* tableModel = parksModel.productTableList[0];
        
        NSInteger keshouNum = parksModel.stockNum - parksModel.lockNum;
        
        _numLable.text = [NSString stringWithFormat:@"数量：%ld件，%ld%@",(long)keshouNum,(long)parksModel.unitNum,parksModel.goodsNuit];
        
        NSMutableDictionary* modelDict = [NSMutableDictionary dictionary];
        
        NSMutableArray* array = (NSMutableArray *)tableModel.productAttributeList;
        
        for (NSMutableDictionary* dict in array) {
            
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
        
        if (!modelDict[@"houdu"]) {
            _nameLable.text = [NSString stringWithFormat:@"%@，%@，%@，%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"],modelDict[@"koujin"]];
        }else
        {
            _nameLable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"]];
        }
        
    }
}

-(void)setParksDict:(NSMutableDictionary *)parksDict
{
    _parksDict = parksDict;
    _lenthLable.text = [NSString stringWithFormat:@"*%@",parksDict[@"specValue"]];
}

- (void)setDict:(NSMutableDictionary *)dict
{
    _dict = dict;
    _lenthLable.text = [NSString stringWithFormat:@"*%@",dict[@"specValue"]];
    
}

- (void)setModel:(GoodsBeansListModel *)model
{
    _model = model;
    
    _priceLable.text = [NSString stringWithFormat:@"单价：￥%@",model.unitPrice];

    if (model.productTableList.count != 0) {

    GoodsTableModel* tableModel = model.productTableList[0];

    NSInteger keshouNum = model.stockNum - model.lockNum;

    _numLable.text = [NSString stringWithFormat:@"数量：%ld件，%ld%@",(long)keshouNum,(long)model.unitNum,model.goodsNuit];
    
    
    NSMutableDictionary* modelDict = [NSMutableDictionary dictionary];
    
    NSMutableArray* array = (NSMutableArray *)tableModel.productAttributeList;
    
    for (NSMutableDictionary* dict in array) {
        
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
    
    if (!modelDict[@"houdu"]) {
        _nameLable.text = [NSString stringWithFormat:@"%@，%@，%@，%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"],modelDict[@"koujin"]];
    }else
    {
        _nameLable.text = [NSString stringWithFormat:@"%@，%@，%@，%@*%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"]];
    }
        
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)ReducingAction:(UIButton *)sender {
    
}
- (IBAction)addAction:(UIButton *)sender {
    
}
- (IBAction)jianAction:(id)sender {
   
    
}
- (IBAction)jiaAction:(id)sender {


}

@end

//
//  AddLoadingFourCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingFourCell.h"

@implementation AddLoadingFourCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _priceLable.hidden = YES;
    
    _priceBtn.layer.cornerRadius = 3;
    _priceBtn.layer.masksToBounds = YES;
    _priceBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    _priceBtn.layer.borderWidth = 1;
    
}

-(void)setDict:(NSMutableDictionary *)dict
{
    _dict = dict;
    
    
    
    if ([dict[@"packages"] isEqual:[NSNull null]]) {

        //库存商品
        NSMutableArray* lengthList = dict[@"lengthList"];
        NSMutableDictionary* lengthDict = lengthList[0];
        
        NSMutableArray* numberList = dict[@"numberList"];
        
        NSMutableDictionary* numDict = numberList[0];
        
        
        NSMutableArray* productTableList = dict[@"productTableList"];
        
        NSMutableDictionary* productTableDict = productTableList[0];
        
        
        NSMutableArray* productAttributeList = productTableList[0][@"productAttributeList"];
        
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
        
        NSString* str = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
        _priceTF.text = str;
        _priceLable.text = [NSString stringWithFormat:@"￥%@/%@",str,dict[@"goodsNuit"]];
        
        _nameLable.text = modelDict[@"shuzhong"];
        
        if ([dict[@"categoryId"] intValue] == 1) {
            //原木
            _numLable.text = @"";
            [_volumeLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_nameLable);
                make.top.equalTo(_nameLable.mas_bottom).offset(10);
            }];
            
            _detailLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",productTableDict[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthDict[@"specValue"]];
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@*%@根",dict[@"unitNum"],dict[@"goodsNuit"],dict[@"buyNumber"]];
        }else
        {
            //板材
            _numLable.text = dict[@"packages"];
            _detailLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",productTableDict[@"brandName"],modelDict[@"dengji"],modelDict[@"houdu"],modelDict[@"koujin"],lengthDict[@"specValue"]];
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@(%@片)%@件",dict[@"unitNum"],dict[@"goodsNuit"],numDict[@"specValue"],dict[@"buyNumber"]];
        }
        
    }else
    {
        //自定义商品
        NSMutableDictionary* datadict = [dict[@"packages"] mj_JSONObject];
        _nameLable.text = datadict[@"shuzhong"];
        _priceTF.text = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
        _priceLable.text = [NSString stringWithFormat:@"￥%@/%@",dict[@"buyPrice"],@"m³"];

        if (!datadict[@"houdu"]) {
            //自定义原木
            _detailLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",datadict[@"pinpai"],datadict[@"dengji"],datadict[@"kuandu"],datadict[@"changdu"]];
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@*%@根",datadict[@"lifangshu"],@"m³",dict[@"buyNumber"]];
            
            _numLable.text = @"";
            [_volumeLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_nameLable);
                make.top.equalTo(_nameLable.mas_bottom).offset(10);
            }];
            
        }else
        {
            //自定义商品板材
            _detailLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@*%@",datadict[@"pinpai"],datadict[@"dengji"],datadict[@"houdu"],datadict[@"kuandu"],datadict[@"changdu"]];
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@*(%@片)*%@",datadict[@"lifangshu"],@"m³",datadict[@"piecesNum"],dict[@"buyNumber"]];
            _numLable.text = datadict[@"packetNum"];

        }
    
    }
}

- (IBAction)deleteAction:(UIButton *)sender {
    
    [_delegate deleteAction:_dict[@"id"]];
    
}


@end

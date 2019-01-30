//
//  AddOrderView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/7.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddOrderView.h"
#import "GoodsTableModel.h"


@implementation AddOrderView

-(void)awakeFromNib
{
    [super awakeFromNib];
    _priceBtn.layer.masksToBounds = YES;
    _priceBtn.layer.cornerRadius = 2;
    _priceBtn.layer.borderWidth = 1;
    _priceBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    _addBtn.layer.masksToBounds = YES;
    _addBtn.layer.cornerRadius = 5;
    _priceTF.delegate = self;
    

 
}

- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
        //     tapGestureRecognizer.cancelsTouchesInView = YES;
        //将触摸事件添加到当前view
        [_backgroupView addGestureRecognizer:tapGestureRecognizer];
        
    }
    return _backgroupView;
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y  - (screenH - 250.0)+100;//键盘高度216
    NSLog(@"%d============",offset);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示

    self.backgroupView.frame = CGRectMake(0.0f, offset, self.backgroupView.frame.size.width, self.backgroupView.frame.size.height);
    
    [UIView commitAnimations];
}


//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.backgroupView.frame =CGRectMake(0, 0, self.backgroupView.frame.size.width, self.backgroupView.frame.size.height);
}

-(void)keyboardHide
{
    [_priceTF resignFirstResponder];
}

//添加装货单库存商品
-(void)setParksModel:(GoodsBeansListModel *)parksModel
{
    _parksModel = parksModel;
    GoodsTableModel* tableModel = parksModel.productTableList[0];
    int keshouNum = parksModel.stockNum - parksModel.lockNum;
    _keshouLable.text = [NSString stringWithFormat:@"库存：%d 可售：%d",parksModel.stockNum,keshouNum];
    
    _priceTF.text = parksModel.unitPrice;
    
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
    
    _specifLable.text = [NSString stringWithFormat:@"%@，%@，%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"]];
    _unitLable.text = [NSString stringWithFormat:@"%ld%@",(long)parksModel.unitNum,parksModel.goodsNuit];
    if (!modelDict[@"houdu"]) {
        _houLable.text = [NSString stringWithFormat:@"%@",modelDict[@"koujin"]];
    }else
    {
        _houLable.text = [NSString stringWithFormat:@"%@*%@",modelDict[@"houdu"],modelDict[@"koujin"]];
    }
}

-(void)setParksDict:(NSMutableDictionary *)parksDict
{
    _parksDict = parksDict;
    _lenthLable.text = [NSString stringWithFormat:@"*%@",parksDict[@"specValue"]];

}

-(void)setGenshuDict:(NSMutableDictionary *)genshuDict
{
    _genshuDict = genshuDict;
    
}

- (void)setDict:(NSMutableDictionary *)dict
{
    _dict = dict;
    _lenthLable.text = [NSString stringWithFormat:@"*%@",dict[@"specValue"]];
}

//添加库存商品
-(void)setBeanModel:(GoodsBeansListModel *)beanModel
{
    _beanModel = beanModel;
    GoodsTableModel* tableModel = beanModel.productTableList[0];
    
    NSMutableDictionary* goodsListDic = beanModel.goodsList[0];
    
    int keshouNum = [goodsListDic[@"stockNum"] intValue] - [goodsListDic[@"lockNum"] intValue];
    _keshouLable.text = [NSString stringWithFormat:@"库存：%d 可售件数：%d",[goodsListDic[@"stockNum"] intValue],keshouNum];
    
    
    _priceTF.text = beanModel.unitPrice;
    
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
    
    _specifLable.text = [NSString stringWithFormat:@"%@，%@，%@",modelDict[@"shuzhong"],tableModel.brandName,modelDict[@"dengji"]];
    _unitLable.text = [NSString stringWithFormat:@"%ld%@",(long)beanModel.unitNum,beanModel.goodsNuit];
    if (!modelDict[@"houdu"]) {
        _houLable.text = [NSString stringWithFormat:@"%@",modelDict[@"koujin"]];
    }else
    {
        _houLable.text = [NSString stringWithFormat:@"%@*%@",modelDict[@"houdu"],modelDict[@"koujin"]];
    }
    
}

-(void)setDBmodel:(OrderDBModel *)DBmodel
{
    _DBmodel = DBmodel;
    _specifLable.text = [NSString stringWithFormat:@"%@ %@ %@",DBmodel.shuzhong,DBmodel.pinpai,DBmodel.dengji];
    if (!DBmodel.houdu) {
        //原木
        _houLable.text = [NSString stringWithFormat:@"%@",DBmodel.kuandu];

    }else
    {
        _houLable.text = [NSString stringWithFormat:@"%@*%@",DBmodel.houdu,DBmodel.kuandu];

    }
    
    _lenthLable.text = [NSString stringWithFormat:@"*%@",DBmodel.changdu];
    int num = [DBmodel.stockNum intValue] - [DBmodel.lockNum intValue];
    _keshouLable.text = [NSString stringWithFormat:@"库存：%@  可售：%d",DBmodel.stockNum,num];
    if ([DBmodel.isCus isEqualToString:@"YES"]) {
        _keshouLable.hidden = YES;
    }
    _priceTF.text = DBmodel.buyPrice;
    [_numBtn setTitle:DBmodel.buyNumber forState:UIControlStateNormal];
}

//修改数量和价格
- (void)setDetailModel:(OrderDetailModel *)detailModel
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

    _specifLable.text = [NSString stringWithFormat:@"%@，%@，%@，",tableDic[@"brandName"],modelDict[@"shuzhong"],modelDict[@"dengji"]];
    [_numBtn setTitle:_detailModel.buyNumber forState:UIControlStateNormal];
    
    //stockNum 库存  lockNum锁定数量
    
    int keshouNum = [detailModel.stockNum intValue] - [detailModel.lockNum intValue];
    
    NSString* keshouStr = [NSString stringWithFormat:@"%d",keshouNum];
    
    _keshouLable.text = [NSString stringWithFormat:@"库存：%@  可售：%@",detailModel.stockNum,keshouStr];
    
    _priceTF.text = detailModel.buyPrice;
    
    _lenthLable.text = lengthAttributesList[0][@"specValue"];
    _unitLable.text = [NSString stringWithFormat:@"%@%@",detailModel.unitNum,detailModel.goodsNuit];
    
    if (!modelDict[@"houdu"]) {
        _houLable.text = [NSString stringWithFormat:@"%@",modelDict[@"koujin"]];

    }else
    {
         _houLable.text = [NSString stringWithFormat:@"%@*%@",modelDict[@"houdu"],modelDict[@"koujin"]];
    }
    
    if (detailModel.packages != nil && ![detailModel.packages isEqualToString:@""]) {

        //自定义商品
        NSMutableDictionary* dict = [detailModel.packages mj_JSONObject];
        if (!dict[@"houdu"]) {
            _houLable.text = [NSString stringWithFormat:@"%@",dict[@"kuandu"]];
        }else
        {
            _houLable.text = [NSString stringWithFormat:@"     %@*%@",dict[@"houdu"],dict[@"kuandu"]];
        }
        _specifLable.text = [NSString stringWithFormat:@"%@，%@，%@，",dict[@"shuzhong"],dict[@"pinpai"],dict[@"dengji"]];
        _lenthLable.text = [NSString stringWithFormat:@"*%@",dict[@"changdu"]];
        _unitLable.text = [NSString stringWithFormat:@"%@%@",dict[@"lifangshu"],@"m³"];
        _keshouLable.hidden = YES;
    }
}

+ (instancetype)addSureView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AddOrderView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(0, screenH, screenW, 300);
    if (_isDetail == YES) {
        
        [_addBtn setTitle:@"确定修改" forState:UIControlStateNormal];
    }
    [self showAnimation];
    
}

- (void)showAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH-300;
        self.frame = frame;
    }];
}

- (void)hideAnimation{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH;
        self.frame = frame;
    } completion:^(BOOL finished) {
        
        [self.backgroupView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
}
-(void)setDetailParkDict:(NSMutableDictionary *)detailParkDict
{
    _detailParkDict = detailParkDict;
    
}


- (IBAction)addAction:(UIButton *)sender {
    
    [_priceTF resignFirstResponder];
    
    if ([sender.titleLabel.text isEqualToString:@"添加商品"]) {
        
        if (_isZhuanghuo == YES) {
            
            //添加装货商品
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            [dict setObject:@(_parksModel.orderId) forKey:@"goodsId"];
            [dict setObject:_numBtn.titleLabel.text forKey:@"buyNumber"];
            [dict setObject:_priceTF.text forKey:@"buyPrice"];
            if (_parksModel.categoryId  == 2) {
                [dict setObject:_detailParkDict[@"packetNumber"] forKey:@"packages"];
                [dict setObject:_detailParkDict[@"id"] forKey:@"parkId"];
            }
            
            [_delegate sureAction:dict];
            
        }else{
        
            //添加商品
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            GoodsTableModel* tableModel = _beanModel.productTableList[0];
            [dict setObject:@(_beanModel.unitNum) forKey:@"cubicNumber"];
            [dict setObject:@(_beanModel.orderId) forKey:@"goodsId"];
            [dict setObject:tableModel.title forKey:@"goodsName"];
            [dict setObject:@"1" forKey:@"status"];
            [dict setObject:_numBtn.titleLabel.text forKey:@"buyNumber"];
            [dict setObject:_priceTF.text forKey:@"buyPrice"];
            NSMutableDictionary* wareDic = _beanModel.warestoreTableList[0];
            [dict setObject:[NSString stringWithFormat:@"%@ %@",wareDic[@"address"],wareDic[@"name"]] forKey:@"cangku"];
            
            NSMutableDictionary* modelDict = [NSMutableDictionary dictionary];
            NSMutableArray* array = (NSMutableArray *)tableModel.productAttributeList;
            
            for (NSMutableDictionary* dict in array) {
                
                if ([dict[@"attrName"] isEqualToString:@"树种"]) {
                    [modelDict setObject:dict[@"attrValue"] forKey:@"shuzhong"];
                }
                
                if ([dict[@"attrName"] isEqualToString:@"等级"]) {
                    [modelDict setObject:dict[@"attrValue"] forKey:@"dengji"];
                    
                }
                
                if ([dict[@"attrName"] isEqualToString:@"口径"] || [dict[@"attrName"] isEqualToString:@"宽度"]) {
                    [modelDict setObject:dict[@"attrValue"] forKey:@"koujin"];
                    
                }
                
                if ([dict[@"attrName"] isEqualToString:@"厚度"]) {
                    [modelDict setObject:dict[@"attrValue"] forKey:@"houdu"];
                    
                }
            }
            [dict setObject:modelDict[@"shuzhong"] forKey:@"shuzhong"];
            [dict setObject:tableModel.brandName forKey:@"pinpai"];
            [dict setObject:modelDict[@"dengji"] forKey:@"dengji"];
            [dict setObject:modelDict[@"koujin"] forKey:@"kuandu"];
            if(!modelDict[@"houdu"])
            {
                [dict setObject:@"" forKey:@"houdu"];

            }else
            {
                [dict setObject:modelDict[@"houdu"] forKey:@"houdu"];

            }
            [dict setObject:_dict[@"specValue"] forKey:@"changdu"];
            
            NSMutableDictionary* goodsListDic = _beanModel.goodsList[0];
            [dict setObject:[NSString stringWithFormat:@"%d",[goodsListDic[@"lockNum"] intValue]] forKey:@"lockNum"];
            [dict setObject:[NSString stringWithFormat:@"%d",[goodsListDic[@"stockNum"] intValue]] forKey:@"stockNum"];
            [dict setObject:_beanModel.goodsNuit forKey:@"goodsNuit"];
            if(_genshuDict != nil)
            {
                [dict setObject:_genshuDict[@"specValue"] forKey:@"genshu"];
            }else
            {
                [dict setObject:@"" forKey:@"genshu"];
            }
            
//            NSDate *date =[NSDate date];//简书 FlyElephant
//            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//            [formatter setDateFormat:@"yyyy"];
//            NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
//            [formatter setDateFormat:@"MM"];
//            NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
//            [formatter setDateFormat:@"dd"];
//            NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
//            NSLog(@"currentDate = %@ ,year = %ld ,month=%ld, day=%ld",date,currentYear,currentMonth,currentDay);
//            NSString* dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)currentYear,(long)currentMonth,(long)currentDay];
//            [dict setObject:dateStr forKey:@"createTime"];
            [_delegate sureAction:dict];
        
        }

    }else{
        
    //修改价格

//    int keshouNum = [_detailModel.stockNum intValue] - [_detailModel.lockNum intValue];
//    NSString* keshouStr = [NSString stringWithFormat:@"%d",keshouNum];

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
//    [dict setObject:_detailModel.orderDetailId forKey:@"orderDetailId"];
    [dict setObject:_numBtn.titleLabel.text forKey:@"buyNumber"];
    [dict setObject:_priceTF.text forKey:@"buyPrice"];
    [dict setObject:_DBmodel.noticeId forKey:@"noticeId"];
//    [dict setObject:keshouStr forKey:@"lockNum"];
        
//    if (!_detailModel.goodsId) {
//        //自定义商品
//        NSMutableDictionary* dictdata = [_detailModel.packages mj_JSONObject];
//        NSString* cubicNum = [NSString stringWithFormat:@"%@",dictdata[@"lifangshu"]];
//        [dict setObject:cubicNum forKey:@"cubicNumber"];
//        [dict setObject:@"0" forKey:@"goodsId"];
//    }else
//    {
//
//        [dict setObject:_detailModel.goodsId forKey:@"goodsId"];
//
//        [dict setObject:_detailModel.unitNum forKey:@"cubicNumber"];
//    }
    
    
        [_delegate sureAction:dict];
        
    }
}


- (IBAction)jiaAction:(UIButton *)sender {
    

    [_priceTF resignFirstResponder];
    int num = [_numBtn.titleLabel.text intValue];
    [_numBtn setTitle:[NSString stringWithFormat:@"%d",num+1] forState:UIControlStateNormal];
}


- (IBAction)jianAction:(UIButton *)sender {
    
    [_priceTF resignFirstResponder];

    int num = [_numBtn.titleLabel.text intValue];
    
    if (num == 1) {
        return;
    }
    
    [_numBtn setTitle:[NSString stringWithFormat:@"%d",num-1] forState:UIControlStateNormal];
}

- (IBAction)cancelAction:(id)sender {
    
    [self hideAnimation];

}


@end

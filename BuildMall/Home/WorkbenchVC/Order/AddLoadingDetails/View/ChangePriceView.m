//
//  ChangePriceView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/19.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "ChangePriceView.h"

@implementation ChangePriceView

-(void)awakeFromNib
{
    [super awakeFromNib];
    _priceBtn.layer.masksToBounds = YES;
    _priceBtn.layer.cornerRadius = 2;
    _priceBtn.layer.borderWidth = 1;
    _priceBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    _chageBtn.layer.masksToBounds = YES;
    _chageBtn.layer.cornerRadius = 5;
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

+ (instancetype)addChangePriceView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ChangePriceView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(0, screenH, screenW, 260);
    [self showAnimation];
    
}

- (void)showAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH-260;
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
        _nameLable.text = modelDict[@"shuzhong"];

        if ([dict[@"categoryId"] intValue] == 1) {
             //原木
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@*%@根",dict[@"unitNum"],dict[@"goodsNuit"],dict[@"buyNumber"]];
            _numLable.text = @"";
            [_volumeLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_nameLable);
                make.top.equalTo(_nameLable.mas_bottom).offset(10);
            }];
            
            _detailLable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",productTableDict[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthDict[@"specValue"]];
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
            _volumeLable.text = [NSString stringWithFormat:@"数量：%@%@*(%@片)",datadict[@"lifangshu"],@"m³",dict[@"buyNumber"]];
            _numLable.text = datadict[@"packetNum"];

        }
    }
}
- (IBAction)cancelAction:(id)sender {
    [self hideAnimation];

}

- (IBAction)changeAction:(id)sender {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    if ([_dict[@"packages"] isEqual:[NSNull null]]) {
        //库存商品
        [dict setObject:_dict[@"id"] forKey:@"orderPackId"];
        [dict setObject:_priceTF.text forKey:@"buyPrice"];
        [dict setObject:_dict[@"unitNum"] forKey:@"unitNum"];
        if ([dict[@"categoryId"] intValue] == 1) {
            [dict setObject:_dict[@"buyNumber"] forKey:@"buyNumber"];
        }else
        {
            [dict setObject:@"1" forKey:@"buyNumber"];
        }
        [_delegate sureChangeAction:dict];

        
    }else
    {
        //自定义商品
        NSMutableDictionary* datadict = [_dict[@"packages"] mj_JSONObject];
        [dict setObject:_dict[@"id"] forKey:@"orderPackId"];
        [dict setObject:_priceTF.text forKey:@"buyPrice"];
        [dict setObject:datadict[@"lifangshu"] forKey:@"unitNum"];
        if (!datadict[@"houdu"]) {
            [dict setObject:_dict[@"buyNumber"] forKey:@"buyNumber"];

        }else
        {
            [dict setObject:@"1" forKey:@"buyNumber"];

        }
        [_delegate sureChangeAction:dict];

    }
}

@end

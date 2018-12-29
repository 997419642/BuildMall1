//
//  AddCustomPlankVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/18.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddCustomPlankVC.h"
#import "SWGOrderPackControllerApi.h"
#import "SWGOrderPack.h"
#import "SWGOrderAbroadPackBean.h"

@interface AddCustomPlankVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UITextField *priceTF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *shuzhongLable;
@property (weak, nonatomic) IBOutlet UILabel *brandlable;
@property (weak, nonatomic) IBOutlet UILabel *numbleLable;
@property (weak, nonatomic) IBOutlet UILabel *pricelable;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;

@property(nonatomic) NSArray<SWGOrderAbroadPackBean>* packBeanArray;


@end

@implementation AddCustomPlankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"添加装货明细";
    _addBtn.layer.masksToBounds = YES;
    _addBtn.layer.cornerRadius = 3;
    _addBtn.layer.borderColor = MINE_Color.CGColor;
    _addBtn.layer.borderWidth = 1;
    
    _priceBtn.layer.masksToBounds = YES;
    _priceBtn.layer.cornerRadius = 3;
    _priceBtn.layer.borderColor = MINE_Color.CGColor;
    _priceBtn.layer.borderWidth = 1;
    
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 3;
    
    _nameLable.text = _detailModel.goodsName;
    _priceTF.returnKeyType = UIReturnKeyDone;
    _priceTF.delegate = self;

    
    NSMutableArray* productTableList = (NSMutableArray *)_detailModel.productTableList;
    NSMutableDictionary* tableDic = productTableList[0];
    NSMutableArray* productAttributeList = productTableList[0][@"productAttributeList"];
    
    NSMutableArray* lengthAttributesList = (NSMutableArray *)_detailModel.lengthAttributesList;
    
    
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
    
    
    if ([_categoryId isEqualToString:@"1"]) {
        _nameLable.text = @"原木";
    }else
    {
        _nameLable.text = @"实木板材";
        
    }
    _shuzhongLable.text = modelDict[@"shuzhong"];
    
    _brandlable.text = [NSString stringWithFormat:@"%@， %@， %@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
    
    
    _pricelable.text = [NSString stringWithFormat:@"￥%@/%@",_detailModel.buyPrice,_detailModel.goodsNuit];
    
    _numbleLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",_detailModel.unitNum,_detailModel.goodsNuit,_detailModel.buyNumber];
    
    
    NSMutableArray* arr = (NSMutableArray *)_detailModel.warestoreList;
    NSMutableDictionary* dict = arr[0];
    _adressLable.text = [NSString stringWithFormat:@"%@  地址:%@",dict[@"name"],dict[@"address"]];
    
    //如果数据是自定义添加的商品，进行赋值
    if (_detailModel.packages != nil) {
        
        NSMutableDictionary* dict = [_detailModel.packages mj_JSONObject];
        _pricelable.text = [NSString stringWithFormat:@"￥%@/%@",_detailModel.buyPrice,@"m³"];
        _numbleLable.text = [NSString stringWithFormat:@"数量：%@%@*%@件",dict[@"lifangshu"],@"m³",_detailModel.buyNumber];
        

        if ([_categoryId isEqualToString:@"1"]) {
            _nameLable.text = @"原木";
        }else
        {
            _nameLable.text = @"实木板材";

        }
        _shuzhongLable.text = dict[@"shuzhong"];
        
        _brandlable.text = [NSString stringWithFormat:@"%@， %@， %@*%@",tableDic[@"brandName"],modelDict[@"dengji"],modelDict[@"koujin"],lengthAttributesList[0][@"specValue"]];
        
        if (!dict[@"houdu"]) {
            _brandlable.text = [NSString stringWithFormat:@"%@，%@，%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"kuandu"],dict[@"changdu"]];
        }else
        {
            _brandlable.text = [NSString stringWithFormat:@"%@,%@,%@*%@*%@",dict[@"pinpai"],dict[@"dengji"],dict[@"houdu"],dict[@"kuandu"],dict[@"changdu"]];
        }
        
        _adressLable.text = [NSString stringWithFormat:@"%@",dict[@"cangku"]];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"点击了搜索");
    [_priceTF resignFirstResponder];
    return YES;
}

- (IBAction)addAction:(id)sender {
    
    
}

- (IBAction)sureAction:(UIButton *)sender {
    if ([_priceTF.text isEqualToString:@""]) {
        [self showAlert:@"请输入根数"];
        return;
    }
    
    NSMutableArray* array = [NSMutableArray array];
    if (_detailModel.packages) {
        
        NSMutableDictionary* dictCus = [_detailModel.packages mj_JSONObject];
        SWGOrderAbroadPackBean* bean = [SWGOrderAbroadPackBean new];
        bean.buyPrice = _detailModel.buyPrice;
        NSNumber *goodsId = [NSNumber numberWithInt:[_detailModel.goodsId intValue]];
        bean.goodsId = goodsId;
        NSNumber *orderId = [NSNumber numberWithInt:[_model.orderId intValue]];
        bean.orderId = orderId;
        NSNumber *buyNumber = [NSNumber numberWithInt:[_priceTF.text intValue]];
        bean.buyNumber = buyNumber;
        NSNumber *categoryId = [NSNumber numberWithInt:[_categoryId intValue]];
        bean.categoryId = categoryId;
        bean.orderDetailId = [NSNumber numberWithInt:[_detailModel.orderDetailId intValue]];
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];

        [dict addEntriesFromDictionary:dictCus];
        bean.packages = [dict mj_JSONString];
        [array addObject:bean];
    }else
    {
    
    
        SWGOrderAbroadPackBean* bean = [SWGOrderAbroadPackBean new];
   
        bean.buyPrice = _detailModel.buyPrice;
    
        NSNumber *goodsId = [NSNumber numberWithInt:[_detailModel.goodsId intValue]];
    
        bean.goodsId = goodsId;
    
        NSNumber *orderId = [NSNumber numberWithInt:[_model.orderId intValue]];
    
        bean.orderId = orderId;
    
        NSNumber *buyNumber = [NSNumber numberWithInt:[_priceTF.text intValue]];
    
        bean.buyNumber = buyNumber;
    
        NSNumber *categoryId = [NSNumber numberWithInt:[_detailModel.categoryId intValue]];
    
        bean.categoryId = categoryId;
    
        bean.orderDetailId = [NSNumber numberWithInt:[_detailModel.orderDetailId intValue]];
    
        [array addObject:bean];
   
    }
    

    _packBeanArray = array;
    
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    __weak typeof(self)weakSelf = self;
    
    [apiInstance orderAbroadPackUsingPOSTWithAuthorization:@"Q" bean:_packBeanArray completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (!error) {
            if ([output.code intValue] == 0) {
                [weakSelf showAlert:@"添加成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}


@end

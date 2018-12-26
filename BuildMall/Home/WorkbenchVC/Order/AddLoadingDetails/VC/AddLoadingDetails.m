//
//  AddLoadingDetails.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingDetails.h"
#import "AddLoadingOneCell.h"
#import "AddLoadingTwoCell.h"
#import "AddLoadingThreeCell.h"
#import "AddLoadingFourCell.h"
#import "AddLoadingFiveCell.h"
#import "AddCustomVC.h"
#import "InvoiceInfoVC.h"
#import "LoadingListVC.h"
#import "AddOrderGoodsVC.h"
#import "AddCustomGoodsVC.h"
#import "OrderManageModel.h"
#import "OrderDetailModel.h"
#import "SWGOrderPackControllerApi.h"
#import "AddCustomPlankVC.h"
#import "ChangePriceView.h"


@interface AddLoadingDetails ()<UITableViewDelegate,UITableViewDataSource,AddLoadingFiveCellDelegate,AddLoadingFourCellDelegate,ChangePriceViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)NSMutableArray* deliveryOrderArray;

@property(nonatomic,strong)AddLoadingFiveCell *fiveCell;

@property(nonatomic,strong)ChangePriceView *addView;

@property(nonatomic,assign)CGFloat allPrice;
@property(nonatomic,assign)int allNum;
@property(nonatomic,assign)CGFloat allUnit;

@end

@implementation AddLoadingDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataArray = [NSMutableArray array];
    
    _deliveryOrderArray = [NSMutableArray array];
    
    self.navigationItem.title = @"添加装货明细";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];

    _tableView.delegate = self;
    _tableView.dataSource = self;

    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingOneCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingOneCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingTwoCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingTwoCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingThreeCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingThreeCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingFourCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingFourCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingFiveCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingFiveCell"];
    
    [self refreshingOneSection];
    [self refreshing];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self refreshing];
    
    [self refreshingOneSection];
}

//请求第一个表的数据
-(void)refreshingOneSection
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:_orderId forKey:@"orderId"];
    
    __weak typeof(self)weakSelf = self;
    [_dataArray removeAllObjects];
    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (!error) {
            if (result.code == 0) {
                
                weakSelf.dataArray = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                OrderManageModel* model0 = weakSelf.dataArray[0];
                for (OrderDetailModel* model in model0.orderDetailList) {
                    //如果数据是自定义添加的商品，添加没有返回数据的字段
                    if (model.packages) {
                        NSMutableDictionary* dict = [model.packages mj_JSONObject];
                        model.unitNum = [NSString stringWithFormat:@"%@",dict[@"cubicNum"]];
                    }
                    
                    if ([model0.orderStatus isEqualToString:@"5"]) {
                        weakSelf.fiveCell.submitBtn.userInteractionEnabled  =NO;
                        [weakSelf.fiveCell.submitBtn setBackgroundColor:[UIColor colorWithHexString:@"D8D8D8"]];
                        weakSelf.fiveCell.addCustomBtn.userInteractionEnabled  =NO;
                        weakSelf.fiveCell.addGoodsBtn.userInteractionEnabled  =NO;

                    }
                }
                
                [weakSelf.tableView reloadData];
                
            }else
            {
                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"错误原因:%@",str);
            }
        }else
        {
            
        }
    }];
}

//请求第二个表的数据
-(void)refreshing
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:_orderIdTrue forKey:@"orderId"];
    __weak typeof(self)weakSelf = self;
    [self.deliveryOrderArray removeAllObjects];
    [[WebClient sharedClient]orderPackList:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (!error) {
            if (result.code == 0) {
                NSMutableArray* array = result.data;
                weakSelf.deliveryOrderArray = [NSMutableArray arrayWithArray:array];
                
                //计算总价，总数量和总立方数
                float numPrice;
                float numshuliang;
                float numunitNum;

                NSMutableArray* priceArray = [NSMutableArray array];
                NSMutableArray* numArray = [NSMutableArray array];
                NSMutableArray* lifangshuArray = [NSMutableArray array];

                for (NSMutableDictionary* dict in weakSelf.deliveryOrderArray) {
                     if ([dict[@"packages"] isEqual:[NSNull null]]) {

                        //库存商品
                         if ([dict[@"categoryId"] intValue] == 1) {
                             //原木
                             NSString* number = [NSString stringWithFormat:@"%@",dict[@"buyNumber"]];
                             NSString* price = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
                             numPrice = [number floatValue]*[price floatValue]*[dict[@"unitNum"] floatValue];
                             numshuliang = [number floatValue];
                             numunitNum = [dict[@"unitNum"] floatValue];
                         }else
                         {
                             //板材
                             NSString* price = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
                             numPrice = [price floatValue]*[dict[@"unitNum"] floatValue];
                             numshuliang = [@"1" floatValue];
                             numunitNum = [dict[@"unitNum"] floatValue];
                         }
                     }else
                     {
                         //自定义商品dict
                         NSMutableDictionary* dataDict = [dict[@"packages"] mj_JSONObject];

                         if (!dataDict[@"houdu"]) {
                              //原木
                           NSString* number = [NSString stringWithFormat:@"%@",dict[@"buyNumber"]];
                            NSString* price = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
                            numPrice = [number floatValue]*[price floatValue]*[dataDict[@"lifangshu"] floatValue];
                            numshuliang = [number floatValue];
                            numunitNum = [dataDict[@"lifangshu"] floatValue];
                             
                         }else
                         {
                              //板材
                             NSString* price = [NSString stringWithFormat:@"%@",dict[@"buyPrice"]];
                             numPrice = [price floatValue]*[dataDict[@"lifangshu"] floatValue];
                             
                             numshuliang = [@"1" floatValue];
                             numunitNum = [dataDict[@"lifangshu"] floatValue];
                             
                         }
        
                     }
                    
                    [priceArray addObject:[NSString stringWithFormat:@"%f",numPrice]];
                    [numArray addObject:[NSString stringWithFormat:@"%f",numshuliang]];
                    [lifangshuArray addObject:[NSString stringWithFormat:@"%f",numunitNum]];
                    
                }
                CGFloat allPrice = [[priceArray valueForKeyPath:@"@sum.floatValue"] floatValue];
                weakSelf.allPrice = allPrice;
                
                int allNum = [[numArray valueForKeyPath:@"@sum.intValue"] intValue];
                weakSelf.allNum = allNum;
                CGFloat allUnit = [[lifangshuArray valueForKeyPath:@"@sum.floatValue"] floatValue];
                weakSelf.allUnit = allUnit;
                
                [weakSelf.tableView reloadData];
            }
        }else
        {
            
        }
    }];
}

//修改价格
-(void)sureChangeAction:(NSMutableDictionary *)dict
{
    NSMutableDictionary* requestDict = [NSMutableDictionary dictionary];
    [requestDict setObject:_orderIdTrue forKey:@"orderId"];
    //计算总价
    NSMutableArray* priceArray = [NSMutableArray array];

    CGFloat num;
    for (NSMutableDictionary* dataDict in self.deliveryOrderArray) {

        if ([dataDict[@"packages"] isEqual:[NSNull null]]) {
            //库存商品

            NSString* number = [NSString stringWithFormat:@"%@",dataDict[@"buyNumber"]];
            NSString* price = [NSString stringWithFormat:@"%@",dataDict[@"buyPrice"]];
            num = [number floatValue]*[price floatValue]*[dataDict[@"unitNum"] floatValue];
        }else
        {
            //自定义商品
            NSMutableDictionary* cusDict = [dataDict[@"packages"] mj_JSONObject];
            NSString* number;
            if (!cusDict[@"houdu"]) {
                number = [NSString stringWithFormat:@"%@",dataDict[@"buyNumber"]];
            }else
            {
                number = @"1";

            }
            
            NSString* price = [NSString stringWithFormat:@"%@",dataDict[@"buyPrice"]];
            num = [number floatValue]*[price floatValue]*[cusDict[@"lifangshu"] floatValue];
        }

        if (dict[@"orderPackId"] == dataDict[@"id"]) {
            
        }else
        {
            //没有修改的详单放进数组
            [priceArray addObject:[NSString stringWithFormat:@"%f",num]];
        }
    }
    //没有修改的详单总价
    CGFloat sum = [[priceArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    //当前修改的详单
    CGFloat nowNum = [dict[@"buyNumber"] floatValue]*[dict[@"buyPrice"] floatValue]*[dict[@"unitNum"] floatValue];
    CGFloat allPrice = sum+nowNum;
    NSString* allStr = [NSString stringWithFormat:@"%.2f",allPrice];
    [requestDict setObject:allStr forKey:@"totalPrice"];
    [requestDict setObject:dict[@"orderPackId"] forKey:@"orderPackId"];
    [requestDict setObject:dict[@"buyPrice"] forKey:@"buyPrice"];
    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient] orderPackUpdateMoney:requestDict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                [weakSelf showAlert:@"修改成功"];
                [weakSelf.addView removeFromSuperview];
                [weakSelf.addView.backgroupView removeFromSuperview];
                [weakSelf refreshing];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

//添加自定义
//暂时
-(void)addCustomAction:(UITableViewCell *)cell
{
    AddCustomGoodsVC* VC = [AddCustomGoodsVC new];
    VC.categoryId = _categoryId;
    VC.isZhuanghuo = YES;
    VC.orderId = _orderIdTrue;
    [self.navigationController pushViewController:VC animated:YES];
}
//添加商品
-(void)addGoodsAction:(UITableViewCell *)cell
{
    AddOrderGoodsVC* VC = [AddOrderGoodsVC new];
    VC.categoryId = _categoryId;
    VC.orderId = _orderIdTrue;
    VC.isZhuanghuo = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

//提交明细
-(void)subMitAction:(UITableViewCell *)cell
{
    
    if (_deliveryOrderArray.count == 0) {
        [self showAlert:@"请添加出货单明细"];
        return;
    }
    LoadingListVC* VC = [LoadingListVC new];
    VC.deliveryOrderArray = _deliveryOrderArray;
    VC.dataArray = _dataArray;
    VC.allUnit = _allUnit;
    VC.allNum = _allNum;
    VC.allPrice = _allPrice;
    [self.navigationController pushViewController:VC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        OrderManageModel* model = _dataArray[0];
        OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
        if ([detailModel.categoryId isEqualToString:@"1"]) {
            
            //板材
            AddCustomPlankVC* VC = [AddCustomPlankVC new];
            VC.detailModel = detailModel;
            VC.model = model;
            [self.navigationController pushViewController:VC animated:YES];
        }else
        {
            //原木
            AddCustomVC* VC = [AddCustomVC new];
            VC.detailModel = detailModel;
            VC.model = model;
            [self.navigationController pushViewController:VC animated:YES];
        }
        
    }else
    {
        //发票
//        InvoiceInfoVC* VC = [InvoiceInfoVC new];
//        [self.navigationController pushViewController:VC animated:YES];

        ChangePriceView *addView = [ChangePriceView addChangePriceView];
        if (_deliveryOrderArray.count) {
            addView.dict = _deliveryOrderArray[indexPath.row];
        }
        _addView = addView;
        addView.delegate = self;
        [addView show];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
        
    }else if (section == 1)
    {
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            return model.orderDetailList.count;
        }
        return 1;

        
    }else if (section == 2)
    {
        return 1;
        
    }else if (section == 3)
    {
        return _deliveryOrderArray.count;
        
    }else
    {
        return 1;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 130;
        
    }else if (indexPath.section == 1)
    {
        
        return 60;
    }else if (indexPath.section == 2)
    {
        return 110;
        
    }else if (indexPath.section == 3)
    {
        return 75;
        
    }else
    {
        return 170;
        
    }
}

-(void)deleteAction:(NSString *)ID
{
    NSMutableArray* array = [NSMutableArray array];
    
    NSNumber* num = [NSNumber numberWithInt:[ID intValue]];
    [array addObject:num];
    
    
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    __weak typeof(self)weakSelf = self;

    [apiInstance cancelPackagesUsingGETWithAuthorization:@"Q" orderPackIdList:array completionHandler:^(SWGMessageResult *output, NSError *error) {
    
        if (!error) {
            if ([output.code intValue] == 0) {
                
                [weakSelf showAlert:@"删除成功"];
                [weakSelf refreshing];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
    
//    [[WebClient sharedClient]orderPackCancelPackages:dict complete:^(ResponseMode *result, NSError *error) {
//        if (!error) {
//            if (result.code == 0) {
//
//            }
//        }else
//        {
//            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
//            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"错误原因:%@",str);
//        }
//
//    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        NSString *identifier1 = @"AddLoadingOneCell";
        AddLoadingOneCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
            cell1.model = detailModel;
            
            NSMutableArray* arr = (NSMutableArray *)detailModel.warestoreList;
            cell1.dict = arr[0];
        }
        
        return cell1;
        
    }else if (indexPath.section == 1) {
        NSString *identifier1 = @"AddLoadingTwoCell";
        AddLoadingTwoCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
            cell1.detailModel = detailModel;
        }
        
        return cell1;
        
    }else if (indexPath.section == 2) {
        
        NSString *identifier1 = @"AddLoadingThreeCell";
        AddLoadingThreeCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            cell1.model = model;
        }
        return cell1;

    }else if (indexPath.section == 3) {
        
        NSString *identifier1 = @"AddLoadingFourCell";
        AddLoadingFourCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableDictionary* dict = _deliveryOrderArray[indexPath.row];
        cell1.dict = dict;
        cell1.delegate = self;
        
        return cell1;
    
    }else
    {
        NSString *identifier1 = @"AddLoadingFiveCell";
        _fiveCell = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _fiveCell.selectionStyle = UITableViewCellSelectionStyleNone;

        if (_deliveryOrderArray.count) {
            _fiveCell.dict = _deliveryOrderArray[indexPath.row];
        }
        _fiveCell.delegate = self;
        _fiveCell.priceLable.text = [NSString stringWithFormat:@"￥%.2f",_allPrice];
         if ((int)_allUnit != _allUnit) {
             _fiveCell.numLable.text = [NSString stringWithFormat:@"共%d件  %.3f%@",_allNum,_allUnit,@"m³"];
         }else
         {
             _fiveCell.numLable.text = [NSString stringWithFormat:@"共%d件  %d%@",_allNum,(int)_allUnit,@"m³"];
         }

        _fiveCell.infoLable.hidden = YES;

        return _fiveCell;
        
        
    }
    return nil;
    
}


@end

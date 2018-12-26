//
//  OrderManagementDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderManagementDetailVC.h"
#import "OrderDetailOneCell.h"
#import "OrderDetailTwoCell.h"
#import "OrderDetailThreeCell.h"
#import "OrderStateCell.h"
#import "OrderInfoCell.h"
#import "OrderAdressCell.h"
#import "AddGoodCell.h"
#import "OrderBoomCell.h"
#import "CloseOrderVC.h"
#import "DeleteView.h"
#import "AddCustomGoodsVC.h"
#import "AddOrderGoodsVC.h"
#import "AddLoadingDetails.h"
#import "HQPickerView.h"
#import "OrderManageModel.h"
#import "OrderDetailModel.h"
#import "MoveGroupingVC.h"
#import "AddOrderView.h"
#import "MoveGroupingModel.h"
#import "SWGOrderControllerApi.h"
#import "SWGOrderDetailBean.h"
#import "AddLoadingFiveCell.h"
#import "AddLoadingFourCell.h"
#import "SWGOrderPackControllerApi.h"
#import "SWGComeStockBean.h"

@interface OrderManagementDetailVC ()<UITableViewDelegate,UITableViewDataSource,OrderBoomCellDelegate,OrderDetailTwoCellDelegate,DeleteViewDelegate,AddGoodCellDelegate,HQPickerViewDelegate,UITextFieldDelegate,AddOrderViewDelegate>


@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)UITableView* topTableView;


@property(nonatomic,copy)NSString * num;

@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)DeleteView *photoView;

@property(nonatomic,strong)OrderBoomCell *cell1;//最后一个区的cell

@property(nonatomic,strong)NSMutableDictionary* modedic;

@property(nonatomic,strong)AddOrderView *addView;//修改数量价格View

@property(nonatomic,strong)NSMutableArray* PayAccoutArray;
@property(nonatomic,strong)MoveGroupingModel* moveModel;//改变收歀账号数组

@property(nonatomic,strong)NSMutableArray* logArray;

@property(nonatomic,assign)int invoiceType;//是否含税

@property(nonatomic,assign)int payType;

@property(nonatomic,copy)NSString* fourStateStr;
@property(nonatomic,strong)NSMutableArray* pickerInfoArray;
@property(nonatomic) NSArray<SWGOrderDetailBean>* orderDetailList;

@property(nonatomic,strong)UILabel* orderSnLable;
@property(nonatomic,strong)UILabel* priceLable;
@property(nonatomic,strong)UILabel* stateLable;
@property(nonatomic,strong)NSMutableArray* deliveryOrderArray;

//出货单
@property(nonatomic,assign)CGFloat allPrice;
@property(nonatomic,assign)int allNum;
@property(nonatomic,assign)CGFloat allUnit;
@property(nonatomic,strong)NSString* fiveRightBtnStr;

@property(nonatomic) NSArray<SWGComeStockBean>* stockBeanArray;



@end

@implementation OrderManagementDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"订单详情";
    
    _dataArray = [NSMutableArray array];
    _deliveryOrderArray = [NSMutableArray array];
    _PayAccoutArray = [NSMutableArray array];
    _logArray = [NSMutableArray array];
    _pickerInfoArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 200)];
    headView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
    UILabel* orderSnLable = [UILabel new];
    _orderSnLable = orderSnLable;
    orderSnLable.text = @"订单编号";
    orderSnLable.textColor = [UIColor colorWithHexString:@"666666"];
    orderSnLable.font = [UIFont systemFontOfSize:12];
    [headView addSubview:orderSnLable];
    [orderSnLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView).offset(15);
        make.left.equalTo(headView).offset(20);
    }];
    
    UILabel* priceLable = [UILabel new];
    _priceLable = priceLable;
    priceLable.text = @"订单金额";
    priceLable.textColor = [UIColor colorWithHexString:@"666666"];
    priceLable.font = [UIFont systemFontOfSize:12];
    [headView addSubview:priceLable];
    [priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderSnLable.mas_bottom).offset(5);
        make.left.equalTo(headView).offset(20);
    }];
    
    UILabel* stateLable = [UILabel new];
    _stateLable = stateLable;
    stateLable.text = @"订单状态";
    stateLable.textColor = MINE_Color;
    stateLable.font = [UIFont systemFontOfSize:14];
    [headView addSubview:stateLable];
    [stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView).offset(20);
        make.right.equalTo(headView).offset(-20);
    }];
    
    _topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, screenW, 140) style:UITableViewStylePlain];
    _topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _topTableView.delegate = self;
    _topTableView.dataSource = self;
    [headView addSubview:_topTableView];
    _tableView.tableHeaderView = headView;
    
    
    [_topTableView registerNib:[UINib nibWithNibName:@"OrderStateCell" bundle:nil] forCellReuseIdentifier:@"OrderStateCell"];
    [_topTableView registerNib:[UINib nibWithNibName:@"OrderDetailOneCell" bundle:nil] forCellReuseIdentifier:@"OrderDetailOneCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"OrderInfoCell" bundle:nil] forCellReuseIdentifier:@"OrderInfoCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"OrderAdressCell" bundle:nil] forCellReuseIdentifier:@"OrderAdressCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"OrderDetailTwoCell" bundle:nil] forCellReuseIdentifier:@"OrderDetailTwoCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"AddGoodCell" bundle:nil] forCellReuseIdentifier:@"AddGoodCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"OrderDetailThreeCell" bundle:nil] forCellReuseIdentifier:@"OrderDetailThreeCell"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"OrderBoomCell" bundle:nil] forCellReuseIdentifier:@"OrderBoomCell"];
    
    
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingFourCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingFourCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AddLoadingFiveCell" bundle:nil] forCellReuseIdentifier:@"AddLoadingFiveCell"];
    [self refreshing];
    
    [self requestPayAccout];
    [self requestLogInfo];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    [self refreshing];
    [self requestLogInfo];
}

//获取第二区数据
-(void)requestLogInfo
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:_orderIdTwo forKey:@"orderId"];
    
    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient]orderLogSelectOrderLog:dict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                weakSelf.logArray = [OrderLogModel mj_objectArrayWithKeyValuesArray:result.data];
                if ([_logArray firstObject]) {
                    OrderLogModel* model = [_logArray firstObject];
                    model.isOne = @"YES";
                }
                
                [weakSelf.topTableView reloadData];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
        
    }];
    
}

//获取付款信息
-(void)requestPayAccout
{
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    
    __weak typeof(self)weakSelf = self;
    
    [[WebClient sharedClient]orderPaymentList:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        
        if (!error) {
            if (result.code == 0) {
                
                weakSelf.PayAccoutArray = [MoveGroupingModel mj_objectArrayWithKeyValuesArray:result.data];
                MoveGroupingModel* model = weakSelf.PayAccoutArray[0];
                
                weakSelf.fiveRightBtnStr = [self returnBankCard:model.code];
        
                [weakSelf.tableView reloadData];
       
            }else
            {
                
            }
        }else
        {
            
        }
        
    }];
}

//请求装货单
-(void)requestParkDetail:(NSString* )orderId
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:orderId forKey:@"orderId"];
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


//获取数据
-(void)refreshing
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
                if ([model0.orderStatus isEqualToString:@"4"]) {
                    [weakSelf requestPickGoodsInformation:model0.orderId];
                }
                
                if ([model0.orderStatus isEqualToString:@"7"] || [model0.orderStatus isEqualToString:@"8"] || [model0.orderStatus isEqualToString:@"9"]) {
                    [weakSelf requestParkDetail:model0.orderId];
                }
                
                for (OrderDetailModel* model in model0.orderDetailList) {
                    //如果数据是自定义添加的商品，添加没有返回数据的字段
                    if (model.packages) {
                        NSMutableDictionary* dict = [model.packages mj_JSONObject];
                        model.unitNum = [NSString stringWithFormat:@"%@",dict[@"cubicNum"]];
                    }
                }
                
                //给顶部状态赋值
                _orderSnLable.text = [NSString stringWithFormat:@"订单编号：%@",model0.orderSn];
                _priceLable.text = [NSString stringWithFormat:@"订单金额：￥%@",model0.totalPrice];
                if ([model0.orderStatus isEqualToString:@"0"]) {
                    _stateLable.text = @"已取消";
                }else if ([model0.orderStatus isEqualToString:@"1"])
                {
                    _stateLable.text = @"待审核";
                }else if ([model0.orderStatus isEqualToString:@"2"])
                {
                    _stateLable.text = @"待付款";
                    
                }else if ([model0.orderStatus isEqualToString:@"3"])
                {
                    _stateLable.text = @"待收款";
                    
                }else if ([model0.orderStatus isEqualToString:@"4"])
                {
                    _stateLable.text = @"待装货";
                    
                }else if ([model0.orderStatus isEqualToString:@"5"])
                {
                    _stateLable.text = @"待装货确认";
                    
                }else if([model0.orderStatus isEqualToString:@"6"])
                {
                    _stateLable.text = @"待结算";
                    
                }else if([model0.orderStatus isEqualToString:@"7"])
                {
                    _stateLable.text = @"待确认结算";
                    
                }else if ([model0.orderStatus isEqualToString:@"8"])
                {
                    _stateLable.text = @"待发货";
                    
                }else if ([model0.orderStatus isEqualToString:@"9"])
                {
                    _stateLable.text = @"待收货";
                    
                }else if ([model0.orderStatus isEqualToString:@"12"])
                {
                    _stateLable.text = @"已关闭";
                }
                
                [weakSelf.tableView reloadData];
                
            }else
            {
                
            }
        }else
        {
            
        }
    }];
}

//orderstates为待装货时请求买家有没有添加提货信息
-(void)requestPickGoodsInformation:(NSString *)orderId
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:orderId forKey:@"orderId"];
    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient]orderTableShowDeliveryInformation:dict complete:^(ResponseMode *result, NSError *error) {
    
        if (!error) {
            if (result.code == 0) {
                NSMutableArray* array = result.data;
                weakSelf.pickerInfoArray = [NSMutableArray arrayWithArray:array];
                if (weakSelf.pickerInfoArray.count == 0) {
                    weakSelf.fourStateStr = @"待买家提货";
                    [weakSelf.tableView reloadData];
                    weakSelf.stateLable.text = @"待买家提货";

                }else
                {
                    weakSelf.fourStateStr = nil;
                    [weakSelf.tableView reloadData];
                    weakSelf.stateLable.text = @"待装货";

                }
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

//关闭订单
-(void)closeAction:(UITableViewCell *)cell
{
    [self.tableView reloadData];
    OrderManageModel* model = _dataArray[0];
    CloseOrderVC* VC  =[CloseOrderVC new];
    VC.orderId = model.orderId;
    [self.navigationController pushViewController:VC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _topTableView) {
        return 1;
    }else{
     
        if (!_dataArray.count) {
            return 0;
        }else{
            OrderManageModel* model = _dataArray[0];
            if ([model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]) {
                return 8;
            }else{
                return 5;
            }
        }
       
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _topTableView) {
            return _logArray.count;
        
    }else{
        
        //状态等于78时，返回8区
        OrderManageModel* model = _dataArray[0];
        if ([model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]) {
            if (section == 0)
            {
                return 1;
            }else if (section == 1)
            {
                return 1;
            }else if (section == 2)
            {
                if (_dataArray.count) {
                    OrderManageModel* model = _dataArray[0];
                    return model.orderDetailList.count;
                    
                }else
                {
                    return 0;
                }
                
            }else if (section == 3)
            {
                return 1;
                
            }else if (section == 4)
            {
                return 1;
            }else if (section == 5)
            {
                return _deliveryOrderArray.count;
            }else if (section == 6)
            {
                return 1;
                
            }else
            {
                return 1;
                
            }
        }else{

        //状态不等于78时，返回5区
        if (section == 0)
        {
        return 1;
        
        }else if (section == 1)
        {
        return 1;
        
        }else if (section == 2)
        {
            if (_dataArray.count) {
                OrderManageModel* model = _dataArray[0];
                return model.orderDetailList.count;
            }else
            {
                return 0;
            }
        }else if (section == 3)
        {
        return 1;
        
        }else
        {
        return 1;

        }
    }
    }

    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _topTableView) {
        
            return 70;
        
    }else{
        
    OrderManageModel* model = _dataArray[0];
    if ([model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"]|| [model.orderStatus isEqualToString:@"9"])
    {
        
        //有出货单明细Cell
        if (indexPath.section == 0)
        {
            if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"]) {
                return 40;
            }else
            {
            
                return 0;
            }
        }else if (indexPath.section == 1)
        {
            return 90;
        }else if (indexPath.section == 2)
        {
            if (_dataArray.count) {
                OrderManageModel* model = _dataArray[0];
                if ([model.orderStatus isEqualToString:@"0"]) {
                    
                    return 65;
                }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] || [model.orderStatus isEqualToString:@"5"] || [model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"])
                {
                    return 65;
                }else
                {
                    
                }
            }
            return 80;
            
            
        }else if (indexPath.section == 3)
        {
            if (_dataArray.count) {
                OrderManageModel* model = _dataArray[0];
                if ([model.orderStatus isEqualToString:@"0"]) {
                    
                    
                }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] ||[model.orderStatus isEqualToString:@"12"] ||[model.orderStatus isEqualToString:@"5"] ||[model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"])
                {
                    return 60;
                }else
                {
                    
                }
            }
            return 120;
            
        }else if (indexPath.section == 4)
        {
            return 40;
            
        }else if (indexPath.section == 5)
        {
            return 90;
            
        }else if (indexPath.section == 6)
        {
            return 95;
        }else
        {
            if (_dataArray.count) {
                
                OrderManageModel* model = _dataArray[0];
                
                if ([model.orderStatus isEqualToString:@"0"]) {
                    
                    
                }else if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"] || [model.orderStatus isEqualToString:@"12"] )
                {
                    return 434;
                }else if([model.orderStatus isEqualToString:@"3"])
                {
                    return 590;
                }else if ([model.orderStatus isEqualToString:@"4"])
                {
                    return 494;
                    
                }else if ([model.orderStatus isEqualToString:@"8"])
                {
                    return 550;
                    
                }
            }
            
            return 590;
            
        }
    }else
    {
        
        //没有出货单明细
        if (indexPath.section == 0)
        {
            if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"]) {
                return 40;
                {
                   return 0;
                }
            }
            
        }else if (indexPath.section == 1)
        {
            return 90;
        }else if (indexPath.section == 2)
        {
            if (_dataArray.count) {
                OrderManageModel* model = _dataArray[0];
                if ([model.orderStatus isEqualToString:@"0"]) {
               
                    return 65;
                }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] || [model.orderStatus isEqualToString:@"5"] || [model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"])
                {
                    return 65;
                }else
                {

                }
            }
            return 80;
        
        
    }else if (indexPath.section == 3)
    {
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            if ([model.orderStatus isEqualToString:@"0"]) {
                
                
            }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] ||[model.orderStatus isEqualToString:@"12"] ||[model.orderStatus isEqualToString:@"5"] ||[model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"])
            {
                return 70;
            }else
            {
                
            }
        }
       return 120;
    }else
    {
        if (_dataArray.count) {
            OrderManageModel* model = _dataArray[0];
            
            if ([model.orderStatus isEqualToString:@"0"]) {
                
                
            }else if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"] || [model.orderStatus isEqualToString:@"12"] )
            {
                return 434;
            }else if([model.orderStatus isEqualToString:@"3"])
            {
                return 590;
            }else if ([model.orderStatus isEqualToString:@"4"])
            {
                return 494;

            }
        }

        return 590;

    }
    }
        
    }
    
    return 0;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y  - (self.view.frame.size.height - 250.0)+100;//键盘高度216
    NSLog(@"%d============",offset);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}

-(void)lookAction:(NSString *)str
{
    AddLoadingDetails* VC = [AddLoadingDetails new];
    OrderManageModel* model = _dataArray[0];
    OrderDetailModel* detailModel = model.orderDetailList[0];
    VC.orderIdTrue = model.orderId;
    //订单编号
    VC.orderId = _orderId;
    VC.categoryId = detailModel.categoryId;
    [self.navigationController pushViewController:VC animated:YES];
}

//添加装货明细||确认到款
-(void)addLoadingDetail:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"确认到款"]) {

        OrderManageModel* model = _dataArray[0];
        if ([model.orderStatus isEqualToString:@"7"]) {
            if ([_cell1.actualTF.text isEqualToString:@""] || [_cell1.actualTF.text isEqualToString:@"0"]) {
                [self showAlert:@"请输入金额"];
                return;
            }
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* actualDict = arr[0];
            [dict setObject:actualDict[@"paymentAccountId"] forKey:@"orderPaymentId"];
            [dict setObject:model.orderId forKey:@"orderId"];
            AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
            [dict setObject:userInfo.userId forKey:@"userId"];
            //实际到账金额
            [dict setObject:_cell1.actualTF.text forKey:@"actualMoney"];
            int num = [model.orderStatus intValue] + 1;
            [dict setObject:[NSString stringWithFormat:@"%d",num] forKey:@"orderStatus"];
            [dict setObject:model.buyerId forKey:@"buyerId"];
            __weak typeof(self)weakSelf = self;
            [[WebClient sharedClient] orderArrivalMoney:dict complete:^(ResponseMode *result, NSError *error) {
                if (!error) {
                    if (result.code == 0) {
                        [weakSelf showAlert:@"操作成功"];
                        [weakSelf.navigationController popViewControllerAnimated:YES];
                        weakSelf.slectBlock(_sectionNum,_orderId);
                    }
                }else
                {
                    NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                    
                    NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                    
                    NSLog(@"错误原因:%@",str);
                }
            }];
            
            
        }else
        {
            if ([_cell1.actualTF.text isEqualToString:@""] || [_cell1.actualTF.text isEqualToString:@"0"]) {
                [self showAlert:@"请输入金额"];
                return;
            }
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            OrderManageModel* model = _dataArray[0];
            NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* actualDict = arr[0];
            [dict setObject:actualDict[@"paymentAccountId"] forKey:@"orderPaymentId"];
            [dict setObject:model.orderId forKey:@"orderId"];
            AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
            [dict setObject:userInfo.userId forKey:@"userId"];
            //实际到账金额
            [dict setObject:_cell1.actualTF.text forKey:@"actualMoney"];
            int num = [model.orderStatus intValue] + 1;
            [dict setObject:[NSString stringWithFormat:@"%d",num] forKey:@"orderStatus"];
            [dict setObject:model.buyerId forKey:@"buyerId"];
            __weak typeof(self)weakSelf = self;
            [[WebClient sharedClient] orderArrivalMoney:dict complete:^(ResponseMode *result, NSError *error) {
                if (!error) {
                    if (result.code == 0) {
                        [weakSelf showAlert:@"操作成功"];
                        [weakSelf.navigationController popViewControllerAnimated:YES];
                        weakSelf.slectBlock(_sectionNum,_orderId);
                    }
                }else
                {
                    NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                
                    NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
               
                    NSLog(@"错误原因:%@",str);
                }
            }];
        }
    }else if([btn.titleLabel.text isEqualToString:@"添加装车明细"])
    {
        AddLoadingDetails* VC = [AddLoadingDetails new];
        OrderManageModel* model = _dataArray[0];
        OrderDetailModel* detailModel = model.orderDetailList[0];
        VC.orderIdTrue = model.orderId;
        //订单编号
        VC.orderId = _orderId;
        VC.categoryId = detailModel.categoryId;
        [self.navigationController pushViewController:VC animated:YES];
    }
        
    
}

//审核
-(void)shenheOrder:(UIButton *)btn
{
    
    OrderManageModel* model1 = _dataArray[0];
    OrderDetailModel* mdodel = model1.orderDetailList[0];
    if ([btn.titleLabel.text isEqualToString:@"确认发货"]) {
        
        SWGOrderPackControllerApi* orderParkApi = [[SWGOrderPackControllerApi alloc] init];
        NSMutableArray* array = [NSMutableArray array];
        AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
        for (NSMutableDictionary* dict in _deliveryOrderArray) {
            SWGComeStockBean* stockBean = [[SWGComeStockBean alloc] init];

            stockBean.buyNumber = dict[@"buyNumber"];
            stockBean.categoryId = [NSNumber numberWithInt:[mdodel.categoryId intValue]];
            stockBean.goodsId = dict[@"goodsId"];
            stockBean.orderId = [NSNumber numberWithInt:[model1.orderId intValue]];
            stockBean.userId = [NSNumber numberWithInt:[userInfo.userId intValue]];
            
            //板材添加包号
            [array addObject:stockBean];
        }
        
//        _stockBeanArray = array;
        __weak typeof(self)weakSelf = self;

        [orderParkApi comeStockUsingPOSTWithAuthorization:@"Q" bean:array completionHandler:^(SWGMessageResult *output, NSError *error) {
            if (!error) {
                if ([output.code intValue] == 0) {
                    [weakSelf showAlert:@"操作成功"];
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    weakSelf.slectBlock(_sectionNum,_orderId);
                }
                
            }else
            {
                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
                NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"错误原因:%@",str);
            }
            
        }];
        
    }else
    {
    
    //审核
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:userInfo.userId forKey:@"userId"];
    
    if (_moveModel) {

        [dict setObject:_moveModel.accountId forKey:@"paymentAccountId"];

    }else
    {
        MoveGroupingModel* model0 = _PayAccoutArray[0];
        [dict setObject:model0.accountId forKey:@"paymentAccountId"];
    }
    
    [dict setObject:model1.totalPrice forKey:@"prepayPrice"];
    [dict setObject:model1.buyerId forKey:@"buyerId"];
    [dict setObject:model1.orderId forKey:@"orderId"];
    [dict setObject:@(_payType) forKey:@"payType"];
    [dict setObject:@(_invoiceType) forKey:@"invoiceType"];
    [dict setObject:@(1) forKey:@"collectType"];

    NSMutableArray* priceArray  = [NSMutableArray array];
    for (OrderDetailModel* model in model1.orderDetailList) {
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        [dict setObject:model.buyNumber forKey:@"buyNumber"];
        [dict setObject:model.buyPrice forKey:@"buyPrice"];
        [dict setObject:model.unitNum forKey:@"cubicNumber"];
        [priceArray addObject:dict];
    }
    
    _orderDetailList = priceArray;
    [dict setObject:[priceArray mj_JSONString] forKey:@"orderDetailList"];
    
    int invoice;
    //用户没有选择默认1
    if (_invoiceType == 0) {
        invoice = 1;
    }else if(_invoiceType == 1)
    {
        invoice = 1;
    }else
    {
        invoice = 0;
    }
    
    //用户没有选择默认1
    if (_payType == 0) {
        _payType = 1;
    }

    
    SWGOrderControllerApi* apiInstance = [[SWGOrderControllerApi alloc] init];
    NSNumber *orderId = [NSNumber numberWithInt:[model1.orderId intValue]];
    NSNumber *userId = [NSNumber numberWithInt:[userInfo.userId intValue]];
    NSNumber *payType = [NSNumber numberWithInt:_payType];
    NSNumber *invoiceType = [NSNumber numberWithInt:invoice];
    NSNumber *collectType = [NSNumber numberWithInt:1];

    NSString *totalPrice;
    if ([payType intValue] == 1) {
        
        NSString* str = [_cell1.threeLable.text stringByReplacingOccurrencesOfString:@"￥" withString:@""];
        totalPrice = str;

        
    }else if ([payType intValue] == 2||[payType intValue] == 3)
    {
        totalPrice = model1.totalPrice;

    }
    
    NSNumber *paymentAccountId = [NSNumber numberWithInt:[dict[@"paymentAccountId"] intValue]];
    NSNumber *buyerId = [NSNumber numberWithInt:[model1.buyerId intValue]];
    
    __weak typeof(self)weakSelf = self;
    
    [apiInstance updateOrderInfoUsingPOSTWithAuthorization:@"Q" orderId:orderId userId:userId payType:payType prepayPrice:totalPrice invoiceType:invoiceType collectType:collectType paymentAccountId:paymentAccountId buyerId:buyerId orderDetailList:_orderDetailList tailMoney:nil completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (!error) {
            if ([output.code intValue] == 0) {
                
                [weakSelf showAlert:@"提交审核成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
                weakSelf.slectBlock(_sectionNum,_orderId);
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
    
    
//    [[WebClient sharedClient]orderOrderUpdate:dict complete:^(ResponseMode *result, NSError *error) {
//        if (!error) {
//            if (result.code == 0) {
//
//
//            }
//        }
//    }];
        
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:NO];
    self.slectBlock(_sectionNum,_orderId);

}

//添加商品
-(void)addgoods:(NSString *)categoryId
{
    AddOrderGoodsVC* VC  =[AddOrderGoodsVC new];
    VC.categoryId = categoryId;
    OrderManageModel* model = _dataArray[0];
    VC.orderId = model.orderId;
    [self.navigationController pushViewController:VC animated:YES];
    
}

//添加自定义商品
-(void)addCustomgoods:(NSString *)categoryId
{
    AddCustomGoodsVC* VC  =[AddCustomGoodsVC new];
    VC.categoryId = categoryId;
    OrderManageModel* model = _dataArray[0];
    VC.orderId = model.orderId;
    [self.navigationController pushViewController:VC animated:YES];
}


//确定删除按钮
-(void)sureDelete:(NSString *)orderID
{
    __weak typeof(self)weakSelf = self;
    //如果是最后一个详情订单删除整个订单
    if (_dataArray.count != 1) {
        
        NSLog(@"%@",@"00-");
        
        OrderManageModel* model  = _dataArray[0];
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        //订单ID
        [dict setObject:model.orderId forKey:@"orderId"];
        AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
        [dict setObject:userInfo.storeId forKey:@"storeId"];
        __weak typeof(self)weakSelf = self;
        
        [[WebClient sharedClient]orderDelete:dict complete:^(ResponseMode *result, NSError *error) {
            
            [weakSelf.photoView.backgroupView removeFromSuperview];
            [weakSelf.photoView removeFromSuperview];
            
            if (!error) {
                if (result.code == 0) {
                    
                    [weakSelf showAlert:@"订单删除成功"];
                    [weakSelf refreshing];
                }
            }
        }];
        
    }else{

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    //orderDetailId详细订单ID
    [dict setObject:orderID forKey:@"id"];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [[WebClient sharedClient] deleteOrderDetail:dict complete:^(ResponseMode *result, NSError *error) {
        [weakSelf.photoView.backgroupView removeFromSuperview];
        [weakSelf.photoView removeFromSuperview];
        if (!error) {
            if (result.code == 0) {
                
                [weakSelf showAlert:@"删除成功"];
                [weakSelf refreshing];
   
            }else
            {
                
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因==:%@",str);
        }
        
    }];
        
    }
}
//修改
-(void)sureAction:(NSMutableDictionary *)dict
{
    OrderManageModel* model = _dataArray[0];
    _modedic = dict;
    [_modedic setObject:model.orderId forKey:@"orderId"];
    
    //计算总价
    NSMutableArray* priceArray = [NSMutableArray array];
    for (OrderDetailModel* mdoel0 in model.orderDetailList) {
        
        CGFloat num = [mdoel0.buyNumber floatValue]*[mdoel0.buyPrice floatValue]*[mdoel0.unitNum floatValue];
        
        if (mdoel0.orderDetailId == dict[@"orderDetailId"]) {
            
        }else
        {
            //没有修改的详单放进数组
            [priceArray addObject:[NSString stringWithFormat:@"%f",num]];
        }
    }
    
    //没有修改的详单总价
    CGFloat sum = [[priceArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    //当前修改的详单
    CGFloat nowNum = [dict[@"buyNumber"] floatValue]*[dict[@"buyPrice"] floatValue]*[dict[@"cubicNumber"] floatValue];
    CGFloat allPrice = sum+nowNum;
    NSString* allStr = [NSString stringWithFormat:@"%.2f",allPrice];
    [_modedic setObject:allStr forKey:@"totalPrice"];
    
    [self requestChangeNumAndPrice:_modedic];
}

//修改价格和数量
-(void)requestChangeNumAndPrice:(NSMutableDictionary *)dict
{
    
    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient] orderDetailUpdateNumPlus:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (!error) {
            if (result.code == 0) {
                
                [weakSelf showAlert:@"修改成功"];
                
                [weakSelf refreshing];
                
                [weakSelf.addView removeFromSuperview];
                [weakSelf.addView.backgroupView removeFromSuperview];
            }
        }
        
    }];
}

//删除按钮
-(void)deleteAction:(NSString *)orderID
{
    DeleteView *photoView = [DeleteView addDeleteVView];
    photoView.delegate = self;
    photoView.orderID = orderID;
    _photoView = photoView;
    [photoView show];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _topTableView) {
        
            NSString *identifier1 = @"OrderDetailOneCell";
            OrderDetailOneCell *cell1 = [_topTableView dequeueReusableCellWithIdentifier:identifier1];
            if(cell1 == nil){
            
            cell1 = [[OrderDetailOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];

            }
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            OrderLogModel* model = _logArray[indexPath.row];
       
  
            cell1.model = model;
            return cell1;
        
            
    }else{

        OrderManageModel* model = _dataArray[0];
        if ([model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"])
        {
            //结算和放货状态添加出货单明细cell
            if (indexPath.section == 0) {
            
                    NSString *identifier1 = @"OrderInfoCell";
                    OrderInfoCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                    if(cell1 == nil){
                        cell1 = [[OrderInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                    }
                    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                
                    if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"]) {
                        cell1.infoLable.hidden = NO;

                    }else
                    {
                        cell1.infoLable.hidden = YES;
                    }
                    return cell1;
               
            }else if (indexPath.section == 1) {
                NSString *identifier1 = @"OrderAdressCell";
                OrderAdressCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[OrderAdressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
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
                
                
            }else if (indexPath.section == 2)
            {
                NSString *identifier1 = @"OrderDetailTwoCell";
                OrderDetailTwoCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[OrderDetailTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                OrderManageModel* model = _dataArray[0];
                OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
                cell1.model = detailModel;
                cell1.delegate = self;
                cell1.manegeModel = model;
                
                if (!detailModel.packages) {
                    //库存
                    cell1.numLable.text = [NSString stringWithFormat:@"数量：%@ %@*%@",detailModel.unitNum,detailModel.goodsNuit,detailModel.buyNumber];
                    
                }else
                {
                    //自定义
                    NSMutableDictionary* dict = [detailModel.packages mj_JSONObject];
                    cell1.numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@",dict[@"cubicNum"],@"m³",detailModel.buyNumber];
                }
                return cell1;
            }else if(indexPath.section == 3)
            {
                NSString *identifier1 = @"AddGoodCell";
                AddGoodCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    
                    cell1 = [[AddGoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.delegate = self;
                if (_dataArray.count) {
                    OrderManageModel* model = _dataArray[0];
                    OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
                    cell1.categoryId = detailModel.categoryId;
                    cell1.model = model;
                }
                return cell1;
                
              
            }else if(indexPath.section == 4)
            {
                
                NSString *identifier1 = @"cell";
                UITableViewCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                UILabel* namelable = [UILabel new];
                namelable.text = @"出货单明细";
                cell1.contentView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
                namelable.font = [UIFont systemFontOfSize:16];
                namelable.textColor = [UIColor colorWithHexString:@"333333"];
                [cell1.contentView addSubview:namelable];
                [namelable mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(cell1.contentView).offset(30);
                    make.top.equalTo(cell1.contentView).offset(5);
                }];
                
                return cell1;

            }else if(indexPath.section == 5)
            {
                
                NSString *identifier1 = @"AddLoadingFourCell";
                AddLoadingFourCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[AddLoadingFourCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.deleteBtn.hidden = YES;
                cell1.priceTF.hidden = YES;
                cell1.priceBtn.hidden = YES;
                cell1.priceLable.hidden = NO;
                if (_deliveryOrderArray.count) {
                    NSMutableDictionary* dict = _deliveryOrderArray[indexPath.row];
                    cell1.dict = dict;
                }
                return cell1;
                
               
                
            }else if(indexPath.section == 6)
            {
                NSString *identifier1 = @"AddLoadingFiveCell";
                AddLoadingFiveCell *fiveCell = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(tableView == nil){
                    fiveCell = [[AddLoadingFiveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                fiveCell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                if (_deliveryOrderArray.count) {
                    fiveCell.dict = _deliveryOrderArray[indexPath.row];
                }
                fiveCell.priceLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
                
                
                if ((int)_allUnit != _allUnit) {
                    
                    fiveCell.numLable.text = [NSString stringWithFormat:@"共%d件  %.3f%@",_allNum,_allUnit,@"m³"];
                }else
                {
                    fiveCell.numLable.text = [NSString stringWithFormat:@"共%d件  %d%@",_allNum,(int)_allUnit,@"m³"];
                }
                
                fiveCell.submitBtn.hidden = YES;
                fiveCell.addGoodsBtn.hidden = YES;
                fiveCell.addCustomBtn.hidden = YES;
                fiveCell.infoLable.hidden = NO;
                
                return fiveCell;
            }else
            {
                NSString *identifier1 = @"OrderBoomCell";
                OrderBoomCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[OrderBoomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                _cell1 = cell1;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.delegate = self;
                cell1.actualTF.delegate = self;
                if (_dataArray.count) {
                    OrderManageModel* model = _dataArray[0];
                    if ([model.orderStatus isEqualToString:@"4"]) {
                        if (_fourStateStr != nil) {
                            model.isPicker = @"1";//没有提货信息
                        }else
                        {
                            model.isPicker = @"0";//有提货信息
                            if (_pickerInfoArray.count) {
                                cell1.pickerDict = _pickerInfoArray[0];
                            }
                        }
                    }
                    cell1.model = model;
                }
                return cell1;
            }
            
        }else
        {
            //不是结算状态和放货状态没有出货单明细cell
            if (indexPath.section == 0) {
                NSString *identifier1 = @"OrderInfoCell";
                OrderInfoCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                if(cell1 == nil){
                    cell1 = [[OrderInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
                }
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell1;
   
            }else if (indexPath.section == 1) {
                NSString *identifier1 = @"OrderAdressCell";
                OrderAdressCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
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

    
            }else if (indexPath.section == 2)
            {
                NSString *identifier1 = @"OrderDetailTwoCell";
                OrderDetailTwoCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                OrderManageModel* model = _dataArray[0];
                OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
                cell1.model = detailModel;
                cell1.delegate = self;
                cell1.manegeModel = model;
        
                if (!detailModel.packages) {
                    //库存
                    cell1.numLable.text = [NSString stringWithFormat:@"数量：%@ %@*%@",detailModel.unitNum,detailModel.goodsNuit,detailModel.buyNumber];
    
                }else
                {
                    //自定义
                    NSMutableDictionary* dict = [detailModel.packages mj_JSONObject];
                    cell1.numLable.text = [NSString stringWithFormat:@"数量：%@%@*%@",dict[@"cubicNum"],@"m³",detailModel.buyNumber];
                }
                return cell1;
            }else if(indexPath.section == 3)
            {
                NSString *identifier1 = @"AddGoodCell";
                AddGoodCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.delegate = self;
                if (_dataArray.count) {
                    OrderManageModel* model = _dataArray[0];
                    OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
                    cell1.categoryId = detailModel.categoryId;
                    cell1.model = model;
                }
                return cell1;
            }else
            {
                NSString *identifier1 = @"OrderBoomCell";
                OrderBoomCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                _cell1 = cell1;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.delegate = self;
                cell1.actualTF.delegate = self;
                if (_dataArray.count) {
                    OrderManageModel* model = _dataArray[0];
                    if ([model.orderStatus isEqualToString:@"4"]) {
                        if (_fourStateStr != nil) {
                            model.isPicker = @"1";//没有提货信息
                        }else
                        {
                            model.isPicker = @"0";//有提货信息
                            if (_pickerInfoArray.count) {
                                cell1.pickerDict = _pickerInfoArray[0];
                            }
                        }
                    }
                    
                [cell1.fiveRightBtn setTitle:self.fiveRightBtnStr forState:UIControlStateNormal];
//            NSMutableDictionary* dict = model.actualMoney[0];
           //根据支付账户id取到账户账号
//            for (MoveGroupingModel*model in _PayAccoutArray) {
//
//                if (dict[@"paymentAccountId"] == [NSNumber numberWithInt:[model.accountId intValue]]) {
//                    [cell1.fourRightBtn setTitle:model.code forState:UIControlStateNormal];
//
//                }
//            }
                    cell1.model = model;
                }
                return cell1;
            }
        }
    }
    return nil;

}

//更换收款方式
-(void)payNumAction
{
    MoveGroupingVC* VC = [MoveGroupingVC new];
    VC.slectAccountIdBlock = ^(MoveGroupingModel * _Nonnull model) {
        
        _moveModel = model;
   
        NSString* str = [self returnBankCard:model.code];
        [_cell1.fiveRightBtn setTitle:str forState:UIControlStateNormal];
        
    };
    [self.navigationController pushViewController:VC animated:YES];
}

//把中间的数字转为***
-(NSString *)returnBankCard:(NSString *)BankCardStr
{
    NSString* formerStr = [BankCardStr substringFromIndex:4];
    NSString* str1 = [BankCardStr stringByReplacingOccurrencesOfString:formerStr withString:@""];
    NSString* endStr = [BankCardStr substringFromIndex:BankCardStr.length-4];
    NSString* str2 = [str1 stringByReplacingOccurrencesOfString:endStr withString:@""];
    NSString* middleStr = [str2 stringByReplacingOccurrencesOfString:str2 withString:@"****"];
//    NSString* CardNumberStr = [formerStr stringByAppendingFormat:@"%@%@",middleStr,endStr];
    NSString* CardNumberStr = [NSString stringWithFormat:@"%@%@%@",str1,middleStr,endStr];
    return CardNumberStr;
}


-(void)oneBtnAction:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"价格是否含税"]) {
        HQPickerView *picker = [[HQPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        _num = @"1";
        picker.customArr = @[@"含税",@"不含税"];
        picker.customNum = 0;
        [self.view addSubview:picker];

    }else if ([btn.titleLabel.text isEqualToString:@"结算方式"])
    {
        HQPickerView *picker = [[HQPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        _num = @"2";
        picker.customNum = 1;

        picker.customArr = @[@"定金+尾款",@"先装车后全款",@"先全款后装车"];
        [self.view addSubview:picker];
        
    }else if ([btn.titleLabel.text isEqualToString:@"支付金额合计"])
    {
        HQPickerView *picker = [[HQPickerView alloc]initWithFrame:self.view.bounds];
        picker.delegate = self ;
        _num = @"3";
        picker.customNum = 1;
        picker.customArr = @[@"200",@"500",@"1000"];
        [self.view addSubview:picker];
    }else if ([btn.titleLabel.text isEqualToString:@"付款账号"])
    {
        
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        OrderManageModel* model = _dataArray[0];
        OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
        //    cell1.model = detailModel;
        
        if ([model.orderStatus intValue] == 1 || [model.orderStatus intValue] == 2) {
            AddOrderView *addView = [AddOrderView addSureView];
            addView.detailModel = detailModel;
            
            //如果是库存商品传长度
            if (!detailModel.packages) {
                NSMutableArray* lengthAttributesList = (NSMutableArray *)detailModel.lengthAttributesList;
                addView.dict = lengthAttributesList[0];
            }

            _addView = addView;
            addView.isDetail = YES;
            addView.delegate = self;
            [addView show];
        }
    }
}



- (void)pickerView:(UIPickerView *)pickerView didSelectText:(NSString *)text num:(NSString *)num{
    
    
    if ([_num isEqualToString:@"1"]) {
        
        [_cell1.oneRightBtn setTitle:text forState:UIControlStateNormal];

        int numm = [num intValue];
        if (numm == 0) {
            _invoiceType = 1;
        }else if (numm == 1)
        {
            _invoiceType = 2;
        }
    }else if([_num isEqualToString:@"2"])
    {
        
        [_cell1.twoRightBtn setTitle:text forState:UIControlStateNormal];

        int numm = [num intValue];
        if (numm == 0) {
            _payType = 1;
            _cell1.threeLable.text = @"0";
            _cell1.threeBtn.userInteractionEnabled = YES;
            _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",@"200"];

            
        }else if (numm == 1)
        {
            _payType = 2;
            OrderManageModel* model = _dataArray[0];

            _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
            _cell1.threeBtn.userInteractionEnabled = NO;


        }else if (numm == 2)
        {
            _cell1.threeBtn.userInteractionEnabled = NO;

            _payType = 3;
            OrderManageModel* model = _dataArray[0];
            _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];

            
        }
    }else if ([_num isEqualToString:@"3"])
    {
        _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",text];
    }
}

@end

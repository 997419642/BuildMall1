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
#import "ZWHScanImage.h"
#import <sqlite3.h>
#import "BasicNavigationController.h"



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
@property(nonatomic,copy)NSString* allPrice;
@property(nonatomic,assign)int allNum;
@property(nonatomic,assign)CGFloat allUnit;
@property(nonatomic,strong)NSString* fiveRightBtnStr;
@property(nonatomic) NSArray<SWGComeStockBean>* stockBeanArray;

@property (nonatomic,strong) NSMutableArray *dataList;

//自己计算订单总价
@property(nonatomic,copy)NSString* allOrderPrice;



@end

@implementation OrderManagementDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"订单详情";
    
    _dataList = [NSMutableArray array];
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    backItem.title =@"返回";
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"n_back_arrow"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    //设置换行识别方式
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [button sizeToFit];
    [button addTarget:self action:@selector(pressleft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    _dataArray = [NSMutableArray array];
    _deliveryOrderArray = [NSMutableArray array];
    _PayAccoutArray = [NSMutableArray array];
    _logArray = [NSMutableArray array];
    _pickerInfoArray = [NSMutableArray array];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];
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
    
    //获取数据库数据
    if ([_orderStatus isEqualToString:@"1"] || [_orderStatus isEqualToString:@"2"]) {
        [self refreshingFMDB];
        
        
    }

}


-(void)requestData
{
    
    [_dataList removeAllObjects];
    OrderDBTool *noticeModelDBTool = [OrderDBTool shareInstance];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[noticeModelDBTool selectAllModel]];
    for (NSDictionary *dict in arr) {
        OrderDBModel *model = [[OrderDBModel alloc]init];
        model.noticeId = [dict valueForKey:@"noticeId"];
        model.orderDetailId = [dict valueForKey:@"orderDetailId"];
        model.buyNumber = [dict valueForKey:@"buyNumber"];
        model.buyPrice = [dict valueForKey:@"buyPrice"];
        model.unitNum = [dict valueForKey:@"unitNum"];
        model.goodsId = [dict valueForKey:@"goodsId"];
        model.stockNum = [dict valueForKey:@"stockNum"];
        model.lockNum = [dict valueForKey:@"lockNum"];
        model.goodsNuit = [dict valueForKey:@"goodsNuit"];
        model.packages = [dict valueForKey:@"packages"];
        model.genshu = [dict valueForKey:@"genshu"];
        model.houdu = [dict valueForKey:@"houdu"];
        model.kuandu = [dict valueForKey:@"kuandu"];
        model.changdu = [dict valueForKey:@"changdu"];
        model.shuzhong = [dict valueForKey:@"shuzhong"];
        model.pinpai = [dict valueForKey:@"pinpai"];
        model.dengji = [dict valueForKey:@"dengji"];
        model.isCus = [dict valueForKey:@"isCus"];
        model.cangku = [dict valueForKey:@"cangku"];
        model.categoryId = [dict valueForKey:@"categoryId"];
        
        [_dataList addObject:model];
    }
    
    [_tableView reloadData];
//    NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:2];
//    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
-(void)viewDidAppear:(BOOL)animated{
    //从详情页返回时刷新页面
    [self requestData];
}

-(void)pressleft
{
    OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
    [noticeDBTool dropTable];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc{
    
    OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
    [noticeDBTool dropTable];
}

//获取数据放数据库
-(void)refreshingFMDB
{
    
    OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
    [noticeDBTool dropTable];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:_orderId forKey:@"orderId"];
    [dict setObject:_categoryId forKey:@"categoryId"];
    
    __weak typeof(self)weakSelf = self;
    [_dataArray removeAllObjects];
    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (!error) {
            
            if (result.code == 0) {
                
                weakSelf.dataArray = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                
                OrderManageModel* model = weakSelf.dataArray[0];
                
                //存数据库
                if ([model.orderStatus isEqualToString:@"1"] || [model.orderStatus isEqualToString:@"2"]) {
                    OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
                    [noticeDBTool createTable];
                    for (OrderDetailModel* detailModel in model.orderDetailList) {
                        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
                        if (detailModel.packages == nil || [detailModel.packages isEqualToString:@""]){
                            [dict setObject:@"" forKey:@"packages"];
                            [dict setObject:detailModel.orderDetailId forKey:@"orderDetailId"];
                            [dict setObject:detailModel.buyNumber forKey:@"buyNumber"];
                            [dict setObject:detailModel.buyPrice forKey:@"buyPrice"];
                            [dict setObject:detailModel.unitNum forKey:@"unitNum"];
                            [dict setObject:detailModel.goodsId forKey:@"goodsId"];
                            [dict setObject:detailModel.stockNum forKey:@"stockNum"];
                            [dict setObject:detailModel.lockNum forKey:@"lockNum"];
                            [dict setObject:detailModel.goodsNuit forKey:@"goodsNuit"];
                            [dict setObject:@"NO" forKey:@"isCus"];
                            NSMutableDictionary* warestore = detailModel.warestoreList[0];
                            [dict setObject:[NSString stringWithFormat:@"%@ 地址：%@",warestore[@"name"],warestore[@"address"]] forKey:@"cangku"];
                            NSMutableDictionary* dict0 = detailModel.numAttributes[0];
                            //片数
                            [dict setObject:dict0[@"specValue"] forKey:@"genshu"];
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
                                if ([dict[@"attrName"] isEqualToString:@"口径"] || [dict[@"attrName"] isEqualToString:@"宽度"]) {
                                    [modelDict setObject:dict[@"attrValue"] forKey:@"koujin"];
                                }
                                if ([dict[@"attrName"] isEqualToString:@"厚度"]) {
                                    [modelDict setObject:dict[@"attrValue"] forKey:@"houdu"];
                                }
                            }
                            if (!modelDict[@"houdu"]) {
                                [dict setObject:@"" forKey:@"houdu"];

                            }else{
                                [dict setObject:modelDict[@"houdu"] forKey:@"houdu"];
                            }
                            [dict setObject:modelDict[@"koujin"] forKey:@"kuandu"];
                            [dict setObject:lengthAttributesList[0][@"specValue"] forKey:@"changdu"];
                            [dict setObject:modelDict[@"shuzhong"] forKey:@"shuzhong"];
                            [dict setObject:tableDic[@"brandName"] forKey:@"pinpai"];
                            [dict setObject:modelDict[@"dengji"] forKey:@"dengji"];
                            [dict setObject:_categoryId forKey:@"categoryId"];

                        }else
                        {
                        
//                            {"kuandu":"50","changdu":"90","pinpai":"adidas","dengji":"实木板材等级1","houdu":"30","cangku":"2仓库5","genshu":"88","shuzhong":"实木板材树种1","lifangshu":"6","packetNum":"22334455"}
                            
                            //自定义商品
                            NSMutableDictionary* cusDict = [detailModel.packages mj_JSONObject];
                            [dict setObject:@"" forKey:@"packages"];

                            [dict setObject:detailModel.orderDetailId forKey:@"orderDetailId"];
                            [dict setObject:detailModel.buyNumber forKey:@"buyNumber"];
                            [dict setObject:detailModel.buyPrice forKey:@"buyPrice"];
                            [dict setObject:cusDict[@"lifangshu"] forKey:@"unitNum"];
                            [dict setObject:@"0" forKey:@"goodsId"];
                            [dict setObject:@"0" forKey:@"stockNum"];
                            [dict setObject:@"0" forKey:@"lockNum"];
                            [dict setObject:@"m³" forKey:@"goodsNuit"];
                            [dict setObject:cusDict[@"houdu"] forKey:@"houdu"];
                            [dict setObject:cusDict[@"kuandu"] forKey:@"kuandu"];
                            [dict setObject:cusDict[@"changdu"] forKey:@"changdu"];
                            [dict setObject:cusDict[@"shuzhong"] forKey:@"shuzhong"];
                            [dict setObject:cusDict[@"pinpai"] forKey:@"pinpai"];
                            [dict setObject:cusDict[@"dengji"] forKey:@"dengji"];
                            [dict setObject:cusDict[@"genshu"] forKey:@"genshu"];
                            [dict setObject:@"NO" forKey:@"isCus"];
                            [dict setObject:cusDict[@"cangku"] forKey:@"cangku"];
                            [dict setObject:_categoryId forKey:@"categoryId"];

                        }
                        
                        OrderDBModel *noticeModel =[[OrderDBModel alloc]initWithDictionary:dict];
                        [noticeDBTool insertModel:noticeModel];
                    }
  
                    [weakSelf requestData];
                }
                
            }else
            {
                
            }
        }else
        {
            
        }
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
//    [self refreshing];
//    [self requestPayAccout];
//    [self requestLogInfo];
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
                    //取出第一条数据，隐藏他的上面的那条线
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
                
                if (!_moveModel) {
                    //默认一个付款账号
                    weakSelf.fiveRightBtnStr = [self returnBankCard:model.code];
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
                        //自定义商品
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
                
                OrderManageModel* model = _dataArray[0];
                //出货单总价
                weakSelf.allPrice = [NSString stringWithFormat:@"￥%@",model.realityPrice];
                //出货单总数量
                int allNum = [[numArray valueForKeyPath:@"@sum.intValue"] intValue];
                weakSelf.allNum = allNum;
                //出货单总立方数
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
    [dict setObject:_categoryId forKey:@"categoryId"];

    __weak typeof(self)weakSelf = self;
    [_dataArray removeAllObjects];
    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (!error) {
            
            if (result.code == 0) {

                weakSelf.dataArray = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                
                OrderManageModel* model = weakSelf.dataArray[0];
 
                NSMutableArray* array = (NSMutableArray *)model.actualMoney;
                NSMutableArray* priceArr = [NSMutableArray array];
                for (NSMutableDictionary* dict in array) {
                    [priceArr addObject:dict[@"actualMoney"]];
                }
                
                OrderManageModel* model0 = weakSelf.dataArray[0];
                NSLog(@"%@--%@",model0.totalPrice,model0.realityPrice);
                
                if ([model0.orderStatus isEqualToString:@"4"]) {
                    //orderstates为待装货时请求买家有没有添加提货信息
                    [weakSelf requestPickGoodsInformation:model0.orderId];
                }
                
                if ([model0.orderStatus isEqualToString:@"6"] || [model0.orderStatus isEqualToString:@"7"] || [model0.orderStatus isEqualToString:@"8"] || [model0.orderStatus isEqualToString:@"9"]|| [model0.orderStatus isEqualToString:@"10"]) {
                    //请求装货单
                    [weakSelf requestParkDetail:model0.orderId];
                }
                
                for (OrderDetailModel* model in model0.orderDetailList) {
                    //如果数据是自定义添加的商品，添加没有返回数据的字段
                    if (model.packages != nil && ![model.packages isEqualToString:@""]) {
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
                }else if ([model0.orderStatus isEqualToString:@"10"])
                {
                    _stateLable.text = @"交易成功";
                    
                    //计算有没有欠款，记录
                    OrderManageModel* model = weakSelf.dataArray[0];
                    NSMutableArray* array = (NSMutableArray *)model.actualMoney;
                    NSMutableArray* priceArr = [NSMutableArray array];
                    for (NSMutableDictionary* dict in array) {
                        [priceArr addObject:dict[@"actualMoney"]];
                    }
                    
                    [priceArr addObject:model.discountPrice];
                    CGFloat allPrice = [[priceArr valueForKeyPath:@"@sum.floatValue"] floatValue];
                    float num =  [model.realityPrice floatValue] - allPrice;
                    if (num>0) {
                        
                        model.ishaveArrears = @"1";//有欠款
                    }else
                    {
                        model.ishaveArrears = @"0";//没有欠款
                    }
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
                    weakSelf.fourStateStr = @"待装货";
                    [weakSelf.tableView reloadData];
                    weakSelf.stateLable.text = @"待装货";
                }
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
//            weakSelf.fourStateStr = @"待买家提货";
//            [weakSelf.tableView reloadData];
//            weakSelf.stateLable.text = @"待买家提货";
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
            if ([model.orderStatus isEqualToString:@"6"] ||[model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]|| [model.orderStatus isEqualToString:@"10"]) {
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
        if ([model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]|| [model.orderStatus isEqualToString:@"10"]) {
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
            
            if (_dataList.count) {
                return _dataList.count;
            }else
            {
            
            if (_dataArray.count) {
                OrderManageModel* model = _dataArray[0];
                return model.orderDetailList.count;
            }else
            {
                return 0;
            }
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
    if ([model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"]|| [model.orderStatus isEqualToString:@"9"] || [model.orderStatus isEqualToString:@"10"])
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
                }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] || [model.orderStatus isEqualToString:@"5"] || [model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"] ||[model.orderStatus isEqualToString:@"10"])
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
                    
                    
                }else if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"4"] ||[model.orderStatus isEqualToString:@"12"] ||[model.orderStatus isEqualToString:@"5"] ||[model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"] || [model.orderStatus isEqualToString:@"10"])
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
            return 70;
            
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
                    
                }else if ([model.orderStatus isEqualToString:@"8"] || ([model.orderStatus isEqualToString:@"10"] && [model.ishaveArrears isEqualToString:@"0"]))
                {
                    return 550;
                    
                }else if ([model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || ([model.orderStatus isEqualToString:@"10"] && [model.ishaveArrears isEqualToString:@"1"]))
                {
                    return 690;
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
            }else if([model.orderStatus isEqualToString:@"1"])
            {
                if (model.allowModification == 0) {
                    return 60;
                }else
                {
                    return 120;
                }
                
            }else if([model.orderStatus isEqualToString:@"2"])
            {
                if (model.allowModification == 0) {
                    return 60;
                }else
                {
                    return 120;
                }

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
            }else if([model.orderStatus isEqualToString:@"3"] ||[model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"])
            {
                return 590;
            }else if ([model.orderStatus isEqualToString:@"4"])
            {
                return 494;

            }else if ([model.orderStatus isEqualToString:@"6"])
            {
                return 640;
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
    if ([_cell1.actualTF.text floatValue] <=0) {
        [self showAlert:@"金额不能小于等于0"];
        _cell1.actualTF.text = @"";
    }
    
//    OrderManageModel* model = _dataArray[0];
//    if ([_cell1.actualTF.text floatValue] > [model.realityPrice floatValue]) {
//        [self showAlert:@"实际金额不能大于总金额"];
//        _cell1.actualTF.text = @"";
//    }
    
    if ([_cell1.youhuiTF.text floatValue]<0) {
        [self showAlert:@"金额不能小于0"];
        _cell1.actualTF.text = @"";
    }
    
    self.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    if (![_cell1.actualTF.text isEqualToString:@""]) {
        if ([_cell1.huiyouTwoTF.text isEqualToString:@""] || [_cell1.huiyouTwoTF.text isEqualToString:@"0"]) {

            OrderManageModel* model = _dataArray[0];
            NSMutableDictionary* dict = model.actualMoney[0];
            NSLog(@"++%@",dict[@"actualMoney"]);
            
            float priceNum;
            if ([model.payType isEqualToString:@"1"]) {
                priceNum = [model.realityPrice floatValue] - [dict[@"actualMoney"] floatValue];

            }else
            {
                priceNum = [model.realityPrice floatValue];

            }
            
            float num  = priceNum - [_cell1.actualTF.text floatValue];
                //没有优惠
            _cell1.daifuLable.text = [NSString stringWithFormat:@"%.2f",num];
            
        }else
        {
            OrderManageModel* model = _dataArray[0];
            NSMutableDictionary* dict = model.actualMoney[0];
            
            float priceNum;
            if ([model.payType isEqualToString:@"1"]) {
                
                priceNum = [model.realityPrice floatValue] - [dict[@"actualMoney"] floatValue];
            }else
            {
                priceNum = [model.realityPrice floatValue];

            }
            
         
            float num  = priceNum - [_cell1.actualTF.text floatValue] - [_cell1.huiyouTwoTF.text floatValue];

            _cell1.daifuLable.text = [NSString stringWithFormat:@"%.2f",num];
        }
    }else
    {
        OrderManageModel* model = _dataArray[0];
        NSMutableDictionary* dict = model.actualMoney[0];
        
        float priceNum;
        if ([model.payType isEqualToString:@"1"]) {
            priceNum = [model.realityPrice floatValue] - [dict[@"actualMoney"] floatValue];

        }else
        {
            priceNum = [model.realityPrice floatValue];
        }
        
        //计算待付金额
        float daifuPrice = priceNum - [model.discountPrice floatValue];
            //待付金额
        _cell1.daifuLable.text = [NSString stringWithFormat:@"￥%.2f",daifuPrice];
        
    }
 
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}

-(void)lookAction:(NSString *)str btn:(UIButton *)btn
{
    
    if ([btn.titleLabel.text isEqualToString:@"查看合同"]) {
        
    }else if([btn.titleLabel.text isEqualToString:@"修改装货单"])
    {
        AddLoadingDetails* VC = [AddLoadingDetails new];
        OrderManageModel* model = _dataArray[0];
        VC.orderIdTrue = model.orderId;
        VC.sectionNum = _sectionNum;
        //订单编号
        VC.orderId = _orderId;
        VC.categoryId = _categoryId;
        [self.navigationController pushViewController:VC animated:YES];
    }

}

//添加装货明细||确认到款
-(void)addLoadingDetail:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"确认到款"]) {

        OrderManageModel* model = _dataArray[0];
        if ([model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"10"]) {
            if ([_cell1.actualTF.text isEqualToString:@""] || [_cell1.actualTF.text isEqualToString:@"0"]) {
                [self showAlert:@"请输入金额"];
                return;
            }
            
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            //付款id 第一条数据
            NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* actualDict;
            if ([model.payType isEqualToString:@"2"] || [model.payType isEqualToString:@"3"]) {
                actualDict = arr[0];

            }else
            {
                actualDict = arr[1];
            }
            [dict setObject:actualDict[@"id"] forKey:@"orderPaymentId"];
            [dict setObject:model.orderId forKey:@"orderId"];
            AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
            [dict setObject:userInfo.userId forKey:@"userId"];
            //实际到账金额
            [dict setObject:_cell1.actualTF.text forKey:@"actualMoney"];
            //优惠金额
            if ([_cell1.huiyouTwoTF.text isEqualToString:@"0"]||[_cell1.huiyouTwoTF.text isEqualToString:@""]) {
                [dict setObject:@"0" forKey:@"discountPrice"];
            }else{
                [dict setObject:_cell1.huiyouTwoTF.text forKey:@"discountPrice"];
            }
            
            if ([model.orderStatus isEqualToString:@"10"]) {
                [dict setObject:model.orderStatus forKey:@"orderStatus"];
            }else{
                int num = [model.orderStatus intValue] + 1;
                [dict setObject:[NSString stringWithFormat:@"%d",num] forKey:@"orderStatus"];
            }
            
      
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
            //付款id 第二条数据
            OrderManageModel* model = _dataArray[0];
            NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
            NSMutableDictionary* actualDict = arr[0];
            [dict setObject:actualDict[@"id"] forKey:@"orderPaymentId"];
            [dict setObject:model.orderId forKey:@"orderId"];
            AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
            [dict setObject:userInfo.userId forKey:@"userId"];
            //实际到账金额
            [dict setObject:_cell1.actualTF.text forKey:@"actualMoney"];
            int num = [model.orderStatus intValue] + 1;
            [dict setObject:[NSString stringWithFormat:@"%d",num] forKey:@"orderStatus"];
            [dict setObject:model.buyerId forKey:@"buyerId"];
            
            if ([_cell1.youhuiTF.text isEqualToString:@"0"]||[_cell1.youhuiTF.text isEqualToString:@""]) {
                [dict setObject:@"0" forKey:@"discountPrice"];
            }else{
                [dict setObject:_cell1.youhuiTF.text forKey:@"discountPrice"];
            }
            
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
        VC.orderIdTrue = model.orderId;
        VC.sectionNum = _sectionNum;
        //订单编号
        VC.orderId = _orderId;
        VC.categoryId = _categoryId;
        [self.navigationController pushViewController:VC animated:YES];
    }
}


-(void)shenheOrder:(UIButton *)btn
{
    //发货
    OrderManageModel* model1 = _dataArray[0];
    if ([btn.titleLabel.text isEqualToString:@"确认发货"]) {
        
        SWGOrderPackControllerApi* orderParkApi = [[SWGOrderPackControllerApi alloc] init];
        NSMutableArray* array = [NSMutableArray array];
        AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
        for (NSMutableDictionary* dict in _deliveryOrderArray) {
            SWGComeStockBean* stockBean = [[SWGComeStockBean alloc] init];

            stockBean.buyNumber = dict[@"buyNumber"];
            stockBean.categoryId = [NSNumber numberWithInt:[_categoryId intValue]];
            stockBean.goodsId = dict[@"goodsId"];
            stockBean.orderId = [NSNumber numberWithInt:[model1.orderId intValue]];
            stockBean.userId = [NSNumber numberWithInt:[userInfo.userId intValue]];
            if ([_categoryId isEqualToString:@"2"]) {
                if ([dict[@"goodsId"]  intValue] == 0) {
                    NSMutableDictionary* datadict = [dict[@"packages"] mj_JSONObject];

                    stockBean.packages = datadict[@"packages"];
                }else
                {
                    stockBean.packages = dict[@"packages"];
                }
                
            }
            //板材添加包号
            [array addObject:stockBean];
        }
    
        _stockBeanArray = array;
        __weak typeof(self)weakSelf = self;

        [orderParkApi comeStockUsingPOSTWithAuthorization:@"Q" bean:_stockBeanArray completionHandler:^(SWGMessageResult *output, NSError *error) {
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
        //用户自己选择
        [dict setObject:_moveModel.accountId forKey:@"paymentAccountId"];
    }else
    {
        //用户没有选择默认一个
        MoveGroupingModel* model0 = _PayAccoutArray[0];
        [dict setObject:model0.accountId forKey:@"paymentAccountId"];
    }
        
    //model1.totalPrice
    [dict setObject:_allOrderPrice forKey:@"prepayPrice"];
    [dict setObject:model1.buyerId forKey:@"buyerId"];
    [dict setObject:model1.orderId forKey:@"orderId"];
    [dict setObject:@(_payType) forKey:@"payType"];
    [dict setObject:@(_invoiceType) forKey:@"invoiceType"];
    [dict setObject:@(1) forKey:@"collectType"];
    [dict setObject:_orderStatus forKey:@"orderStatus"];
    NSMutableArray* priceArray  = [NSMutableArray array];

    for (OrderDBModel* model in _dataList) {
        NSMutableDictionary* dataDict = [NSMutableDictionary dictionary];
        
        if (![model.goodsId isEqualToString:@""]) {
            [dataDict setObject:model.goodsId forKey:@"goodsId"];
        }
        
        if (![model.orderDetailId isEqualToString:@""]) {
            [dataDict setObject:model.orderDetailId forKey:@"id"];
        }
    
        [dataDict setObject:model1.orderId forKey:@"orderId"];
        [dataDict setObject:model.buyNumber forKey:@"buyNumber"];
        [dataDict setObject:model.buyPrice forKey:@"buyPrice"];
        [dataDict setObject:model.unitNum forKey:@"cubicNumber"];
        [dataDict setObject:@"1" forKey:@"status"];

        if ([model.isCus isEqualToString:@"YES"]) {
            //自定义
            [dataDict setObject:model.packages forKey:@"packages"];
            
        }else
        {
            
        }
        
        
        NSString*string =model.cangku;
        
        NSArray *array = [string componentsSeparatedByString:@" "]; //从字符d中分隔成2个元素的数组
        
        NSLog(@"array:%@",array); //结果是abc和efg
        [dataDict setObject:array[0] forKey:@"warehouseName"];
        [dataDict setObject:_orderId forKey:@"orderSn"];
        
        [priceArray addObject:dataDict];
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
        
        totalPrice = _allOrderPrice;
    }
    NSNumber *paymentAccountId = [NSNumber numberWithInt:[dict[@"paymentAccountId"] intValue]];
    NSNumber *buyerId = [NSNumber numberWithInt:[model1.buyerId intValue]];
    __weak typeof(self)weakSelf = self;
    
    [apiInstance updateOrderInfoUsingPOSTWithAuthorization:@"Q" orderId:orderId userId:userId orderStatus:_orderStatus payType:payType prepayPrice:totalPrice invoiceType:invoiceType collectType:collectType paymentAccountId:paymentAccountId buyerId:buyerId orderDetailList:_orderDetailList tailMoney:nil completionHandler:^(SWGMessageResult *output, NSError *error) {
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
    VC.categoryId = _categoryId;
    OrderManageModel* model = _dataArray[0];
    VC.orderId = model.orderId;
    [self.navigationController pushViewController:VC animated:YES];
    
}

//添加自定义商品
-(void)addCustomgoods:(NSString *)categoryId
{
    AddCustomGoodsVC* VC  =[AddCustomGoodsVC new];
    VC.categoryId = _categoryId;
    OrderManageModel* model = _dataArray[0];
    VC.orderId = model.orderId;
    [self.navigationController pushViewController:VC animated:YES];
}


//确定删除按钮
-(void)sureDelete:(NSString *)orderID noticeId:(NSString *)noticeId
{
    __weak typeof(self)weakSelf = self;
    //如果是最后一个详情订单取消整个订单
    if (_dataList.count == 1) {
        
        NSLog(@"%@",@"00-");
        
        OrderManageModel* model  = _dataArray[0];
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        //订单ID
        [dict setObject:model.orderId forKey:@"orderId"];
        AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
        [dict setObject:userInfo.storeId forKey:@"storeId"];
        __weak typeof(self)weakSelf = self;

        [[WebClient sharedClient]orderCancelOrder:dict complete:^(ResponseMode *result, NSError *error) {
            
            [weakSelf.photoView.backgroupView removeFromSuperview];
            [weakSelf.photoView removeFromSuperview];
            
            if (!error) {
                if (result.code == 0) {
                    
                    [weakSelf showAlert:@"订单已取消"];
                    [weakSelf refreshing];
                }
            }
        }];
        
    }else{
        
        
        if (![orderID isEqualToString:@""] && orderID != nil) {
            //删除一个详细订单
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            //orderDetailId详细订单ID
            [dict setObject:orderID forKey:@"id"];
            [dict setObject:_orderStatus forKey:@"orderStatus"];
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
            
            OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
            [noticeDBTool deleteModelWithkey:@"Id" value:noticeId];
            [self requestData];
            
        }else
        {
            OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
            [noticeDBTool deleteModelWithkey:@"Id" value:noticeId];
            [self requestData];
            [self.photoView.backgroupView removeFromSuperview];
            [self.photoView removeFromSuperview];
        }
    }
}

//修改
-(void)sureAction:(NSMutableDictionary *)dict
{

    OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
    [noticeDBTool createTable];
    [noticeDBTool updateModelWithkey:@"nbuyNumber" value:dict[@"buyNumber"] nId:dict[@"noticeId"]];
    [noticeDBTool updateModelWithkey:@"nbuyPrice" value:dict[@"buyPrice"] nId:dict[@"noticeId"]];
    [self requestData];
    
    [self.addView removeFromSuperview];
    [self.addView.backgroupView removeFromSuperview];
    
//    OrderManageModel* model = _dataArray[0];
//    _modedic = dict;
//    [_modedic setObject:model.orderId forKey:@"orderId"];
//
//    //计算总价
//    CGFloat num;
//    NSMutableArray* priceArray = [NSMutableArray array];
//    for (OrderDetailModel* mdoel0 in model.orderDetailList) {
//
//        if (!mdoel0.goodsId) {
//            //自定义商品  数量*价格*立方数
//            NSMutableDictionary* cusDict = [mdoel0.packages mj_JSONObject];
//            num = [cusDict[@"lifangshu"] floatValue] * [mdoel0.buyNumber floatValue] * [mdoel0.buyPrice floatValue];
//        }else
//        {
//            //库存商品 数量*价格*立方数
//            num = [mdoel0.buyNumber floatValue]*[mdoel0.buyPrice floatValue]*[mdoel0.unitNum floatValue];
//        }
//
//        if (mdoel0.orderDetailId == dict[@"orderDetailId"]) {
//
//        }else
//        {
//            //没有修改的详单放进数组
//            [priceArray addObject:[NSString stringWithFormat:@"%f",num]];
//        }
//    }
//
//    //没有修改的详单总价
//    CGFloat sum = [[priceArray valueForKeyPath:@"@sum.floatValue"] floatValue];
//    //当前修改的详单
//    CGFloat nowNum = [dict[@"buyNumber"] floatValue]*[dict[@"buyPrice"] floatValue]*[dict[@"cubicNumber"] floatValue];
//    CGFloat allPrice = sum+nowNum;
//    NSString* allStr = [NSString stringWithFormat:@"%.2f",allPrice];
//    [_modedic setObject:allStr forKey:@"totalPrice"];
//    [self requestChangeNumAndPrice:_modedic];
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
-(void)deleteAction:(NSString *)orderID noticeId:(NSString *)noticeId
{
    DeleteView *photoView = [DeleteView addDeleteVView];
    photoView.delegate = self;
    photoView.orderID = orderID;
    photoView.noticeId = noticeId;
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
        if ([model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]|| [model.orderStatus isEqualToString:@"10"])
        {
            //添加出货单明细cell
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
                    cell1.categoryId = _categoryId;
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
                
                fiveCell.priceLable.text = [NSString stringWithFormat:@"￥%@",model.realityPrice];
                
                //判断是不是整数  不是整数保留三位小数
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
                cell1.huiyouTwoTF.delegate = self;
                
                //如果没有切换付款方式默认第一个付款方式
                if (!_moveModel) {
                    if ([model.orderStatus isEqualToString:@"1"]) {
                        
                        [cell1.fiveRightBtn setTitle:self.fiveRightBtnStr forState:UIControlStateNormal];
                    }
                }
           
                if ([model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || ([model.orderStatus isEqualToString:@"10"] && [model.ishaveArrears isEqualToString:@"1"])) {
                    //计算需要支付的尾款
                    float yifuPrice;
                    
                    NSMutableDictionary* dict = model.actualMoney[0];
                    if ([model.payType isEqualToString:@"1"]) {
                        NSLog(@"--%@",dict[@"actualMoney"]);
                        cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",dict[@"actualMoney"]];
                        yifuPrice = [dict[@"actualMoney"] floatValue];
                  
                    }else{
                    
                        cell1.threeLable.text = @"￥0";
                        yifuPrice = 0;
                    }
                    
                    OrderManageModel* model = _dataArray[0];
                    float priceNum = [model.realityPrice floatValue] - yifuPrice;
                    cell1.weiKuanLable.text = [NSString stringWithFormat:@"￥%.2f",priceNum];
                    
                    if (model.discountPrice) {
                        cell1.huiyouTwoTF.text = model.discountPrice;
                    }
                    
                    //计算待付金额
                    float daifuPrice;
                    if (model.discountPrice) {
                        
                        daifuPrice = priceNum - [model.discountPrice floatValue];

                    }else
                    {
                        daifuPrice = priceNum;
                    }
                    
                    if ([cell1.actualTF.text isEqualToString:@""]) {
                         //待付金额
                        cell1.daifuLable.text = [NSString stringWithFormat:@"￥%.2f",daifuPrice];
                    }
                }
                
                if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"2"] || [model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]|| [model.orderStatus isEqualToString:@"10"]) {
                    
                
                    NSMutableDictionary* dict = model.actualMoney[0];
                    //根据支付账户id取到账户账号
                    for (MoveGroupingModel*model0 in _PayAccoutArray) {
                        
                        if ([dict[@"paymentAccountId"] intValue] == [model0.accountId intValue]) {
                            NSString* str = [self returnBankCard:model0.code];
                            [cell1.fiveRightBtn setTitle:str forState:UIControlStateNormal];
                            
                        }
                    }
                }
                cell1.model = model;

                return cell1;
            }
            
        }else
        {
            //没有出货单明细cell
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
                cell1.delegate = self;
                cell1.manegeModel = model;
                if ([model.orderStatus isEqualToString:@"2"] || [model.orderStatus isEqualToString:@"1"]) {

                    if (_dataList.count) {
                        cell1.DBModel = _dataList[indexPath.row];
                    }
                }else
                {
                    cell1.model = model.orderDetailList[indexPath.row];

                }
        
                return cell1;
            }else if(indexPath.section == 3)
            {
                NSString *identifier1 = @"AddGoodCell";
                AddGoodCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                cell1.delegate = self;
                
                if ([_orderStatus isEqualToString:@"1"] || [_orderStatus isEqualToString:@"2"]) {
                    if (_dataList.count) {
                        
                        //计算总价
                        NSMutableArray* numArray = [NSMutableArray array];
                        NSMutableArray* unitArray = [NSMutableArray array];
                        NSMutableArray* priceArray = [NSMutableArray array];

                        
                        for (OrderDBModel* model0 in _dataList) {
                            [numArray addObject:model0.buyNumber];
                            
                            float num = [model0.unitNum floatValue] * [model0.buyNumber floatValue];
                            [unitArray addObject:@(num)];
                            
                            float allPrice = [model0.unitNum floatValue] * [model0.buyNumber floatValue] * [model0.buyPrice floatValue];
                            [priceArray addObject:@(allPrice)];
                        }
                        
                        OrderDetailModel* detailModel = model.orderDetailList[0];
                        int sum = [[numArray valueForKeyPath:@"@sum.intValue"] intValue];
                        float unit = [[unitArray valueForKeyPath:@"@sum.floatValue"] floatValue];
                        float price = [[priceArray valueForKeyPath:@"@sum.floatValue"] floatValue];
                        
                        if ((int)price != price) {
                            
                            cell1.allPriceLable.text = [NSString stringWithFormat:@"￥%.2f",price];
                            _allOrderPrice = [NSString stringWithFormat:@"%.2f",price];
                        }else
                        {
                            cell1.allPriceLable.text = [NSString stringWithFormat:@"￥%d",(int)price];
                            _allOrderPrice = [NSString stringWithFormat:@"%d",(int)price];

                        }
                        
                        if ((int)unit != unit) {
                            cell1.numLable.text = [NSString stringWithFormat:@"共%d件 %.3f%@",sum,unit,detailModel.goodsNuit];
                        }else
                        {
                            cell1.numLable.text = [NSString stringWithFormat:@"共%d件 %d%@",sum,(int)unit,detailModel.goodsNuit];
                        }
                    }
                    if (model.allowModification == 0) {
                        
                        cell1.addBtn.hidden = YES;
                        cell1.customBtn.hidden = YES;

                        cell1.meddleView.hidden = YES;

                    }else
                    {
                        cell1.addBtn.hidden = NO;
                        cell1.customBtn.hidden = NO;
                        cell1.meddleView.hidden = NO;

                    }
                    
                }else{
                    if (_dataArray.count) {
                        OrderManageModel* model = _dataArray[0];
                        cell1.categoryId = _categoryId;
                        cell1.model = model;
                    }
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
                        if ([_fourStateStr isEqualToString:@"待装货"]) {
                            
                            cell1.addLoadingDetails.userInteractionEnabled = YES;
                            cell1.addLoadingDetails.backgroundColor = MINE_Color;
                           
                            if (_pickerInfoArray.count) {
                                cell1.pickerDict = _pickerInfoArray[0];
                            }
                            
                        }else if([_fourStateStr isEqualToString:@"待买家提货"])
                        {
                            [cell1.oneRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
                            [cell1.twoRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
                            [cell1.fourRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
                            cell1.threenameLable.text = @"未确认";
                            [cell1.fiveRightBtn setTitle:@"未确认" forState:UIControlStateNormal];
                            cell1.addLoadingDetails.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
                            cell1.addLoadingDetails.userInteractionEnabled = NO;
                        }
                    }
                    if (!_moveModel) {
                        //状态等于1时，默认一个收款账号
                        if ([model.orderStatus isEqualToString:@"1"]) {
                            
                            [cell1.fiveRightBtn setTitle:self.fiveRightBtnStr forState:UIControlStateNormal];
                        }
                    }
                 
  
                    if ([model.orderStatus isEqualToString:@"3"] || [model.orderStatus isEqualToString:@"2"] || [model.orderStatus isEqualToString:@"6"] || [model.orderStatus isEqualToString:@"7"] || [model.orderStatus isEqualToString:@"8"] || [model.orderStatus isEqualToString:@"9"]) {
                        NSMutableDictionary* dict = model.actualMoney[0];
                        //根据支付账户id取到账户账号
                        for (MoveGroupingModel*model0 in _PayAccoutArray) {
                            
                            if ([dict[@"paymentAccountId"] intValue] == [model0.accountId intValue]) {
                                NSString* str = [self returnBankCard:model0.code];
                                [cell1.fiveRightBtn setTitle:str forState:UIControlStateNormal];
                                
                            }
                        }
                    }
                    cell1.model = model;
                    
                    if (_allOrderPrice) {
                        if ([model.payType isEqualToString:@"2"] || [model.payType isEqualToString:@"3"]) {
                            cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",_allOrderPrice];
                        }
                    }
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
        
    }else if ([btn.titleLabel.text isEqualToString:@"此次付款金额"])
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
//        OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
        
        if ([model.orderStatus intValue] == 1 || [model.orderStatus intValue] == 2) {
            AddOrderView *addView = [AddOrderView addSureView];
//            addView.detailModel = detailModel;
//
//            //如果是库存商品传长度
//            if (!detailModel.packages) {
//                NSMutableArray* lengthAttributesList = (NSMutableArray *)detailModel.lengthAttributesList;
//                addView.dict = lengthAttributesList[0];
//            }
            
            if (model.allowModification == 0) {
                addView.jianBtn.userInteractionEnabled = NO;
                addView.jiaAction.userInteractionEnabled = NO;
            }
            
            OrderDBModel* DBmodel = _dataList[indexPath.row];
            addView.DBmodel = DBmodel;

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
            
            if (_allOrderPrice) {
                _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",_allOrderPrice];
                
            }


        }else if (numm == 2)
        {
            _cell1.threeBtn.userInteractionEnabled = NO;

            _payType = 3;
            OrderManageModel* model = _dataArray[0];
            
            _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];

            if (_allOrderPrice) {
                _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",_allOrderPrice];

            }

            
        }
    }else if ([_num isEqualToString:@"3"])
    {
        _cell1.threeLable.text = [NSString stringWithFormat:@"￥%@",text];
        
     
    }
}

-(void)imgAction:(UIImageView *)imgUrl
{
    [ZWHScanImage scanBigImageWithImageView:imgUrl];

}

@end

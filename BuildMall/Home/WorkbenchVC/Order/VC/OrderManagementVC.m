//
//  OrderManagementVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderManagementVC.h"
#import "CBHeaderChooseViewScrollView.h"
#import "OrderManagemenCell.h"
#import "OrderHeaderView.h"
#import "OrderFooterView.h"
#import "OrderManagementDetailVC.h"
#import "MoveGroupingVC.h"
#import "OrderManageModel.h"
#import "OrderDetailModel.h"
#import "DeleteView.h"

@interface OrderManagementVC ()<UITableViewDelegate,UITableViewDataSource,OrderFooterViewDelegate,OrderHeaderViewDelegate,DeleteViewDelegate>

@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)OrderHeaderView *headView;

@property(nonatomic,strong)OrderFooterView *footView;

@property (nonatomic, assign) NSInteger pageNum;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)DeleteView* deleteView;
@property(nonatomic,assign)NSInteger numState;

@property(nonatomic,assign)NSInteger senctionNum;


@property(nonatomic,strong)OrderManageModel* addModel;;

@end

@implementation OrderManagementVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataArray = [NSMutableArray array];
    
    self.navigationItem.title = @"我的订单";
    
    [self creatView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, screenW, screenH-64-40) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    [self.view addSubview:self.tableView];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    [_tableView registerNib:[UINib nibWithNibName:@"OrderManagemenCell" bundle:nil] forCellReuseIdentifier:@"OrderManagemenCell"];
    _tableView.tableFooterView = [UIView new];
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];

    [button0 setImage:[UIImage imageNamed:@"new"] forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(rightTwo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *switcher0 = [[UIBarButtonItem alloc] initWithCustomView:button0];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"new"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightOne) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *switcher = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItems = @[switcher0,switcher];
   
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshing)];
    header.stateLabel.font = [UIFont systemFontOfSize:14];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    self.tableView.mj_header = header;
        //设置尾部加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shipinMoreNetWork)];
        //    footer.automaticallyHidden = YES;
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    self.tableView.mj_footer = footer;
    
    [self refreshing];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteOrderAction:) name:@"deleteOrder" object:nil];
}

//取消订单
-(void)deleteOrderAction:(NSNotification *)text
{
    NSLog(@"%@",text.userInfo[@"Idd"]);
   
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:text.userInfo[@"Idd"] forKey:@"id"];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.userId forKey:@"operatorId"];
    [dict setObject:@"12" forKey:@"orderStatus"];
    
    __weak typeof(self)weakSelf = self;
    
    
    [[WebClient sharedClient]orderCancelOrder:dict complete:^(ResponseMode *result, NSError *error) {

        if (!error) {
            if (result.code == 0) {

                [weakSelf showAlert:@"订单已取消"];
                [weakSelf refreshing];
            }
        }
    }];
    NSLog(@"－－－－－接收到通知------");
}


-(void)refreshing
{
    _pageNum = 0;
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:userInfo.userId forKey:@"userId"];
    [dict setObject:@(_pageNum) forKey:@"pageNum"];
    if (_numState != 0) {
        [dict setObject:@(_numState) forKey:@"orderStatus"];

    }

    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    
    __weak typeof(self)weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [_dataArray removeAllObjects];

    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:NO];

        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        
        if (!error) {
            if (result.code == 0) {
                
                weakSelf.dataArray = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                
                [weakSelf.tableView reloadData];
                
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

-(void)shipinMoreNetWork
{
    _pageNum +=1;
    [self reloadData:_pageNum];
    
}

-(void)reloadData:(NSInteger)page
{
    
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_footer resetNoMoreData];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:userInfo.userId forKey:@"userId"];

    [dict setObject:@(page) forKey:@"pageNum"];
    __weak typeof(self)weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:NO];
        if (!error) {
            if (result.code == 0) {
                
                NSMutableArray* modelArr = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                
                if (modelArr.count==0) {
                    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                    
                    return;
                }
                [weakSelf.dataArray addObjectsFromArray:modelArr];
                [weakSelf.tableView reloadData];
            }else
            {
                
            }
        }else
        {
        }
        
    }];
    
}

-(void)rightOne
{

}

-(void)sureDelete:(NSString *)orderID noticeId:(NSString *)noticeId
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:orderID forKey:@"orderId"];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:@"12" forKey:@"orderStatus"];

    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient]orderCancelOrder:dict complete:^(ResponseMode *result, NSError *error) {

        [weakSelf.deleteView removeFromSuperview];
        [weakSelf.deleteView.backgroupView removeFromSuperview];

        if (!error) {
            if (result.code == 0) {

                [weakSelf showAlert:@"订单已取消"];
                [weakSelf refreshing];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因==:%@",str);
        }
    }];
    
}


-(void)deleteAction:(NSString *)orderID
{
    _deleteView = [DeleteView addDeleteVView];
    _deleteView.delegate = self;
    _deleteView.orderID = orderID;
    _deleteView.topLable.text = @"确认取消";
    [_deleteView show];

    NSLog(@"%@",orderID);
}

-(void)goStoreAction:(NSString *)orderID
{
     NSLog(@"%@",orderID);
}

-(void)rightTwo
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderManageModel* model = _dataArray[indexPath.section];
    OrderManagementDetailVC* VC = [OrderManagementDetailVC new];
    VC.orderId = model.orderSn;
    VC.orderIdTwo = model.orderId;
    VC.orderStatus = model.orderStatus;
    OrderDetailModel* model0 = model.orderDetailList[0];
    VC.categoryId = model0.categoryId;
    VC.sectionNum = indexPath.section;
    VC.slectBlock = ^(NSInteger senctionNum, NSString * _Nonnull orderId) {
        
        _senctionNum = senctionNum;
        [self refreshingNowOneSection:orderId];
    };
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)refreshingNowOneSection:(NSString *)orderId;
{
    //只请求这一条数据
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    [dict setObject:userInfo.userId forKey:@"userId"];
    [dict setObject:orderId forKey:@"orderId"];

    
    __weak typeof(self)weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebClient sharedClient]myOrder:dict complete:^(ResponseMode *result, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:NO];
        
        NSMutableArray* array = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
        
        OrderManageModel* model = array[0];
        weakSelf.addModel = model;
        //替换当前被操作的数据到原数组中,只刷新这一条数据
        [weakSelf.dataArray replaceObjectAtIndex:_senctionNum withObject:weakSelf.addModel];
        [weakSelf.tableView reloadData];
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _headView = [[OrderHeaderView alloc]init];

    _headView.delegate  = self;
    _headView.frame = CGRectMake(0, 0, screenW, 100);
    
    OrderManageModel* model = _dataArray[section];
    _headView.model = model;
    
    return _headView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    _footView = [[OrderFooterView alloc]init];

    _footView.delegate  =self;
    _footView.frame = CGRectMake(0, 0, screenW, 90);
    if (_dataArray.count) {
        OrderManageModel* model = _dataArray[section];
        
        _footView.model = model;
    }
    return _footView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    OrderManageModel* model = _dataArray[section];
    return model.orderDetailList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"OrderManagemenCell";
    OrderManagemenCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
 
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    OrderManageModel* model = _dataArray[indexPath.section];
    OrderDetailModel* detailModel = model.orderDetailList[indexPath.row];
    cell1.model = detailModel;
    
    return cell1;
}

-(void)creatView
{

    NSArray* arr = @[@"全部",@"待审核",@"待付款",@"待收款",@"待装货",@"待装货确认",@"待结算",@"待确认结算",@"待发货",@"待收货"];
    CBHeaderChooseViewScrollView*headerView=[[CBHeaderChooseViewScrollView alloc]initWithFrame:CGRectMake(0, 0, screenW, 40)];
    
    [self.view addSubview:headerView];
    
    [headerView setUpTitleArray:arr titleColor:nil titleSelectedColor:nil titleFontSize:16];
    
    headerView.btnChooseClickReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
        _numState = x;
        [self refreshing];
    };
}


@end

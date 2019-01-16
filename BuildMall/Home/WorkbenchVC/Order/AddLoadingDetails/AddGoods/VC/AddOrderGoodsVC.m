//
//  AddOrderGoodsVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddOrderGoodsVC.h"
#import "AddOrderGoodsCell.h"
#import "InventoryQueryVC.h"
#import "AddTopScrollView.h"
#import "AddOrderView.h"
#import "SWGGoodsControllerApi.h"
#import "SWGScreenGoods.h"
#import "SWGMessageResult.h"

#import "SWGAttributeBean.h"
#import "GoodsBeansListModel.h"
#import "SWGOrderDetailControllerApi.h"
#import "SWGOrderDetailBean.h"
#import "SearchAddGoodVC.h"
#import "BasicNavigationController.h"
#import "SWGOrderPackControllerApi.h"
#import "SWGOrderAbroadPackBean.h"


@interface AddOrderGoodsVC ()<UITableViewDelegate,UITableViewDataSource,AddOrderViewDelegate>


@property(nonatomic,strong)UITableView* tableView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *storeBtn;

@property(nonatomic,strong) UIView* backView;

@property(nonatomic,strong)UITableView* smallTableView;
@property(nonatomic,strong)NSMutableArray* storeArray;
@property (weak, nonatomic) IBOutlet UIView *threeView;

@property(nonatomic,strong)NSMutableArray* chooseArray;

@property(nonatomic) NSArray<SWGAttributeBean>* attributeList;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)NSMutableArray* zhaungHuoDataArray;


@property(nonatomic,strong)NSMutableArray* lenthArray;

@property(nonatomic,strong)NSMutableArray* zhaungHuolenthArray;


@property(nonatomic,strong)AddOrderView* addView;

@property(nonatomic,strong)NSMutableArray* selectArray;

@property(nonatomic,assign)BOOL isConditionsSearch;

@property(nonatomic,strong)AddTopScrollView*headerView;

@property (nonatomic, assign) NSInteger pageNum;

@property (nonatomic, copy)NSString* searStr;

@property(nonatomic) NSArray<SWGOrderAbroadPackBean>* parkBeanList;

@property(nonatomic,strong)NSMutableArray* detailsBeanList;

@property(nonatomic,strong)NSMutableArray* piecesNumList;


@end

@implementation AddOrderGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"添加商品";
    
    _selectArray = [NSMutableArray array];
    _dataArray = [NSMutableArray array];
    _zhaungHuoDataArray = [NSMutableArray array];
    _zhaungHuolenthArray = [NSMutableArray array];
    _lenthArray = [NSMutableArray array];
    _piecesNumList = [NSMutableArray array];
    
    _cancelBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.masksToBounds =YES;
    _cancelBtn.layer.borderWidth = 1;
    
    _addBtn.layer.cornerRadius = 5;
    _addBtn.layer.masksToBounds =YES;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 71, screenW, screenH-64-71) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 90;
    [_tableView registerNib:[UINib nibWithNibName:@"AddOrderGoodsCell" bundle:nil] forCellReuseIdentifier:@"AddOrderGoodsCell"];
    
    [self creatRightView];
    
    NSArray* array = @[@"太仓龙达库",@"SPF",@"MM",@"2级",@"H:38",@"m:235",@"L:2440",@"SPF",@"MM",@"2级",@"H:38"];
//    _chooseArray = [NSMutableArray arrayWithArray:array];
    
    [self UpdateView];
    _headerView.hidden = YES;
    
}

//库存查询的横向滑动View
-(void)UpdateView
{
    
    NSMutableArray* dataArr = [NSMutableArray array];

    if (_isConditionsSearch == YES) {
        for (NSMutableDictionary* dict in _chooseArray) {
            
            [dataArr addObject:dict[@"attrValue"]];
            
        }
    }
    _headerView=[[AddTopScrollView alloc]initWithFrame:CGRectMake(0, 0, screenW-50, 30)];
    
    [_threeView addSubview:_headerView];
    
    [_headerView setUpTitleArray:dataArr titleColor:nil titleSelectedColor:nil titleFontSize:12];

    _headerView.btnChooseClickReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
    };
}

- (IBAction)topCancel:(id)sender {

    [_headerView removeFromSuperview];
    _tableView.frame = CGRectMake(0, 71, screenW, screenH-64-71);
    _isConditionsSearch = NO;
    [_selectArray removeAllObjects];
    [_chooseArray removeAllObjects];
    if (_isZhuanghuo == YES) {
        [self refreshingZhuanghuo];
    }else
    {
    
        [self refreshing];
    }
}

-(void)creatRightView
{
    
    UIView* backView = [UIView new];
    _backView = backView;
    backView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(41);
        make.height.equalTo(@(200));
    }];
    
    _smallTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, 200) style:UITableViewStylePlain];
    [backView addSubview:_smallTableView];
    _smallTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    _smallTableView.delegate = self;
    _smallTableView.dataSource = self;
    _smallTableView.rowHeight = 50;
   [_smallTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    NSArray* array = @[@"仓库1",@"仓库1",@"仓库1",@"仓库1",@"仓库1",@"仓库1",@"仓库1",@"仓库1"];
    _storeArray = [NSMutableArray arrayWithArray:array];
    
    backView.hidden = YES;
    

    //设置尾部加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shipinMoreNetWork)];
    //    footer.automaticallyHidden = YES;
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    self.tableView.mj_footer = footer;
    
    if (_isZhuanghuo == YES) {
        [self refreshingZhuanghuo];
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshingZhuanghuo)];
        header.stateLabel.font = [UIFont systemFontOfSize:14];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
        self.tableView.mj_header = header;

    }else
    {
        [self refreshing];
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshing)];
        header.stateLabel.font = [UIFont systemFontOfSize:14];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
        self.tableView.mj_header = header;

    }
    
}

//从装货页面过来的
-(void)refreshingZhuanghuo
{
    _pageNum = 0;

//    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
//    [dict setObject:userInfo.storeId forKey:@"storeId"];
//    [dict setObject:@"0" forKey:@"pageNum"];
//    [dict setObject:_categoryId forKey:@"categoryId"];
//    [dict setObject:@"20" forKey:@"pageSize"];
    
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    SWGScreenGoods* goods = [SWGScreenGoods new];
    NSNumber *storeIdNum = [NSNumber numberWithInt:[userInfo.storeId intValue]];
    goods.storeId = storeIdNum;
    NSNumber *pageNum = [NSNumber numberWithInt:[@"0" intValue]];
    goods.pageNum = pageNum;
    NSNumber *categoryIdNum = [NSNumber numberWithInt:[_categoryId intValue]];
    goods.categoryId = categoryIdNum;
    NSNumber *pageSizeNum = [NSNumber numberWithInt:[@"20" intValue]];
    goods.pageSize = pageSizeNum;
    
    //库存查询的请求
    if (_selectArray.count && _isConditionsSearch == YES) {
        
        NSMutableArray* dataArr = [NSMutableArray array];
        
        for (NSMutableDictionary* dict in _selectArray) {
            if ([dict[@"isPinPai"] isEqualToString:@"YES"]) {
                goods.brandId = dict[@"attrId"];
                
            }else if ([dict[@"isChangdu"] isEqualToString:@"YES"])
            {
                goods.length = dict[@"attrValue"];
                
            }else if ([dict[@"isCangku"] isEqualToString:@"YES"])
            {
                goods.warehouseId = dict[@"attrId"];
                
            }else if ([dict[@"isGenShu"] isEqualToString:@"YES"])
            {
                goods.piecesNum = dict[@"attrValue"];
            }else
            {
                SWGAttributeBean* bean = [SWGAttributeBean new];
                bean.attrId = dict[@"attrId"];
                bean.attrName = dict[@"attrValue"];
                
                [dataArr addObject:bean];
                
            }
        }
        
        
        if (dataArr.count && _isConditionsSearch == YES) {
            _attributeList = dataArr;
            goods.attributeList = _attributeList;
        }
        
    }else
    {
        //全部商品请求
        goods.brandId = nil;
        goods.length = nil;
        goods.warehouseId = nil;
        goods.piecesNum = nil;
        goods.attributeList = nil;
    }
    
    __weak typeof(self)weakSelf = self;
    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    
    [_dataArray removeAllObjects];
    [_lenthArray removeAllObjects];
    [apiInstance selectStockUsingPOST1WithAuthorization:@"Q" screenGoods:goods completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        //detailsBeanList   packetNumber
        if (!error) {
            if ([output.code intValue] == 0) {
                
                NSDictionary* dact = (NSDictionary *)output.data;
                NSMutableDictionary* muDict = [NSMutableDictionary dictionaryWithDictionary:dact];
                
                
                weakSelf.zhaungHuoDataArray = [GoodsBeansListModel mj_objectArrayWithKeyValuesArray:muDict[@"goodsList"]];
                
                NSMutableArray* lenthArr = muDict[@"lengthList"];
                
                NSMutableArray* detailsBeanList = muDict[@"detailsBeanList"];
                [weakSelf.detailsBeanList addObjectsFromArray:detailsBeanList];
                [weakSelf.zhaungHuolenthArray addObjectsFromArray:lenthArr];
                [weakSelf.tableView reloadData];
            }
            
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
        
    }];
}

-(void)reloadDataZhuanghuo:(NSInteger)page
{
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_footer resetNoMoreData];
    
//    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
//    [dict setObject:userInfo.storeId forKey:@"storeId"];
//    [dict setObject:@"0" forKey:@"pageNum"];
//    [dict setObject:_categoryId forKey:@"categoryId"];
//    [dict setObject:@"20" forKey:@"pageSize"];
    
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    SWGScreenGoods* goods = [SWGScreenGoods new];
    NSNumber *storeIdNum = [NSNumber numberWithInt:[userInfo.storeId intValue]];
    goods.storeId = storeIdNum;
    NSNumber *pageNum = [NSNumber numberWithInteger:_pageNum];
    goods.pageNum = pageNum;
    NSNumber *categoryIdNum = [NSNumber numberWithInt:[_categoryId intValue]];
    goods.categoryId = categoryIdNum;
    NSNumber *pageSizeNum = [NSNumber numberWithInt:[@"20" intValue]];
    goods.pageSize = pageSizeNum;
    
    if (_selectArray.count && _isConditionsSearch == YES) {
        
        NSMutableArray* dataArr = [NSMutableArray array];
        
        for (NSMutableDictionary* dict in _selectArray) {
            if ([dict[@"isPinPai"] isEqualToString:@"YES"]) {
                goods.brandId = dict[@"attrId"];
                
            }else if ([dict[@"isChangdu"] isEqualToString:@"YES"])
            {
                goods.length = dict[@"attrValue"];
                
            }else if ([dict[@"isCangku"] isEqualToString:@"YES"])
            {
                goods.warehouseId = dict[@"attrId"];
                
            }else if ([dict[@"isGenShu"] isEqualToString:@"YES"])
            {
                goods.piecesNum = dict[@"attrValue"];
            }else
            {
                SWGAttributeBean* bean = [SWGAttributeBean new];
                bean.attrId = dict[@"attrId"];
                bean.attrName = dict[@"attrValue"];
                
                [dataArr addObject:bean];
                
            }
        }
        
        _attributeList = dataArr;
        goods.attributeList = _attributeList;
        
    }else
    {
        goods.brandId = nil;
        goods.length = nil;
        goods.warehouseId = nil;
        goods.piecesNum = nil;
        goods.attributeList = nil;
    }
    
    __weak typeof(self)weakSelf = self;
    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    
    [apiInstance selectStockUsingPOST1WithAuthorization:@"Q" screenGoods:goods completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        if (!error) {
            if ([output.code intValue] == 0) {
                
                NSDictionary* dact = (NSDictionary *)output.data;
                NSMutableDictionary* muDict = [NSMutableDictionary dictionaryWithDictionary:dact];
                NSMutableArray* dataArr = [GoodsBeansListModel mj_objectArrayWithKeyValuesArray:muDict[@"goodsList"]];
                
                if (dataArr.count==0) {
                    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                    
                    return;
                }
                
                [weakSelf.zhaungHuoDataArray addObjectsFromArray:dataArr];
                //长度
                NSMutableArray* lenthArr = [muDict[@"lengthList"] mutableCopy];
                [weakSelf.zhaungHuolenthArray addObjectsFromArray:lenthArr];
                [weakSelf.tableView reloadData];
            }
            
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

-(void)refreshing
{
    _pageNum = 0;
//    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
//    [dict setObject:userInfo.storeId forKey:@"storeId"];
//    [dict setObject:@"0" forKey:@"pageNum"];
//    [dict setObject:_categoryId forKey:@"categoryId"];
//    [dict setObject:@"20" forKey:@"pageSize"];
 
    
    //调API接口
    SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];
    SWGScreenGoods* goods = [SWGScreenGoods new];
    NSNumber *storeIdNum = [NSNumber numberWithInt:[userInfo.storeId intValue]];
    goods.storeId = storeIdNum;
    NSNumber *pageNum = [NSNumber numberWithInt:[@"0" intValue]];
    goods.pageNum = pageNum;
    NSNumber *categoryIdNum = [NSNumber numberWithInt:[_categoryId intValue]];
    goods.categoryId = categoryIdNum;
    NSNumber *pageSizeNum = [NSNumber numberWithInt:[@"20" intValue]];
    goods.pageSize = pageSizeNum;
    //库存查询
    if (_selectArray.count && _isConditionsSearch == YES) {

            NSMutableArray* dataArr = [NSMutableArray array];
            
            for (NSMutableDictionary* dict in _selectArray) {
                if ([dict[@"isPinPai"] isEqualToString:@"YES"]) {
                    goods.brandId = dict[@"attrId"];
                    
                }else if ([dict[@"isChangdu"] isEqualToString:@"YES"])
                {
                    goods.length = dict[@"attrValue"];
                    
                }else if ([dict[@"isCangku"] isEqualToString:@"YES"])
                {
                    goods.warehouseId = dict[@"attrId"];
                    
                }else if ([dict[@"isGenShu"] isEqualToString:@"YES"])
                {
                    goods.piecesNum = dict[@"attrValue"];
                }else
                {
                    SWGAttributeBean* bean = [SWGAttributeBean new];
                    bean.attrId = dict[@"attrId"];
                    bean.attrName = dict[@"attrValue"];
                    
                    [dataArr addObject:bean];

                }
            }
        
        
        if (dataArr.count) {
            _attributeList = dataArr;
            goods.attributeList = _attributeList;
       
        }
       
    }else
    {
        //全部商品
        goods.brandId = nil;
        goods.length = nil;
        goods.warehouseId = nil;
        goods.piecesNum = nil;
        goods.attributeList = nil;
    }
    __weak typeof(self)weakSelf = self;
    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    [_dataArray removeAllObjects];
    [_lenthArray removeAllObjects];
    [_piecesNumList removeAllObjects];
    [apiInstance getGoodsUsingPOSTWithAuthorization:@"Q" screenGoods:goods completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        if (!error) {
            if ([output.code intValue] == 0) {
    
                NSDictionary* dact = (NSDictionary *)output.data;
                NSMutableDictionary* muDict = [NSMutableDictionary dictionaryWithDictionary:dact];
                
                weakSelf.dataArray = [GoodsBeansListModel mj_objectArrayWithKeyValuesArray:muDict[@"goodsBeansList"]];

                NSMutableArray* lenthArr = muDict[@"lengthList"];
                NSMutableArray* piecesNumList = muDict[@"piecesNumList"];
                
                [weakSelf.piecesNumList addObjectsFromArray:piecesNumList];
                [weakSelf.lenthArray addObjectsFromArray:lenthArr];
                [weakSelf.tableView reloadData];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

-(void)shipinMoreNetWork
{
    if (_isZhuanghuo == YES) {
        _pageNum +=1;
        [self reloadDataZhuanghuo:_pageNum];
    }else
    {
    
    _pageNum +=1;
    [self reloadData:_pageNum];
        
    }
}


//上拉加载更多
-(void)reloadData:(NSInteger)page
{
    
    [self.tableView.mj_footer endRefreshing];
    [self.tableView.mj_footer resetNoMoreData];
    
//    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
//    [dict setObject:userInfo.storeId forKey:@"storeId"];
//    [dict setObject:@"0" forKey:@"pageNum"];
//    [dict setObject:_categoryId forKey:@"categoryId"];
//    [dict setObject:@"20" forKey:@"pageSize"];
    
    SWGGoodsControllerApi*apiInstance = [[SWGGoodsControllerApi alloc] init];
    SWGScreenGoods* goods = [SWGScreenGoods new];
    NSNumber *storeIdNum = [NSNumber numberWithInt:[userInfo.storeId intValue]];
    goods.storeId = storeIdNum;
    NSNumber *pageNum = [NSNumber numberWithInteger:_pageNum];
    goods.pageNum = pageNum;
    NSNumber *categoryIdNum = [NSNumber numberWithInt:[_categoryId intValue]];
    goods.categoryId = categoryIdNum;
    NSNumber *pageSizeNum = [NSNumber numberWithInt:[@"20" intValue]];
    goods.pageSize = pageSizeNum;
    if (_selectArray.count && _isConditionsSearch == YES) {
        NSMutableArray* dataArr = [NSMutableArray array];
        for (NSMutableDictionary* dict in _selectArray) {
            if ([dict[@"isPinPai"] isEqualToString:@"YES"]) {
                goods.brandId = dict[@"attrId"];
                
            }else if ([dict[@"isChangdu"] isEqualToString:@"YES"])
            {
                goods.length = dict[@"attrValue"];
                
            }else if ([dict[@"isCangku"] isEqualToString:@"YES"])
            {
                goods.warehouseId = dict[@"attrId"];
                
            }else if ([dict[@"isGenShu"] isEqualToString:@"YES"])
            {
                goods.piecesNum = dict[@"attrValue"];
            }else
            {
                SWGAttributeBean* bean = [SWGAttributeBean new];
                bean.attrId = dict[@"attrId"];
                bean.attrName = dict[@"attrValue"];
                [dataArr addObject:bean];
            }
        }
        _attributeList = dataArr;
        goods.attributeList = _attributeList;
        
    }else
    {
        goods.brandId = nil;
        goods.length = nil;
        goods.warehouseId = nil;
        goods.piecesNum = nil;
        goods.attributeList = nil;
    }
    
    __weak typeof(self)weakSelf = self;
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    [apiInstance getGoodsUsingPOSTWithAuthorization:@"Q" screenGoods:goods completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        if (!error) {
            if ([output.code intValue] == 0) {
                
                NSDictionary* dact = (NSDictionary *)output.data;
                NSMutableDictionary* muDict = [NSMutableDictionary dictionaryWithDictionary:dact];
                NSMutableArray* dataArr = [GoodsBeansListModel mj_objectArrayWithKeyValuesArray:muDict[@"goodsBeansList"]];
                
                if (dataArr.count==0) {
                    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                    
                    return;
                }
                
                [weakSelf.dataArray addObjectsFromArray:dataArr];
                NSMutableArray* lenthArr = [muDict[@"lengthList"] mutableCopy];
                [weakSelf.lenthArray addObjectsFromArray:lenthArr];
                
                NSMutableArray* piecesNumList = [muDict[@"piecesNumList"] mutableCopy];
                [weakSelf.piecesNumList addObjectsFromArray:piecesNumList];

                [weakSelf.tableView reloadData];
            }
            
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

- (IBAction)searchAction:(UIButton *)sender {
    //搜索查询
    SearchAddGoodVC* VC = [SearchAddGoodVC new];
    VC.slectSearchBlock = ^(NSString * _Nonnull searStr) {
        _searStr = searStr;
        if (_isZhuanghuo == YES) {
            [self refreshingZhuanghuo];
        }else
        {
        [self refreshing];
        }
    };
    
    UINavigationController *navigationController =
    [[BasicNavigationController alloc] initWithRootViewController:VC];
    [self presentViewController:navigationController animated:NO completion:nil];
    
}

- (IBAction)storeAction:(UIButton *)sender {
    
    if (_backView.hidden == YES) {
        _backView.hidden = NO;
    }else
    {
        _backView.hidden = YES;
    }
}

- (IBAction)screeningAction:(UIButton *)sender {
    InventoryQueryVC* VC = [InventoryQueryVC new];
    VC.categoryId = _categoryId;
    
    VC.slectInventoryBlock = ^(NSMutableArray * _Nonnull arr) {

        [_headerView removeFromSuperview];
        _tableView.frame = CGRectMake(0, 102, screenW, screenH-64-102);
        _selectArray = arr;
        _isConditionsSearch = YES;
        _chooseArray = arr;
        [self UpdateView];
        if (_isZhuanghuo == YES) {
            //装货页面来的
            [self refreshingZhuanghuo];
        }else
        {
            [self refreshing];
        }
    };

    [self.navigationController pushViewController:VC animated:YES];
    
}

//添加商品
-(void)sureAction:(NSMutableDictionary *)dict
{
    if (_isZhuanghuo == YES) {
        
        NSMutableArray* array = [NSMutableArray array];
        [dict setObject:_orderId forKey:@"orderId"];
        SWGOrderAbroadPackBean* bean = [SWGOrderAbroadPackBean new];
        bean.orderId = dict[@"orderId"];
        bean.goodsId = dict[@"goodsId"];
        bean.buyNumber = dict[@"buyNumber"];
        bean.buyPrice = dict[@"buyPrice"];
        bean.categoryId = [NSNumber numberWithInt:[_categoryId intValue]];
        if ([_categoryId intValue] == 2) {
            bean.packages = dict[@"packages"];//parkId
            bean.orderPackId = dict[@"parkId"];
        }
        [array addObject:bean];
        
        _parkBeanList = array;
        SWGOrderPackControllerApi* orderPack = [SWGOrderPackControllerApi new];
        __weak typeof(self)weakSelf = self;

        [orderPack orderAbroadPackUsingPOSTWithAuthorization:@"Q" bean:_parkBeanList completionHandler:^(SWGMessageResult *output, NSError *error) {
            if (!error) {
                if ([output.code intValue] == 0) {
                
                    [weakSelf showAlert:@"添加成功"];
                    [weakSelf.addView removeFromSuperview];
                    [weakSelf.addView.backgroupView removeFromSuperview];
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
        
        OrderDBTool *noticeDBTool = [OrderDBTool shareInstance];
        [noticeDBTool createTable];
        NSMutableDictionary* dict0 = [NSMutableDictionary dictionary];
        [dict0 setObject:@"" forKey:@"orderDetailId"];
        [dict0 setObject:dict[@"buyNumber"] forKey:@"buyNumber"];
        [dict0 setObject:dict[@"buyPrice"] forKey:@"buyPrice"];
        [dict0 setObject:dict[@"cubicNumber"] forKey:@"unitNum"];
        [dict0 setObject:dict[@"goodsId"] forKey:@"goodsId"];
        [dict0 setObject:[NSString stringWithFormat:@"%@",dict[@"stockNum"]] forKey:@"stockNum"];
        [dict0 setObject:[NSString stringWithFormat:@"%@",dict[@"lockNum"]] forKey:@"lockNum"];
        [dict0 setObject:dict[@"goodsNuit"] forKey:@"goodsNuit"];
        [dict0 setObject:@"" forKey:@"packages"];
//        //片数
        [dict0 setObject:dict[@"genshu"] forKey:@"genshu"];
        [dict0 setObject:dict[@"houdu"] forKey:@"houdu"];
        [dict0 setObject:dict[@"kuandu"] forKey:@"kuandu"];
        [dict0 setObject:dict[@"changdu"] forKey:@"changdu"];
        [dict0 setObject:dict[@"shuzhong"] forKey:@"shuzhong"];
        [dict0 setObject:dict[@"pinpai"] forKey:@"pinpai"];
        [dict0 setObject:dict[@"dengji"] forKey:@"dengji"];
        [dict0 setObject:@"NO" forKey:@"isCus"];
//        [dict0 setObject:@"" forKey:@"goodsName"];
        [dict0 setObject:@"" forKey:@"cangku"];
        
        OrderDBModel *noticeModel =[[OrderDBModel alloc]initWithDictionary:dict0];
        [noticeDBTool insertModel:noticeModel];
        [self.addView removeFromSuperview];
        [self.addView.backgroupView removeFromSuperview];
        
        
//        [dict setObject:_orderId forKey:@"orderId"];
//        SWGOrderDetailBean* bean = [SWGOrderDetailBean new];
//        bean.orderId = dict[@"orderId"];
//        bean.cubicNumber = dict[@"cubicNumber"];
//        bean.goodsId = dict[@"goodsId"];
//        bean.goodsName = dict[@"goodsName"];
//        bean.status = dict[@"status"];
//        bean.buyNumber = dict[@"buyNumber"];
//        bean.buyPrice = dict[@"buyPrice"];
//        bean.createTime = dict[@"createTime"];
//        SWGOrderDetailControllerApi *apiInstance = [[SWGOrderDetailControllerApi alloc] init];
//        __weak typeof(self)weakSelf = self;
//        [apiInstance insertOrderDetailUsingPOSTWithAuthorization:@"Q" bean:bean completionHandler:^(SWGMessageResult *output, NSError *error) {
//            if (!error) {
//                if ([output.code intValue] == 0) {
//                    [weakSelf showAlert:@"添加成功"];
//                    [weakSelf.addView removeFromSuperview];
//                    [weakSelf.addView.backgroupView removeFromSuperview];
//                }
//            }else
//            {
//                NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
//                NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//                NSLog(@"错误原因:%@",str);
//            }
//        }];
    }
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    
}

- (IBAction)addAction:(UIButton *)sender {
    
    
}

-(void)pressleft
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _smallTableView) {
        NSString* str = _storeArray[indexPath.row];
        [_storeBtn setTitle:str forState:UIControlStateNormal];
        _backView.hidden= YES;
    }else
    {
        if (_isZhuanghuo == YES) {
            AddOrderView *photoView = [AddOrderView addSureView];
            photoView.parksModel = _zhaungHuoDataArray[indexPath.row];
            photoView.parksDict = _zhaungHuolenthArray[indexPath.row];
            _addView = photoView;
            _addView.isZhuanghuo = YES;
            photoView.delegate = self;
            [photoView show];
        }else
        {
            AddOrderView *photoView = [AddOrderView addSureView];
            photoView.beanModel = _dataArray[indexPath.row];
            photoView.dict = _lenthArray[indexPath.row];
            photoView.genshuDict = _piecesNumList[indexPath.row];
            _addView = photoView;
            photoView.delegate = self;
            [photoView show];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _smallTableView)
    {
        return _storeArray.count;
    }else
        
   
        if (_isZhuanghuo == YES) {
            return _zhaungHuoDataArray.count;

        }else
        {
        return _dataArray.count;
        }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == _smallTableView)
    {
        NSString *identifier0 = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier0];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = _storeArray[indexPath.row];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"333333"];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        return cell;

    }else{
    
    NSString *identifier1 = @"AddOrderGoodsCell";
    AddOrderGoodsCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_isZhuanghuo == YES) {
            GoodsBeansListModel* model = _zhaungHuoDataArray[indexPath.row];
            cell1.parksModel = model;
            cell1.parksDict = _zhaungHuolenthArray[indexPath.row];
        }else
        {
   
            GoodsBeansListModel* model = _dataArray[indexPath.row];
            cell1.model = model;
            cell1.dict = _lenthArray[indexPath.row];
            cell1.genshuDict = _piecesNumList[indexPath.row];
        }
    
    return cell1;
    }
    
    return nil;
}

@end

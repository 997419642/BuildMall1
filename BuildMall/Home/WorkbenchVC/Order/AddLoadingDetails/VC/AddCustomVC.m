//
//  AddCustomVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddCustomVC.h"
#import "AddCustomCollectionCell.h"
#import "AddCustomHeaderReusableView.h"
#import "AddCustomModel.h"
#import "SWGOrderPackControllerApi.h"
#import "SWGOrderPackBean.h"
#import "SWGOrderPack.h"
#import "SWGOrderAbroadPackBean.h"
#import "SearchAddCustomVC.h"
#import "BasicNavigationController.h"

@interface AddCustomVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITextField *numTF;
@property (weak, nonatomic) IBOutlet UIButton *addNumBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property(nonatomic,strong)NSMutableArray* customArray;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property (nonatomic, assign) NSInteger pageNum;
@property(nonatomic,strong)NSMutableArray* selectArray;

@property(nonatomic) NSArray<SWGOrderAbroadPackBean>* packBeanArray;

@property(nonatomic) NSArray<SWGOrderPackBean>* attributeList;


@property(nonatomic,strong)NSMutableArray* hasAddArray;

@property(nonatomic,strong)NSMutableArray* selectRequestArray;


@property(nonatomic,strong)NSMutableArray* deleteArray;

@property(nonatomic,assign)NSString* searStr;


@end

@implementation AddCustomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataArray = [NSMutableArray array];
    _customArray = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    _hasAddArray = [NSMutableArray array];
    _selectRequestArray = [NSMutableArray array];
    _deleteArray = [NSMutableArray array];
    
    self.navigationItem.title = @"添加装货明细";
    [self resetConlloctionView];

    _searchBar.backgroundImage = [[UIImage alloc]init];
    _searchBar.barTintColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _searchBar.backgroundColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _searchBar.placeholder = @"搜索";
    UITextField * searchField = [_searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor colorWithHexString:@"BFBFBF"] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    _addNumBtn.layer.borderColor = [UIColor colorWithHexString:@"A9DDDB"].CGColor;
    _addNumBtn.layer.borderWidth = 1;
    _addNumBtn.layer.masksToBounds = YES;
    _addNumBtn.layer.cornerRadius = 4;
    _numTF.delegate = self;
    _numTF.returnKeyType = UIReturnKeyDone;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 4;
    _numTF.layer.borderColor = [UIColor colorWithHexString:@"A9DDDB"].CGColor;
    
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshing)];
//    header.stateLabel.font = [UIFont systemFontOfSize:14];
//    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
//    self.collectionView.mj_header = header;
    //设置尾部加载
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shipinMoreNetWork)];
//    footer.stateLabel.font = [UIFont systemFontOfSize:14];
//    self.collectionView.mj_footer = footer;
    
    [self requestHasBeenAdded];
}

-(void)requestHasBeenAdded
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:_model.orderId forKey:@"orderId"];
    [[WebClient sharedClient]OrderPackComparePackages:dict complete:^(ResponseMode *result, NSError *error) {
    
        if (!error) {
            if (result.code == 0) {
                NSMutableArray* array = (NSMutableArray *)result.data;
                
                for (NSMutableDictionary* dict in array) {
                    AddCustomModel* model = [AddCustomModel new];
                    if ([dict[@"packages"] isEqual:[NSNull null]]) {
                        
                    }else{
                        
                        model.packetNumber = dict[@"packages"];
                        model.packetId = dict[@"id"];
                        [_hasAddArray addObject:model];
                    }
                }
                [self refreshing];
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
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:_detailModel.goodsId forKey:@"goodsId"];
    if (_searStr != nil) {
        [dict setObject:_searStr forKey:@"packetNumber"];
    }
    
    __weak typeof(self)weakSelf = self;

    [[WebClient sharedClient] mallGoodsAttributeDetailsStockList:dict complete:^(ResponseMode *result, NSError *error) {
        if (!error) {
            if (result.code == 0) {
                weakSelf.dataArray = [AddCustomModel mj_objectArrayWithKeyValuesArray:result.data];
                NSMutableArray* aldayArr = [NSMutableArray array];
                
                //取出已经添加成功的包号改为已选中状态，放进选中数组中
                for (AddCustomModel* model in weakSelf.dataArray) {
                    for (AddCustomModel* dict in weakSelf.hasAddArray) {
                        if ([model.packetNumber containsString:dict.packetNumber]) {
                            
                            model.isHasAdd = YES;
                            model.isSelect = YES;
                            [weakSelf.selectArray addObject:model];
                            [aldayArr addObject:model];
                        }
                    }
                }
                
                NSMutableArray* difObject = [NSMutableArray array];
                
                //取出自己手动添加的包号
                [_hasAddArray enumerateObjectsUsingBlock:^(AddCustomModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    AddCustomModel *number1 = obj;//[obj objectAtIndex:idx];
                    __block BOOL isHave = NO;
                    [aldayArr enumerateObjectsUsingBlock:^(AddCustomModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([number1.packetNumber isEqual:obj.packetNumber]) {
                            isHave = YES;
                            *stop = YES;
                        }
                    }];
                    if (!isHave) {
                        [difObject addObject:obj];
                    }
                }];
                NSLog(@"%@",difObject);
                
                //把用户自己添加的包号放进数据源中，并且放进已选中数组
                for (AddCustomModel* model0 in difObject) {
                    [weakSelf.dataArray addObject:model0];
                    model0.isHasAdd = YES;
                    model0.isSelect = YES;
                    [weakSelf.selectArray addObject:model0];
                }
            
                [weakSelf.collectionView reloadData];
            }
        }else
        {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"错误原因:%@",str);
        }
    }];
}

//-(void)shipinMoreNetWork
//{
//    _pageNum +=1;
//    [self reloadData:_pageNum];
//
//}

-(void)reloadData:(NSInteger)page
{
    
    [self.collectionView.mj_footer endRefreshing];
    [self.collectionView.mj_footer resetNoMoreData];
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:_detailModel.goodsId forKey:@"goodsId"];
    [dict setObject:@(page) forKey:@"pageNum"];
    __weak typeof(self)weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[WebClient sharedClient]mallGoodsAttributeDetailsStockList:dict complete:^(ResponseMode *result, NSError *error) {
        [MBProgressHUD hideHUDForView:weakSelf.view animated:NO];
    
        if (!error) {
            if (result.code == 0) {
                
                NSMutableArray* modelArr = [OrderManageModel mj_objectArrayWithKeyValuesArray:result.data];
                
                
                if (modelArr.count==0) {
                    [weakSelf.collectionView.mj_footer endRefreshingWithNoMoreData];
                    
                    return;
                }
                [weakSelf.dataArray addObjectsFromArray:modelArr];
                [weakSelf.collectionView reloadData];
            }else
            {
                
            }
        }else
        {
        }
        
    }];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"点击了搜索");
    [_numTF resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
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


- (IBAction)searchAction:(UIButton *)sender {
    
    SearchAddCustomVC* VC = [SearchAddCustomVC new];
    VC.searchCustomBlock = ^(NSString * _Nonnull searStr) {
        _searStr = searStr;
        [self refreshing];
    };
    UINavigationController *navigationController =
    [[BasicNavigationController alloc] initWithRootViewController:VC];
    [self presentViewController:navigationController animated:NO completion:nil];}

- (IBAction)addNumAction:(id)sender {
    
    AddCustomModel* dict = [AddCustomModel new];
    dict.packetNumber = _numTF.text;
    dict.isSelect = YES;
    [_customArray addObject:dict];
    [self.selectArray addObject:dict];
    [_collectionView reloadData];
    _numTF.text = @"";

}

-(void)deleteRequest:(NSMutableArray *)array
{
    
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    __weak typeof(self)weakSelf = self;
    
    [apiInstance cancelPackagesUsingGETWithAuthorization:@"Q" orderPackIdList:array completionHandler:^(SWGMessageResult *output, NSError *error) {
        
        if (!error) {
            if ([output.code intValue] == 0) {
                
                [weakSelf showAlert:@"操作成功"];
//                [weakSelf requestHasBeenAdded];

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

- (IBAction)sureAction:(UIButton *)sender
{
    if (_hasAddArray.count) {
        NSMutableArray* selearray = [NSMutableArray array];
        NSMutableArray* noDeleteArray = [NSMutableArray array];
        
        for (AddCustomModel* model in _selectArray) {
            if (model.isHasAdd == NO) {
                
                //没添加过的
                [selearray addObject:model];
            }else
            {
                //已添加的，选中状态的
                [noDeleteArray addObject:model];
            }
        }
        
        __block NSMutableArray *difObject = [NSMutableArray array];
        //找到_hasAddArray中有,noDeleteArray中没有的数据
        //取出已添加成功的数据中被取消选中的数据
        [_hasAddArray enumerateObjectsUsingBlock:^(AddCustomModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AddCustomModel *number1 = obj;//[obj objectAtIndex:idx];
            __block BOOL isHave = NO;
            [noDeleteArray enumerateObjectsUsingBlock:^(AddCustomModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([number1.packetNumber isEqual:obj.packetNumber]) {
                    isHave = YES;
                    *stop = YES;
                }
            }];
            if (!isHave) {
                [difObject addObject:obj];
            }
        }];
        NSLog(@"%@",difObject);
        //选中的数据，请求添加接口
        _selectRequestArray = [NSMutableArray arrayWithArray:selearray];
        NSMutableArray* deleArr = [NSMutableArray array];
        
        //取消选中的数据，请求删除接口
        for (AddCustomModel* deleDic in difObject) {
            [deleArr addObject:deleDic.packetId];
        }
        _deleteArray  = deleArr;
    }else
    {
        //如果没有已经添加过的数据直接请求添加接口
        _selectRequestArray = [NSMutableArray arrayWithArray:_selectArray];
    }
    NSMutableArray* array = [NSMutableArray array];
    
    for (AddCustomModel* packages in _selectRequestArray) {
        SWGOrderAbroadPackBean* bean = [SWGOrderAbroadPackBean new];
        
        bean.buyPrice = _detailModel.buyPrice;
        NSNumber *goodsId = [NSNumber numberWithInt:[_detailModel.goodsId intValue]];
        bean.goodsId = goodsId;
        NSNumber *orderId = [NSNumber numberWithInt:[_model.orderId intValue]];
        bean.orderId = orderId;
        NSNumber *Number = [NSNumber numberWithInt:[_detailModel.buyNumber intValue]];
        bean.buyNumber = Number;
        NSNumber *categoryId = [NSNumber numberWithInt:[_categoryId intValue]];
        bean.categoryId = categoryId;
        bean.packages = packages.packetNumber;
        bean.orderPackId = [NSNumber numberWithInt:[packages.packetId intValue]];
        bean.orderDetailId = [NSNumber numberWithInt:[_detailModel.orderDetailId intValue]];
        [array addObject:bean];
    }
    
    _packBeanArray = array;
    SWGOrderPackControllerApi*apiInstance = [[SWGOrderPackControllerApi alloc] init];
    __weak typeof(self)weakSelf = self;

    [apiInstance orderAbroadPackUsingPOSTWithAuthorization:@"Q" bean:_packBeanArray completionHandler:^(SWGMessageResult *output, NSError *error) {
        if (!error) {
            if ([output.code intValue] == 0) {
                
                [weakSelf showAlert:@"操作成功"];
                if (weakSelf.deleteArray.count) {
                    [weakSelf deleteRequest:weakSelf.deleteArray];

                }else
                {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
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

-(void)resetConlloctionView
{
    //相当于item
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置行间距-最小行间距
    flowLayout.minimumLineSpacing = 10;
    //设置每单元格左右间距
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 44, screenW, screenH-64-44-190) collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
    [_collectionView registerClass:[AddCustomCollectionCell class] forCellWithReuseIdentifier:@"AddCustomCollectionCell"];
    [self.view addSubview:_collectionView];
    //注册分区头标题
    
    [_collectionView registerNib:[UINib nibWithNibName:@"AddCustomHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AddCustomHeaderReusableView"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _dataArray.count;

    }else{
        return _customArray.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddCustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddCustomCollectionCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {

        AddCustomModel* model = _dataArray[indexPath.row];
        cell.name.text = model.packetNumber;
        
        if (model.isSelect == YES) {
            cell.imgview.image = [UIImage imageNamed:@"Check"];

        }else
        {
            cell.imgview.image = [UIImage imageNamed:@"un-Check"];
        }
        
    }else
    {
        //用户自己输入的包号
        AddCustomModel* modelcus = _customArray[indexPath.row];
        cell.name.text = modelcus.packetNumber;
        if (modelcus.isSelect == YES) {
            cell.imgview.image = [UIImage imageNamed:@"Check"];
            
        }else
        {
            cell.imgview.image = [UIImage imageNamed:@"un-Check"];
        }
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        AddCustomModel* model = _dataArray[indexPath.row];
   
        if (model.isSelect == NO) {
            model.isSelect = YES;
            [self.selectArray addObject:model];
            
        }else
        {
            model.isSelect = NO;
            [self.selectArray removeObject:model];
        }
        

    }else
    {
       AddCustomModel* cusDict = _customArray[indexPath.row];
        
        if (cusDict.isSelect == NO) {
            cusDict.isSelect = YES;
            [self.selectArray addObject:cusDict];
            
        }else
        {
            cusDict.isSelect = NO;
            [self.selectArray removeObject:cusDict];
        }
    }
    
    [_collectionView reloadData];

}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((screenW-40-10*1)/3,30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *reuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    { 
        reuseIdentifier = @"AddCustomHeaderReusableView";
    }
    AddCustomHeaderReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        view.detailmodel = _detailModel;
        NSMutableArray* arr = (NSMutableArray *)_detailModel.warestoreList;
        view.dict = arr[0];
        
        view.model = _model;
    }
    return view;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(screenW, 110);

    }else
    {
        return CGSizeMake(screenW, 0.1);

    }
}


@end

//
//  AdressCustomerVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/15.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "AdressCustomerVC.h"

#import "AdressResultVC.h"
#import "Product.h"
#import "DataModel.h"
#import "AdressCustomerCell.h"
#import "AdressOneCell.h"

#import "NetWorkHelper.h"
#import "PersonDetailVC.h"
#import "TitlePersonVC.h"
#import "BasicNavigationController.h"
#import "AddPersonVC.h"

@interface AdressCustomerVC ()<UISearchResultsUpdating, UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

{
    UIView * _backWindowView;
    
}

@property (nonatomic, strong) NSMutableArray *tempMArray; // 用于判断手风琴的某个层级是否展开
@property (nonatomic, strong) NSMutableArray *mArray;

@property (nonatomic,strong)NSMutableDictionary* dataDic;


@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *searchResults; // Filtered search results
@property (nonatomic, strong) NSMutableArray *products;

@property (nonatomic, strong) NSMutableArray * resultArray;

@property (nonatomic, strong)NSMutableArray* selectArray;
@property (nonatomic, strong)UITableView* tableView;
@property (weak, nonatomic) IBOutlet UIView *backView;


@property (nonatomic, strong)UIView* backTwoView;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;

@end

@implementation AdressCustomerVC

- (NSMutableArray *)tempMArray{
    
    if (!_tempMArray) {
        
        _tempMArray = [[NSMutableArray alloc]init];
    }
    return _tempMArray;
}

-(NSMutableArray *)mArray{
    
    if (!_mArray) {
        
        _mArray = [[NSMutableArray alloc]init];
    }
    return _mArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    _products = [NSMutableArray array];
    
    _selectArray = [NSMutableArray array];
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:@"转让"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, screenW, screenH-44-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AdressCustomerCell" bundle:nil] forCellReuseIdentifier:@"AdressCustomerCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AdressOneCell" bundle:nil] forCellReuseIdentifier:@"AdressOneCell"];
    self.tableView.rowHeight = 60;
    
    NSArray *testArr = @[@"张三",@"张三",@"张三",@"张三",@"李四",@"王五",@"赵六",@"田七",@"王小二",@"阿三"];
    for (NSString * name in testArr)
    {
        DataModel * model = [DataModel new];
        model.aName = name;
        [self.products addObject:model];
    }
    
    _SearchBar.backgroundImage = [[UIImage alloc]init];
    _SearchBar.barTintColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _SearchBar.backgroundColor  = [UIColor colorWithHexString:@"F5F5F5"];
    _SearchBar.placeholder = @"搜索";
    UITextField * searchField = [_SearchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor colorWithHexString:@"BFBFBF"] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self personRequest];
    

 
}

-(void)pressright
{
    AddPersonVC* VC  =[AddPersonVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)personRequest
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:@"1174" forKey:@"userid"];
    __weak typeof(self)weakSelf = self;
    
    NSString *str = [NSString stringWithFormat:@"%@/api/v2.user/merchants",webUrlOld];
    
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:str parameters:dict success:^(id responseObject) {
        NSDictionary *diction = [NetWorkHelper dataToDictionary:responseObject];
        if (_tableView.mj_header.isRefreshing) {
            [_tableView.mj_header endRefreshing];
        }
        if([diction[@"status"] floatValue] == 0) {
            
            weakSelf.dataDic = (NSMutableDictionary*)diction;
            NSLog(@"geggggg请求成功%@",diction);
            [weakSelf loadData];
            [weakSelf.tableView reloadData];
            
        }else
        {
            
        }
        
    } failur:^(id error) {
        
    }];
}

-(void)loadData
{
    NSArray* arr = self.dataDic[@"info"][@"m_store_item"];
    
    [self.mArray removeAllObjects];
    [self.tempMArray removeAllObjects];
    
    for (int i = 0; i < arr.count; i++) {
        
        NSMutableDictionary *mDic = arr[i];
        
        NSMutableArray *mArr = [[NSMutableArray alloc]init];
        
        NSArray* arr0 = mDic[@"m_store_ref_item"];
        
        for (int j = 0; j < arr0.count; j++) {
            
            NSMutableDictionary* nameDic = arr0[j];
            
            //            [nameDic setObject:@"0" forKey:@"select"];
            [mArr addObject:nameDic];
        }
        [mDic setObject:mArr forKey:@"mArr"];
        [self.mArray addObject:mDic];
        [self.tempMArray addObject:@"0"];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.tempMArray.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.tempMArray[section] isEqualToString:@"0"]) {
        
        return 0;
    }else{
        // 如果是展开的则给这个分区加一个cell用来放此分区的标题cell
        NSArray *array = self.mArray[section][@"mArr"];
        return array.count;
        
    }
}



- (IBAction)leftAction:(UIButton *)sender {
    
    _backTwoView.hidden = NO;
    _backWindowView.hidden = NO;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdressCustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdressCustomerCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DataModel *product = [self.products objectAtIndex:indexPath.row];
    cell.nameLable.text = product.aName;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DataModel * molde0 = _products[indexPath.row];
    
    PersonDetailVC* VC = [PersonDetailVC new];
    [self.navigationController pushViewController:VC animated:YES];
    
    [tableView reloadData];
    
}

// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    AdressOneCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"AdressOneCell"];
    //    headerCell.nameLable.text = [NSString stringWithFormat:@"%@(%@)人",self.mArray[section][@"s_name"],self.mArray[section][@"m_count"]];
    headerCell.tag = section + 1000;
    headerCell.rightBtn.selected = [self.tempMArray[section] isEqualToString:@"1"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [headerCell addGestureRecognizer:tap];
    return headerCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    
    AdressOneCell *cell = (AdressOneCell *)sender.view;
    [self.tempMArray[cell.tag - 1000] isEqualToString:@"0"]?[self.tempMArray replaceObjectAtIndex:cell.tag - 1000 withObject:@"1"]:[self.tempMArray replaceObjectAtIndex:cell.tag - 1000 withObject:@"0"];
    [self.tableView reloadData];
    
}


- (IBAction)titleBtnAction:(UIButton *)sender {
    
    TitlePersonVC* VC = [TitlePersonVC new];
    
//    [self.view addSubview:VC.view];
//    [VC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(44);
//        make.bottom.equalTo(self.view).offset(0);
//        make.width.equalTo(@(screenW));
//        make.height.equalTo(@(screenH-44));
//    }];
    
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (IBAction)searchAction:(UIButton *)sender {
    
    AdressResultVC *searchViewController = [[AdressResultVC alloc] init];

    UINavigationController *navigationController =
    [[BasicNavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navigationController
                       animated:NO
                     completion:nil];

}



@end

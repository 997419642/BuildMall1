//
//  NewTitleVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "NewTitleVC.h"
#import "SetTitleNameVC.h"
#import "TitleChoosePersonVC.h"
#import "CityModel.h"
#import "TitleChoosePersonCell.h"
#import "BMChineseSort.h"
#import "NetWorkHelper.h"

@interface NewTitleVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray<CityModel *> *dataArray;
}

@property (weak, nonatomic) IBOutlet UIButton *settitleBtn;

@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UIButton *boomBtn;


@property(nonatomic,strong)UITableView* tableView;
@property (nonatomic, strong)NSMutableArray* dataArr;

@property(nonatomic,strong)NSMutableArray *indexArray;
//排序好的结果数组
@property(nonatomic,strong)NSMutableArray *letterResultArr;


@end

@implementation NewTitleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"新建标签";
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressleft) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,170, screenW, screenH-64-170) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 56;
    [self.tableView registerNib:[UINib nibWithNibName:@"TitleChoosePersonCell" bundle:nil] forCellReuseIdentifier:@"TitleChoosePersonCell"];
    [self cityChooseRequest];
}

-(void)pressleft
{
    
}

-(void)loadData
{
    
    dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i<[_dataArr count]; i++) {
        
        CityModel *city = [[CityModel alloc] init];
        
        NSDictionary* dic = [_dataArr objectAtIndex:i];
        
        city.city = dic[@"name"];
        city.number = i;
        city.cityCode = dic[@"citycode"];
        [dataArray addObject:city];
    }
    
    self.indexArray = [BMChineseSort IndexWithArray:dataArray Key:@"city"];
    self.letterResultArr = [BMChineseSort sortObjectArray:dataArray Key:@"city"];
    
    
}

-(void)cityChooseRequest
{
    
    NSString *str = [NSString stringWithFormat:@"%@/api/v2/all_city",webUrlOld];
    NSDictionary *dic = @{};
    
    __weak typeof(self)weakSelf = self;
    [self.dataArr removeAllObjects];
    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:str parameters:dic success:^(id responseObject) {
        NSDictionary *diction = [NetWorkHelper dataToDictionary:responseObject];
        if([diction[@"status"] floatValue] == 0) {
            //name  zimu
            weakSelf.dataArr = diction[@"info"];
            NSLog(@"geggggg请求成功%@",diction);
            [weakSelf loadData];
            [weakSelf.tableView reloadData];
            
        }else{
            NSLog(@"%@",diction[@"msg"]);
            
        }
    } failur:^(id error) {
        NSLog(@"请求失败%@",error);
        NSDictionary* diction3 = [NetWorkHelper dataToDictionary:[error userInfo][@"com.alamofire.serialization.response.error.data"]];
        NSLog(@"请求%@",diction3);
    }];
    
}


#pragma mark - UITableView -
//section的titleHeader

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 17;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor colorWithHexString:@"E8E8E8"];
    UILabel* lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 17)];
    lable.text = [self.indexArray objectAtIndex:section];
    lable.textColor = [UIColor colorWithHexString:@"999999"];
    lable.font = [UIFont systemFontOfSize:11];
    [view addSubview:lable];
    return view;
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [self.indexArray objectAtIndex:section];
//}
//section行数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.indexArray count];
}
//每组section个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.letterResultArr objectAtIndex:section] count];
}
//section右侧index数组
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return self.indexArray;
//}
//点击右侧索引表项时调用 索引与section的对应关系
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
//    return index;
//}
//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TitleChoosePersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleChoosePersonCell"];
    //获得对应的Person对象<替换为你自己的model对象>
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    CityModel *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.nameLable.text = p.city;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityModel *p = [[self.letterResultArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    
    //    self.chooseCity(p.city,p.cityCode);
    //    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)setTitleNameAction:(UIButton *)sender {
    
    SetTitleNameVC* VC = [SetTitleNameVC new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)addnewTitleAction:(UIButton *)sender {
    
    TitleChoosePersonVC* VC = [TitleChoosePersonVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}



@end

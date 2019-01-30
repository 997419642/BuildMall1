//
//  MineVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "MineVC.h"
#import "MyMineHeaderView.h"
#import "OperationManagementVC.h"
#import "FeedBackVC.h"
#import "SetUpVC.h"
#import "MyMineCardVC.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource,MyMineHeaderViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;


@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.navigationItem.title = @"我的";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"F5F5F5"];

    MyMineHeaderView* headerView = [[MyMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, screenW, 160)];
    headerView.delegate = self;
    _tableView.tableHeaderView = headerView;
    _tableView.tableFooterView = [UIView new];
    NSArray* dataArray = @[@"话术管理",@"使用教程",@"意见反馈",@"设置"];
    _dataArray = [NSMutableArray arrayWithArray:dataArray];
    
}

-(void)didClickMCardButton:(UIButton *)btn
{
    MyMineCardVC* VC = [MyMineCardVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"333333"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        OperationManagementVC* VC = [OperationManagementVC new];
        
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 1)
    {
        
    }else if (indexPath.row == 2)
    {
        FeedBackVC* VC = [FeedBackVC new];
        [self.navigationController pushViewController:VC animated:YES];
    }else
    {
        SetUpVC* VC = [SetUpVC new];
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end

//
//  SalesReportsVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SalesReportsVC.h"
#import "SalesReportsCell.h"
#import "ReportDetailVC.h"

@interface SalesReportsVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation SalesReportsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"销售报表";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, screenW, screenH-64-90) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 70;
    [_tableView registerNib:[UINib nibWithNibName:@"SalesReportsCell" bundle:nil] forCellReuseIdentifier:@"SalesReportsCell"];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 55;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UILabel * lable = [UILabel new];
    lable.text = @"今年销售";
    lable.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:lable];
    lable.font = [UIFont systemFontOfSize:14];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(20);
        make.centerY.equalTo(view);
    }];
    

    
    UILabel* stateLable = [UILabel new];
    stateLable.text = @"165,958.00";
    stateLable.textColor = [UIColor colorWithHexString:@"333333"];
    stateLable.font = [UIFont systemFontOfSize:12];
    [view addSubview:stateLable];
    [stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view).offset(-20);
        make.centerY.equalTo(view);
    }];
    
    
    UIView* lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(view).offset(0);
        make.bottom.equalTo(view).offset(0);
        make.height.equalTo(@(10));
    }];
    
    return view;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReportDetailVC* VC = [ReportDetailVC new];
    [self.navigationController pushViewController:VC animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"SalesReportsCell";
    SalesReportsCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    DOPJobsModel* model = _jobsArray[indexPath.row];
    //    cell1.userModel = model;
    //    cell1.delegate = self;
    
    return cell1;
}



@end

//
//  PersonDetailInteractiveVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "PersonDetailInteractiveVC.h"
#import "PersonDetailInteractiveCell.h"

@interface PersonDetailInteractiveVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation PersonDetailInteractiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, screenW, self.view.height-120-64-50) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
       
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 88;
    [_tableView registerNib:[UINib nibWithNibName:@"PersonDetailInteractiveCell" bundle:nil] forCellReuseIdentifier:@"PersonDetailInteractiveCell"];
    
    //    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshing)];
    //    header.stateLabel.font = [UIFont systemFontOfSize:14];
    //    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    //    self.tableView.mj_header = header;
    //    //设置尾部加载
    //    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(shipinMoreNetWork)];
    //    //    footer.automaticallyHidden = YES;
    //    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    //    self.tableView.mj_footer = footer;
    
    //    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 160)];
    //    [headView addSubview:self.headView];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 18;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UILabel* lable = [[UILabel alloc] initWithFrame:CGRectMake(screenW/2-123/2, 20, 123, 22)];
    lable.textAlignment = NSTextAlignmentCenter;
//    lable.text = [self.indexArray objectAtIndex:section];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"2018/09/15 23:34";
    lable.backgroundColor = [UIColor colorWithHexString:@"D5D5D5"];

    lable.layer.cornerRadius = 2;
    lable.font = [UIFont systemFontOfSize:12];
    [view addSubview:lable];
    
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
//    WorkPersonDetailVC* VC  =[WorkPersonDetailVC new];
//    [self.navigationController pushViewController:VC animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"PersonDetailInteractiveCell";
    PersonDetailInteractiveCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell1.nameLable.text = dataArray[indexPath.row];
    
    //        cell1.delegate = self;
    return cell1;
    
}


@end

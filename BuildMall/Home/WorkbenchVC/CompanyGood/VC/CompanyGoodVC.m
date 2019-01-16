//
//  CompanyGoodVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "CompanyGoodVC.h"
#import "CompanyGoodCell.h"
#import "GoodsCards.h"
#import "CompanyGoodDetailVC.h"

@interface CompanyGoodVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray *dataArray;

@end

@implementation CompanyGoodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"产品列表";
    _dataArray = [NSMutableArray array];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 95;
    [_tableView registerNib:[UINib nibWithNibName:@"CompanyGoodCell" bundle:nil] forCellReuseIdentifier:@"CompanyGoodCell"];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 18;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_isSend == YES) {
        
        self.slectGoodsBlock(@"3");
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        CompanyGoodDetailVC* VC = [CompanyGoodDetailVC new];
        
        [self.navigationController pushViewController:VC animated:YES];
    }

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"CompanyGoodCell";
    CompanyGoodCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (cell1 == nil)
    {
        cell1 = [[CompanyGoodCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell1.nameLable.text = dataArray[indexPath.row];
    
    //        cell1.delegate = self;
    return cell1;
    
}

@end

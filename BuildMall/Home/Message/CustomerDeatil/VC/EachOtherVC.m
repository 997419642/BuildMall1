//
//  EachOtherVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "EachOtherVC.h"
#import "EachOtherCell.h"

@interface EachOtherVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;

@property (weak, nonatomic) IBOutlet UIButton *FollowBtn;

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@end

@implementation EachOtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _FollowBtn.layer.masksToBounds = YES;
    _FollowBtn.layer.cornerRadius = 5;
    
    _talkBtn.layer.masksToBounds = YES;
    _talkBtn.layer.cornerRadius = 5;

//    _titleArr = @[@"备注名", @"公司名称", @"职位", @"性别",
//                  @"标签", @"备注手机", @"邮箱", @"详细地址",
//                  @"生日", @"屏蔽TA的消息推送", @"备注"];
    
    _dataArray = [NSMutableArray array];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-50-40-210) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"EachOtherCell" bundle:nil] forCellReuseIdentifier:@"EachOtherCell"];
    _tableView.rowHeight = 80;
    
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
- (IBAction)talkAction:(id)sender {
    
}
- (IBAction)FollowAction:(UIButton *)sender {
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    return _dataArray.count;
    return 10;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"EachOtherCell";
    EachOtherCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (cell1 == nil)
    {
        cell1 = [[EachOtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell1.nameLable.text = dataArray[indexPath.row];
    
    //        cell1.delegate = self;
    return cell1;
    
}


@end

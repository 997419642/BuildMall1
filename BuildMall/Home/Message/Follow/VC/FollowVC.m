//
//  FollowVC.m
//  BuildMall
//
//  Created by 曾祥明 on 2018/11/10.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "FollowVC.h"
#import "FollowCell.h"
#import "NewFollowTaskVC.h"
#import "FollowTaskDetailVC.h"

@interface FollowVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property (strong, nonatomic) UIButton *theButton;

@property (assign, nonatomic) BOOL isOpen;

@property (weak, nonatomic) IBOutlet UIButton *newtaskBtn;

@end

@implementation FollowVC

- (UIButton *)theButton{
    
    if (!_theButton) {
        _theButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        _theButton.frame = CGRectMake(0, 0, screenW, 40);
        [_theButton setTitle:@"显示已完成的任务" forState:UIControlStateNormal];
        _theButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

        [_theButton addTarget:self action:@selector(handleAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_theButton setTitleColor:[UIColor colorWithHexString:@"52C9C5"] forState:(UIControlStateNormal)];
        [_theButton setBackgroundColor:[UIColor colorWithHexString:@"F2F2F2"]];
        _theButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        CGFloat img_W = _theButton.imageView.frame.size.width;
        CGFloat tit_W = _theButton.titleLabel.frame.size.width;
        
        _theButton.titleEdgeInsets = (UIEdgeInsets){
            .top    = 0,
            .left   = - (img_W + 10 / 2),
            .bottom = 0,
            .right  =   (img_W + 10 / 2),
        };
        
        _theButton.imageEdgeInsets = (UIEdgeInsets){
            .top    = 0,
            .left   =   (tit_W + 10 / 2),
            .bottom = 0,
            .right  = - (tit_W + 10 / 2),
        };
        
    }
    return _theButton;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     self.navigationItem.title  = @"跟进任务";
    _newtaskBtn.layer.masksToBounds = YES;
    _newtaskBtn.layer.cornerRadius = 5;
    _dataArray = [NSMutableArray array];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-130) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"FollowCell" bundle:nil] forCellReuseIdentifier:@"FollowCell"];
    _tableView.rowHeight = 100;
    _tableView.backgroundColor = [UIColor whiteColor];
    
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

- (void)handleAction:(UIButton *)sender{
    
    _isOpen = !_isOpen;
    if (_isOpen) {
        [sender setTitle:@"隐藏已完成的任务" forState:(UIControlStateNormal)];
    }else{
        [sender setTitle:@"显示已完成的任务" forState:(UIControlStateNormal)];
    }
    [_tableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 5;
    }else
    {
        if (_isOpen) {
            return 2;
        }else
        {
            return 0;
        }
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.05;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }else
    {
        return 0.05;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *firstFooter = [[UIView alloc] initWithFrame:self.theButton.frame];
    if (section == 0) {
    
        [firstFooter addSubview:self.theButton];
    }
    
    return firstFooter;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"FollowCell";
    FollowCell *cell2 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (cell2 == nil)
    {
        cell2 = [[FollowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell1.nameLable.text = dataArray[indexPath.row];
 
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:cell2.contentLable.text attributes:attribtDic];
    cell2.contentLable.attributedText = attribtStr;
//    cell2.contentLable.textColor = [UIColor colorWithHexString:@"999999"];

    return cell2;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FollowTaskDetailVC* VC  =[FollowTaskDetailVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}


- (IBAction)newTaskAction:(UIButton *)sender {
    
    NewFollowTaskVC* VC = [NewFollowTaskVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}


@end

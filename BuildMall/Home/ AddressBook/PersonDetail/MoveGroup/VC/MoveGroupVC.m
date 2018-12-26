//
//  MoveGroupVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "MoveGroupVC.h"
#import "MoveGroupCell.h"
#import "AddGroupView.h"

@interface MoveGroupVC ()<UITableViewDelegate,UITableViewDataSource,AddGroupViewDelegate>

@property(nonatomic,strong)UITableView* tableView;


@end

@implementation MoveGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"转移分组";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"MoveGroupCell" bundle:nil] forCellReuseIdentifier:@"MoveGroupCell"];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    
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
    
    //    [self refreshing];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;

    }else
    {
         return 5;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return 80;
        
    }else
    {
        return 50;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
    
        
        AddGroupView *photoView = [AddGroupView addGroupView];
        photoView.delegate = self;
        [photoView show];
        
    }else
    {
        
    
    
//    MoveGroupCell *cell = [tableView cellForRowAtIndexPath:indexPath];

//    DOPPackageListModel *model0 = self.dataArray[indexPath.row];
//
//    for (DOPPackageListModel* model in _dataArray) {
//
//        model.isSelect = NO;
//    }
//
//    model0.isSelect = YES;
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoveGroupCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:@"MoveGroupCell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        
        UIView* topView = [UIView new];
        topView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        [cell1 addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(cell1).offset(0);
            make.height.equalTo(@(10));
            
        }];
        
        UIView* boomView = [UIView new];
        boomView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        [cell1 addSubview:boomView];
        [boomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(cell1).offset(0);
            make.height.equalTo(@(10));
            
        }];
        
    }else
    {
        cell1.imgView.hidden = YES;
//        DOPPackageListModel* model = _dataArray[indexPath.row];
//        if (model.isSelect == YES) {
//
//            cell1.imageView0.image = [UIImage imageNamed:@"选中"];
//            self.priceLable.text = [NSString stringWithFormat:@"%@元",model.price];
//            _selectID = model.id;
//
//        }else
//        {
//            cell1.imageView0.image = [UIImage imageNamed:@"取消选中"];
//        }
        
    }
    
//    cell1.nameLable.text = dataArray[indexPath.row];
//    cell1.delegate = self;
    
    return cell1;
    
}


@end

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
#import "SVProgressHUD.h"

@interface MoveGroupVC ()<UITableViewDelegate,UITableViewDataSource,AddGroupViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)AddGroupView* addView;

@property(nonatomic,strong)NSMutableArray* dataArray;


@end

@implementation MoveGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"转移分组";

    _dataArray = [NSMutableArray array];
    
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
    
        [self refreshing];
    
}

-(void)refreshing
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"userId"];
    
    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    
    __weak typeof(self)weakSelf = self;
    
    [[WebClient sharedClient]userFriendsGroupGroupByUserId:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        
        if (!error) {
            if (result.code == 0) {
                
                weakSelf.dataArray = [NSMutableArray arrayWithArray:result.data];
    
                [weakSelf.tableView reloadData];
            }else
            {
                
            }
        }else
        {
            
        }
        
    }];
}

-(void)addGroupView:(AddGroupView *)addView selectBtn:(NSString *)str groupID:(NSString *)groupID
{
    __weak typeof(self) weakSelf = self;

    if ([addView.toptitle.text isEqualToString:@"转移分组"]) {
        [self.view endEditing:YES];
    
        [SVProgressHUD show];
        
        NSString* str;
        if (self.user.alias == nil) {
            str = [NSString stringWithFormat:@"%@+%@",self.user.userId,groupID];

        }else
        {
            
            if ([self.user.alias containsString:@"+"]) {
                NSArray *array = [self.user.alias componentsSeparatedByString:@"+"]; //从字符A中分隔成2个元素的数组
                NSString* str0 = [NSString stringWithFormat:@"%@",groupID];
                str = [self.user.alias stringByReplacingOccurrencesOfString:array[1] withString:str0];//替换字符

            }else
            {
                str = [NSString stringWithFormat:@"%@+%@",self.user.alias,groupID];

            }

            self.user.alias = str;

        }
        [[NIMSDK sharedSDK].userManager updateUser:self.user completion:^(NSError *error) {
            [SVProgressHUD dismiss];
            if (!error) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
                [weakSelf.addView removeFromSuperview];
                [weakSelf.addView.backgroupView removeFromSuperview];
            }else{
          
            }
        }];
        
    }else
    {
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
        [dict setObject:userInfo.userId forKey:@"userId"];
        [dict setObject:str forKey:@"name"];
        
        [[WebClient sharedClient] userFriendsGroupInsertGroup:dict complete:^(ResponseMode *result, NSError *error) {
            if (!error) {
                if (result.code == 0) {
                    [weakSelf.addView removeFromSuperview];
                    [weakSelf.addView.backgroupView removeFromSuperview];
                }
                
            }else
            {
                
            }
        }];
    }

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
         return _dataArray.count;
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
    
        _addView = [AddGroupView addGroupView];
        _addView.delegate = self;
        _addView.moveLable.hidden = YES;

        [_addView show];
        
    }else
    {
        _addView = [AddGroupView addGroupView];
        _addView.delegate = self;
        _addView.toptitle.text = @"转移分组";
        NSMutableDictionary* dict = _dataArray[indexPath.row];
        _addView.groupID = dict[@"id"];

        _addView.addTF.hidden = YES;
        _addView.moveLable.hidden = NO;
        [_addView show];
        
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

        NSMutableDictionary* dict = _dataArray[indexPath.row];
        
        cell1.nameLable.text = dict[@"groupName"];
    }
    

    
    return cell1;
    
}


@end

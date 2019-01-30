//
//  SetUpVC.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "SetUpVC.h"
#import "LoginOutView.h"
#import "AccountSaveVC.h"
#import "ForwardingSetVC.h"
#import "MessageSetVC.h"

@interface SetUpVC ()<UITableViewDelegate,UITableViewDataSource,LoginOutViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginOutBtn;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSMutableArray* dataArray;
@end

@implementation SetUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"设置";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, 150) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    NSArray* dataArray = @[@"账号与安全",@"消息设置",@"转发设置"];
    _dataArray = [NSMutableArray arrayWithArray:dataArray];
    _tableView.tableFooterView = [UIView new];
    _loginOutBtn.layer.masksToBounds = YES;
    _loginOutBtn.layer.cornerRadius = 5;
    _tableView.bounces = NO;
}

//退出登录
-(void)didClickOutButton:(UIButton *)btn
{
    
}

- (IBAction)loginOutAction:(UIButton *)sender {
    LoginOutView* outView = [LoginOutView loginOut];
    outView.delegate = self;
    [outView show];
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
        AccountSaveVC* VC = [AccountSaveVC new];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 1)
    {
        MessageSetVC* VC = [MessageSetVC new];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 2)
    {
        ForwardingSetVC* VC = [ForwardingSetVC new];
        
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end

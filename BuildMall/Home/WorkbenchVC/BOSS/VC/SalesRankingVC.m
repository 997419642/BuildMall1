//
//  SalesRankingVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/23.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SalesRankingVC.h"

#import "SalesRankingCell.h"
#import "WorkPersonDetailVC.h"

@interface SalesRankingVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIButton* seleBtn;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *customerBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;


@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray *dataArray;

@property (weak, nonatomic) IBOutlet UIView *dateView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *deteOne;


@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIButton* deteSelectBtn;

@end

@implementation SalesRankingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self creatUI];
    
    _seleBtn = _oneBtn;
    _selectBtn = _customerBtn;
    _deteSelectBtn = _deteOne;
    _top.constant = 10;
    _dateView.hidden = YES;


    
    _oneBtn.layer.borderWidth = 1;
    _oneBtn.layer.borderColor = MINE_Color.CGColor;

    _twoBtn.layer.borderWidth = 1;
    _twoBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    
    _threeBtn.layer.borderWidth = 1;
    _threeBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    _fourBtn.layer.borderWidth = 1;
    _fourBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 128, screenW, self.view.height-128-64-50) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_lineView.mas_bottom).offset(0);
        make.bottom.equalTo(self.view);
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 88;
    [_tableView registerNib:[UINib nibWithNibName:@"SalesRankingCell" bundle:nil] forCellReuseIdentifier:@"SalesRankingCell"];
    
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
- (IBAction)deteAction:(UIButton *)sender {
    
    if (self.deteSelectBtn == sender) {
        return;
    }
    
    
    self.deteSelectBtn.selected = !self.deteSelectBtn.selected;
    
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {
      
            
        }else if(sender.tag == 1){
            
        }
        
    }else
    {
        sender.selected = NO;
    }
    
    self.deteSelectBtn = sender;
}

- (IBAction)CustormAction:(UIButton *)sender {
    
    if (self.selectBtn == sender) {
        return;
    }
    
    
    self.selectBtn.selected = !self.selectBtn.selected;
    
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {
            _dateView.hidden = YES;
            _top.constant = 10;
            
        }else if(sender.tag == 1){
            _dateView.hidden = NO;

            _top.constant = 40;
        }
        
    }else
    {
        sender.selected = NO;
    }
    
    self.selectBtn = sender;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 18;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    WorkPersonDetailVC* VC  =[WorkPersonDetailVC new];
    [self.navigationController pushViewController:VC animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"SalesRankingCell";
    SalesRankingCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
 
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell1.nameLable.text = dataArray[indexPath.row];
    
    //        cell1.delegate = self;
    return cell1;
    
}



- (IBAction)btnAction:(UIButton *)sender {
    
    if (self.seleBtn == sender) {
        return;
    }
    
    self.seleBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;

    self.seleBtn.selected = !self.seleBtn.selected;
    

    if (sender.selected == NO) {
        sender.selected = YES;
        sender.layer.borderColor = MINE_Color.CGColor;
        if (sender.tag == 0) {
            
        }else if(sender.tag == 1){
            
        }
        
    }else
    {
        sender.selected = NO;

    }
    
    self.seleBtn = sender;
    
}


-(void)creatUI
{
    UIButton* oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [oneBtn setTitle:@"按客户人数" forState:UIControlStateNormal];
    [oneBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [oneBtn setTitleColor:MINE_Color forState:UIControlStateSelected];
    oneBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    oneBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    oneBtn.layer.borderWidth = 1;
    oneBtn.tag = 0;
    oneBtn.selected = YES;
    _seleBtn = oneBtn;
    [self.view addSubview:oneBtn];
    
    UIButton* twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [twoBtn setTitle:@"按订单量" forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [twoBtn setTitleColor:MINE_Color forState:UIControlStateSelected];
    twoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    twoBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    twoBtn.layer.borderWidth = 1;
    twoBtn.tag = 0;
    [self.view addSubview:twoBtn];
    
    
    UIButton* threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [threeBtn setTitle:@"按互动频率" forState:UIControlStateNormal];
    [threeBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [threeBtn setTitleColor:MINE_Color forState:UIControlStateSelected];
    threeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    threeBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    threeBtn.layer.borderWidth = 1;
    threeBtn.tag = 0;
    [self.view addSubview:threeBtn];
    
    
    
    UIButton* fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fourBtn setTitle:@"按成交率区间" forState:UIControlStateNormal];
    [fourBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [fourBtn setTitleColor:MINE_Color forState:UIControlStateSelected];
    fourBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    fourBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    fourBtn.layer.borderWidth = 1;
    fourBtn.tag = 0;
    [self.view addSubview:fourBtn];
    
    
    
}


@end

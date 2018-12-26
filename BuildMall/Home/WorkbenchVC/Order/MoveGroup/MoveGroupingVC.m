//
//  MoveGroupingVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "MoveGroupingVC.h"
#import "MoveGroupingCell.h"
#import "MoveGroupingModel.h"

@interface MoveGroupingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)MoveGroupingModel* model0;


@end

@implementation MoveGroupingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"转移分组";
    
    _dataArray = [NSMutableArray array];
    _cancelBtn.layer.masksToBounds =YES;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.borderWidth = 1;
    _cancelBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.layer.cornerRadius = 5;
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-100) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 113;
    [_tableView registerNib:[UINib nibWithNibName:@"MoveGroupingCell" bundle:nil] forCellReuseIdentifier:@"MoveGroupingCell"];
    
    UIView* view = [UIView new];
 
    _tableView.tableFooterView = view;
    
    [self refreshing];
    
}
-(void)refreshing
{
    
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    AMUserAccountInfo *userInfo = [AMUserAccountInfo shareInfo];
    [dict setObject:userInfo.storeId forKey:@"storeId"];
    
//    NSMutableArray* arr = [NSMutableArray array];
//
//    NSString* jsonstr = [arr mj_JSONString];
//    [dict setObject:jsonstr forKey:@"attributeList"];
    
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_footer resetNoMoreData];
    
    __weak typeof(self)weakSelf = self;
    
    [[WebClient sharedClient]orderPaymentList:dict complete:^(ResponseMode *result, NSError *error) {
        
        if (weakSelf.tableView.mj_header.isRefreshing) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        
        if (!error) {
            if (result.code == 0) {
                
                weakSelf.dataArray = [MoveGroupingModel mj_objectArrayWithKeyValuesArray:result.data];
                
                [weakSelf.tableView reloadData];
            }else
            {
                
            }
        }else
        {
            
        }
        
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoveGroupingModel* model = _dataArray[indexPath.row];
    
    for (MoveGroupingModel* model0 in _dataArray) {
        model0.isSelct = NO;
    }
    if (model.isSelct == NO) {
        model.isSelct  = YES;

    }else
    {

    }
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"MoveGroupingCell";
    MoveGroupingCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    MoveGroupingModel* model = _dataArray[indexPath.row];
    cell1.model = model;
    if (model.isSelct == YES) {
        cell1.imgView.image = [UIImage imageNamed:@"Check"];
        _model0 = model;
        
        
    }else
    {
        cell1.imgView.image = [UIImage imageNamed:@"un-Check"];

    }
//    cell1.delegate = self;
    
    return cell1;
}

- (IBAction)cancelAction:(id)sender {
    
}

- (IBAction)sureAction:(id)sender {
    
    self.slectAccountIdBlock(_model0);
    [self.navigationController popViewControllerAnimated:YES];
}

@end

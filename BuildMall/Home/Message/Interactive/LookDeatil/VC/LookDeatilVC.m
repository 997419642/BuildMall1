//
//  LookDeatilVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "LookDeatilVC.h"
#import "LookDetailCell.h"
#import "TimeChooseView.h"
#import "DOPDatePickerView.h"
#import "CustomerDetailVC.h"

@interface LookDeatilVC ()<UITableViewDelegate,UITableViewDataSource,TimeChooseViewDelegate,DatePickerViewDelegate>


@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)TimeChooseView *timeChooseView;

@property(nonatomic,strong)DOPDatePickerView * pikerView;
@property (weak, nonatomic) IBOutlet UIButton *deleBtn;

@end

@implementation LookDeatilVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _timeChooseView = [TimeChooseView timeChooseView];
    _timeChooseView.delegate = self;
    
    _deleBtn.hidden = YES;
    _dataArray = [NSMutableArray array];
    self.navigationItem.title = @"查看产品";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, screenW, screenH-40-50) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 120;
    [_tableView registerNib:[UINib nibWithNibName:@"LookDetailCell" bundle:nil] forCellReuseIdentifier:@"LookDetailCell"];
    
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
- (IBAction)deleAction:(UIButton *)sender {
}

- (IBAction)timeChooseAction:(UIButton *)sender {
    
    [_timeChooseView show];
}
-(void)changeButtonStatus{
    _timeChooseView.leftbtn.enabled = YES;
}

-(void)didClickLeftChooseButton
{
    _timeChooseView.leftbtn.enabled = NO;
    _timeChooseView.rightBtn.enabled = NO;
    _pikerView = [DOPDatePickerView datePickerView];
    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    
    _pikerView.delegate = self;
    _pikerView.type = 0;
    _pikerView.frame= CGRectMake(0, screenH, screenW, 257);
    [[UIApplication sharedApplication].keyWindow addSubview:_pikerView];
    
    
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _pikerView.frame = CGRectMake(0, screenH-257, screenW, 257);
    } completion:^(BOOL finished) {
    }];
    
    
}

-(void)cancelBtn
{
    [_pikerView removeFromSuperview];
    _timeChooseView.leftbtn.enabled = YES;
    _timeChooseView.rightBtn.enabled = YES;
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _pikerView.frame = CGRectMake(0, screenH, screenW, 257);
    } completion:^(BOOL finished) {
        [self.pikerView removeFromSuperview];
        self.pikerView = nil;
        _timeChooseView.leftbtn.enabled = YES;
        _timeChooseView.rightBtn.enabled = YES;
    }];
    if (type==0) {
        
        [_timeChooseView.leftbtn setTitle:date forState:UIControlStateNormal];
        [_timeChooseView.leftbtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    }else
    {
        [_timeChooseView.rightBtn setTitle:date forState:UIControlStateNormal];
        [_timeChooseView.rightBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    }
}

-(void)didClickSureButton
{
    [_pikerView removeFromSuperview];
    [_timeChooseView.backgroupView removeFromSuperview];
    [_timeChooseView removeFromSuperview];
    
}

-(void)didClickRightChooseButton
{
    
    _pikerView = [DOPDatePickerView datePickerView];
    
    _timeChooseView.leftbtn.enabled = NO;
    _timeChooseView.rightBtn.enabled = NO;
    
    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    
    _pikerView.delegate = self;
    _pikerView.type = 1;
    _pikerView.frame= CGRectMake(0, screenH, screenW, 257);
    [[UIApplication sharedApplication].keyWindow addSubview:_pikerView];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _pikerView.frame = CGRectMake(0, screenH-257, screenW, 257);
    } completion:^(BOOL finished) {
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 18;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomerDetailVC* VC = [CustomerDetailVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *identifier1 = @"LookDetailCell";
    LookDetailCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (cell1 == nil)
    {
        cell1 = [[LookDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
    }
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell1.nameLable.text = dataArray[indexPath.row];
    
    //        cell1.delegate = self;
    return cell1;
    
}


@end

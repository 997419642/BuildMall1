//
//  RecordVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "RecordVC.h"

#import "RecordHeadView.h"
#import "RecordCell.h"

#import "TimeChooseView.h"
#import "DOPDatePickerView.h"

@interface RecordVC ()<UITableViewDelegate,UITableViewDataSource,TimeChooseViewDelegate,DatePickerViewDelegate>

{
    NSInteger _page;
    NSArray* dataArray;
    NSArray* imgArray;
}

@property(nonatomic,strong)UITableView* tableView;

@property(nonatomic,strong)RecordHeadView *headView;

@property (nonatomic,strong)TimeChooseView *timeChooseView;

@property(nonatomic,strong)DOPDatePickerView * pikerView;





@end

@implementation RecordVC

- (RecordHeadView *)headView{
    if (_headView == nil) {
        _headView = [[RecordHeadView alloc]init];
//        _headView.delegate = self;
    
        _headView.frame = CGRectMake(0, 0, screenW, 150);
    }
    return _headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _timeChooseView = [TimeChooseView timeChooseView];
    _timeChooseView.delegate = self;
    
    UILabel* lable = [[UILabel alloc] init];
    lable.text = @"7天内被查看的行为统计";
//    lable.font = [UIFont fontWithName:@"PingFang" size:14];

    lable.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:lable];

    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(10);
    }];
    lable.textColor = [UIColor colorWithHexString:@"666666"];
    
    UIButton* deleBtn = [UIButton new];
    [deleBtn setImage:[UIImage imageNamed:@"iconcancel"] forState:UIControlStateNormal];
    [self.view addSubview:deleBtn];
    
    [deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable.mas_right).offset(3);
        make.centerY.equalTo(lable);
        make.width.height.equalTo(@(30));

    }];
    
    
    UIButton* timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenW-50, 4, 30, 30)];
    
    [timeBtn setImage:[UIImage imageNamed:@"check_product"] forState:UIControlStateNormal];
    [self.view addSubview:timeBtn];
    [timeBtn addTarget:self action:@selector(timeChooseAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* lineview = [[UIView alloc] init];
    lineview.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(20);
        make.top.equalTo(lable.mas_bottom).offset(10);
        make.height.equalTo(@(1));
    }];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, screenW, screenH-64-50-40-40) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"RecordCell" bundle:nil] forCellReuseIdentifier:@"RecordCell"];
    _tableView.rowHeight = 50;
    
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
    _tableView.tableHeaderView = self.headView;
    
    dataArray = @[@"查看名片",@"查看动态",@"咨询产品",@"保存电话",@"觉得靠谱",@"咨拨打电话",@"播放语音",@"复制邮箱"];
    imgArray = @[@"iconeye",@"icon_check the dynamic",@"iconconsulting",@"iconsave",@"icongood",@"iconcall",@"iconvoice",@"iconcopy"];
    
//    [self refreshing];

}

-(void)timeChooseAction:(UIButton *)sender
{
    [_timeChooseView show];
}

-(void)didClickLeftChooseButton
{
    
    _pikerView = [DOPDatePickerView datePickerView];
    
    _timeChooseView.leftbtn.enabled = NO;
    _timeChooseView.rightBtn.enabled = NO;
    
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
  
    return dataArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        NSString *identifier1 = @"RecordCell";
        RecordCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        if (cell1 == nil)
        {
            cell1 = [[RecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell1.nameLable.text = dataArray[indexPath.row];
        cell1.imgView.image = [UIImage imageNamed:imgArray[indexPath.row]];
        
        //        cell1.delegate = self;
        return cell1;
    
}



@end

//
//  CustomerVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "CustomerVC.h"
#import "CustomerTwoCell.h"
#import "CustomerCell.h"
#import "NetWorkHelper.h"

#import "TimeChooseView.h"
#import "DOPDatePickerView.h"
#import "LookDeatilVC.h"

@interface CustomerVC ()<UITableViewDelegate,UITableViewDataSource,TimeChooseViewDelegate,DatePickerViewDelegate>


@property(nonatomic,strong)UITableView* tableView;

@property (nonatomic, strong) NSMutableArray *tempMArray; // 用于判断手风琴的某个层级是否展开

@property (nonatomic, strong) NSMutableArray *mArray;

@property (nonatomic,strong)NSMutableDictionary* dataDic;

@property (nonatomic,strong)TimeChooseView *timeChooseView;

@property(nonatomic,strong)DOPDatePickerView * pikerView;




@end

@implementation CustomerVC

- (NSMutableArray *)tempMArray{

    if (!_tempMArray) {

        _tempMArray = [[NSMutableArray alloc]init];
    }
    return _tempMArray;
}

-(NSMutableArray *)mArray{

    if (!_mArray) {

        _mArray = [[NSMutableArray alloc]init];
    }
    return _mArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _timeChooseView = [TimeChooseView timeChooseView];
    _timeChooseView.delegate = self;
    
    UILabel* lable = [[UILabel alloc] init];
    lable.text = @"7天内被查看的行为统计";
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

    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, screenW, screenH-64-50-40-40) style:UITableViewStyleGrouped];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"CustomerCell" bundle:nil] forCellReuseIdentifier:@"CustomerCell"];

    [_tableView registerNib:[UINib nibWithNibName:@"CustomerTwoCell" bundle:nil] forCellReuseIdentifier:@"CustomerTwoCell"];
    
    [self personRequest];


}

-(void)timeChooseAction:(UIButton *)sender
{

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

-(void)personRequest
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setObject:@"1174" forKey:@"userid"];
    __weak typeof(self)weakSelf = self;

    NSString *str = [NSString stringWithFormat:@"%@/api/v2.user/merchants",webUrlOld];

    [[NetWorkHelper shareNetWorkEngine] GetRequestNetInfoWithURLStrViaNet:str parameters:dict success:^(id responseObject) {
        NSDictionary *diction = [NetWorkHelper dataToDictionary:responseObject];
        if (_tableView.mj_header.isRefreshing) {
            [_tableView.mj_header endRefreshing];
        }
        if([diction[@"status"] floatValue] == 0) {
            
            weakSelf.dataDic = (NSMutableDictionary*)diction;
            NSLog(@"geggggg请求成功%@",diction);
            [weakSelf loadData];
            [weakSelf.tableView reloadData];
            
        }else
        {
          
        }
        
    } failur:^(id error) {
    
    }];
}

-(void)loadData
{

    
    NSArray* arr = self.dataDic[@"info"][@"m_store_item"];
    
    [self.mArray removeAllObjects];
    [self.tempMArray removeAllObjects];
    
    for (int i = 0; i < arr.count; i++) {
        
        NSMutableDictionary *mDic = arr[i];
        
        NSMutableArray *mArr = [[NSMutableArray alloc]init];
        
        NSArray* arr0 = mDic[@"m_store_ref_item"];
        
        for (int j = 0; j < arr0.count; j++) {
            
            NSMutableDictionary* nameDic = arr0[j];
            
//            [nameDic setObject:@"0" forKey:@"select"];
            [mArr addObject:nameDic];
        }
        [mDic setObject:mArr forKey:@"mArr"];
        [self.mArray addObject:mDic];
        [self.tempMArray addObject:@"0"];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.tempMArray.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if ([self.tempMArray[section] isEqualToString:@"0"]) {

        return 0;
    }else{
        // 如果是展开的则给这个分区加一个cell用来放此分区的标题cell
        NSArray *array = self.mArray[section][@"mArr"];
        return array.count;
   
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomerTwoCell *employeesCell = [tableView dequeueReusableCellWithIdentifier:@"CustomerTwoCell"];
    employeesCell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *array=self.mArray[indexPath.section][@"mArr"];

    NSMutableDictionary* dic1 = array[indexPath.row];
//    employeesCell.numLabel.text = dic1[@"u_name"];

    employeesCell.imgWidth.constant = 10*200/30;

    return employeesCell;
}



// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    CustomerCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"CustomerCell"];
//    headerCell.nameLable.text = [NSString stringWithFormat:@"%@(%@)人",self.mArray[section][@"s_name"],self.mArray[section][@"m_count"]];
    headerCell.tag = section + 1000;
    headerCell.rightBtn.selected = [self.tempMArray[section] isEqualToString:@"1"];
 
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [headerCell addGestureRecognizer:tap];
    return headerCell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90;
}

- (void)tapAction:(UITapGestureRecognizer *)sender{

    CustomerCell *cell = (CustomerCell *)sender.view;
    [self.tempMArray[cell.tag - 1000] isEqualToString:@"0"]?[self.tempMArray replaceObjectAtIndex:cell.tag - 1000 withObject:@"1"]:[self.tempMArray replaceObjectAtIndex:cell.tag - 1000 withObject:@"0"];
    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSMutableArray *array=self.mArray[indexPath.section][@"mArr"];
    NSMutableDictionary* selectdDic = array[indexPath.row];
    

    LookDeatilVC* VC = [LookDeatilVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
}




@end

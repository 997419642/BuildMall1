//
//  OverviewVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/23.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OverviewVC.h"

#import "FzhDrawChart.h"
#import "BuildMall-Bridging-Header.h"
#import "AAChartKit.h"


@interface OverviewVC ()<ChartViewDelegate>

@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIButton* selectBtn;
@property(nonatomic, strong)HorizontalBarChartView *TwoChartView;
@property(nonatomic, strong)LineChartView *chartView;
@property(nonatomic, strong)LineChartView *moreChartView;
@property(nonatomic,strong)LineChartView* addChartView;
/** citys */
@property (nonatomic, strong) NSArray *citys;
/** data */
@property (nonatomic, strong) NSArray *datas;
@property(nonatomic, strong)FzhDrawChart *drawView;//画图的view
@property(nonatomic, strong)NSArray *x_arr;//x轴数据数组
@property(nonatomic, strong)NSArray *y_arr;//y轴数据数组
@property(nonatomic, strong)NSArray *linex_arr;//x轴数据数组
@property(nonatomic, strong)NSArray *liney_arr;//y轴数据数组
@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@property (nonatomic, strong)UILabel* mallLable;
@property (nonatomic, strong)UILabel* addLable;

@property (nonatomic, strong)UILabel* taskLable;
@property(nonatomic,strong)LineChartView* taskChartView;

@property (nonatomic, strong)UILabel* followLable;
@property(nonatomic,strong)LineChartView* followChartView;


@end

@implementation OverviewVC

- (NSArray *)x_arr
{
    if (!_x_arr) {
        _x_arr = @[@"对我", @"对产品", @"对公司"];
    }
    return _x_arr;
}

- (NSArray *)y_arr
{
    if (!_y_arr) {
        
        _y_arr = @[@"47.62", @"33.33", @"19.05"];
    }
    return _y_arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
        
    }];
    
    NSArray* arr = @[@"汇总",@"昨日",@"近7天",@"近30天"];
    NSMutableArray* array = [NSMutableArray arrayWithArray:arr];
    
    UIButton* lastButton = nil;
    
    for (int i= 0; i<array.count; i++) {
        UIButton* btn = [UIButton new];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [btn setTitleColor:MINE_Color forState:UIControlStateSelected];
        btn.layer.masksToBounds =YES;
        btn.layer.borderWidth = 1;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
        if (i == 0) {
            btn.layer.borderColor = MINE_Color.CGColor;
            btn.selected = YES;
            _selectBtn = btn;
        }
        [_scrollView addSubview:btn];
        [btn addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_scrollView).offset(15);
            float width = (screenW-40-16*3)/4;
            make.width.equalTo(@(width));
            float top = (20 + i/1*width+15*i);
            make.left.equalTo(_scrollView).offset(top);
            make.height.equalTo(@(23));
        }];
        
        lastButton = btn;
        
    }
    
    NSArray* twoArr = @[@"新增客户总数",@"浏览客户数",@"跟进客户数",@"沟通客户数",@"商城销售金额",@"商城订单数",@"被转发次数",@"被保存次数",@"被点赞次数"];
    NSArray* twoNumArr = @[@"30",@"0",@"1706",@"73",@"40",@"79",@"73",@"40",@"79"];
    NSMutableArray* twoNumarray = [NSMutableArray arrayWithArray:twoNumArr];
    NSMutableArray* twoArray = [NSMutableArray arrayWithArray:twoArr];
    
    CGFloat marginX = 30;//按钮距离左边和右边的距离
    CGFloat gapX = 10; //左右按钮之间的距离
    CGFloat gapY = 10; //上下按钮之间的距离
    NSInteger col = 3;  //布局3列
    
    UIImageView *last = nil;
    

    for (int i=0; i<twoArray.count; i++) {
        
        UIImageView* imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:@""];
        
        imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_scrollView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {\
            
            float width = (screenW-60-10*2)/3;
            make.width.equalTo(@(width));
            
            make.height.equalTo(@(width+20));
            
            CGFloat top = 10 + (i / col) * ((width+20) + gapY);
            
            make.top.equalTo(lastButton.mas_bottom).offset(top);
            
            
            if (!last || (i%col) == 0) {
                make.left.mas_offset(marginX);
                
            }else
            {
                make.left.mas_equalTo(last.mas_right).offset(gapX);
            }
            
        }];
        
        last = imgView;
        
        UILabel* oneLable = [UILabel new];
        oneLable.text = twoArr[i];
        oneLable.textColor = [UIColor colorWithHexString:@"666666"];
        oneLable.font = [UIFont systemFontOfSize:12];
        [imgView addSubview:oneLable];
        [oneLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgView).offset(30);
            make.centerX.equalTo(imgView);
        }];
        
        UILabel* twoLable = [UILabel new];
        twoLable.text = twoNumarray[i];
        twoLable.textColor = [UIColor colorWithHexString:@"333333"];
        twoLable.font = [UIFont systemFontOfSize:20];
        [imgView addSubview:twoLable];
        [twoLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(oneLable).offset(50);
            make.centerX.equalTo(imgView);
        }];
        
    }
    
    
    _linex_arr = @[@"10-11",@"10-12", @"10-13",@"10-14",@"10-15", @"10-16",@"10.17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22", @"10.23",@"10-24",@"10-25"];
    _liney_arr = @[@"0", @"0", @"0",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"2",@"0",@"0",@"0",@"0"];
    
    UIView* oneLine = [UIView new];
    oneLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:oneLine];
    [oneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(last.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    
    UILabel* chengjiaoLable = [UILabel new];
    chengjiaoLable.text = @"成交率漏斗";
    chengjiaoLable.textColor = [UIColor colorWithHexString:@"333333"];
    chengjiaoLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:chengjiaoLable];
    [chengjiaoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(last.mas_bottom).offset(30);
    }];
    
    
    self.aaChartView = [[AAChartView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.aaChartView.scrollEnabled = NO;
    self.aaChartView.contentHeight = self.aaChartView.frame.size.height-10;
    [_scrollView addSubview:self.aaChartView];
    
    self.aaChartModel = [self configureTheChartModel:@"funnel"];
//    self.aaChartModel.colorsTheme = [self configureTheRandomColorArray];

    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];

    [_aaChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(chengjiaoLable.mas_bottom).offset(20);
        make.height.equalTo(@(300));
        make.left.right.equalTo(_scrollView).offset(20);
    }];
    
    UIView* otwoLine = [UIView new];
    otwoLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:otwoLine];
    [otwoLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_aaChartView.mas_bottom).offset(0);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    UILabel* mallLable = [UILabel new];
    _mallLable = mallLable;
    mallLable.text = @"商城订单量&交易金额";
    mallLable.textColor = [UIColor colorWithHexString:@"333333"];
    mallLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:mallLable];
    [mallLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_aaChartView.mas_bottom).offset(30);
    }];
    
    UIButton* mallOneBtn = [UIButton new];
    [mallOneBtn setTitle:@"近15天" forState:UIControlStateNormal];
    
    mallOneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [mallOneBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    mallOneBtn.layer.masksToBounds = YES;
    mallOneBtn.layer.cornerRadius = 2;
    mallOneBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    mallOneBtn.layer.borderWidth = 1;
    [_scrollView addSubview:mallOneBtn];
    [mallOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mallLable.mas_bottom).offset(15);
        make.centerX.equalTo(_scrollView);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
    }];
    
    
    UIButton* mallleftBtn = [UIButton new];
    [mallleftBtn setTitle:@"近7天" forState:UIControlStateNormal];
    
    mallleftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [mallleftBtn setTitleColor:[UIColor colorWithHexString:@"306A9C"] forState:UIControlStateNormal];
    
    mallleftBtn.layer.masksToBounds = YES;
    mallleftBtn.layer.cornerRadius = 2;
    mallleftBtn.layer.borderColor = [UIColor colorWithHexString:@"306A9C"].CGColor;
    mallleftBtn.layer.borderWidth = 1;
    [_scrollView addSubview:mallleftBtn];
    [mallleftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(mallOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.right.equalTo(mallOneBtn.mas_left).offset(-30);
    }];
    
    
    UIButton* mallRightBtn = [UIButton new];
    [mallRightBtn setTitle:@"近30天" forState:UIControlStateNormal];
    
    mallRightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [mallRightBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    mallRightBtn.layer.masksToBounds = YES;
    mallRightBtn.layer.cornerRadius = 2;
    mallRightBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    mallRightBtn.layer.borderWidth = 1;
    [_scrollView addSubview:mallRightBtn];
    [mallRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(addLable.mas_bottom).offset(15);
        make.centerY.equalTo(mallOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.left.equalTo(mallOneBtn.mas_right).offset(30);
        
    }];
    
    
    [self creatMoreLineView];
    
    
    UIView* threeLine = [UIView new];
    threeLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:threeLine];
    [threeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moreChartView.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    
    UILabel* addLable = [UILabel new];
    addLable.text  = @"新增客户数";
    _addLable = addLable;
    addLable.textColor = [UIColor colorWithHexString:@"333333"];
    addLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:addLable];
    [addLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_moreChartView.mas_bottom).offset(25);
    }];
    
    UIButton* addOneBtn = [UIButton new];
    [addOneBtn setTitle:@"近15天" forState:UIControlStateNormal];

    addOneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [addOneBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];

    addOneBtn.layer.masksToBounds = YES;
    addOneBtn.layer.cornerRadius = 2;
    addOneBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    addOneBtn.layer.borderWidth = 1;
    [_scrollView addSubview:addOneBtn];
    [addOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addLable.mas_bottom).offset(15);
        make.centerX.equalTo(_scrollView);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
    }];
    
    
    UIButton* addleftBtn = [UIButton new];
    [addleftBtn setTitle:@"近7天" forState:UIControlStateNormal];
    
    addleftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [addleftBtn setTitleColor:[UIColor colorWithHexString:@"306A9C"] forState:UIControlStateNormal];
    
    addleftBtn.layer.masksToBounds = YES;
    addleftBtn.layer.cornerRadius = 2;
    addleftBtn.layer.borderColor = [UIColor colorWithHexString:@"306A9C"].CGColor;
    addleftBtn.layer.borderWidth = 1;
    [_scrollView addSubview:addleftBtn];
    [addleftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.right.equalTo(addOneBtn.mas_left).offset(-30);
    }];
    
    
    UIButton* addRightBtn = [UIButton new];
    [addRightBtn setTitle:@"近30天" forState:UIControlStateNormal];
    
    addRightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [addRightBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    addRightBtn.layer.masksToBounds = YES;
    addRightBtn.layer.cornerRadius = 2;
    addRightBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    addRightBtn.layer.borderWidth = 1;
    [_scrollView addSubview:addRightBtn];
    [addRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(addLable.mas_bottom).offset(15);
        make.centerY.equalTo(addOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.left.equalTo(addOneBtn.mas_right).offset(30);

    }];
    
    
    [self scretNewAddChartView];
    
    
    UILabel* taskLable = [UILabel new];
    taskLable.text = @"咨询客户数";
    _taskLable = taskLable;
    taskLable.textColor = [UIColor colorWithHexString:@"333333"];
    taskLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:taskLable];
    [taskLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_addChartView.mas_bottom).offset(20);
    }];
    
    UIButton* taskOneBtn = [UIButton new];
    [taskOneBtn setTitle:@"近15天" forState:UIControlStateNormal];
    
    taskOneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [taskOneBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    taskOneBtn.layer.masksToBounds = YES;
    taskOneBtn.layer.cornerRadius = 2;
    taskOneBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    taskOneBtn.layer.borderWidth = 1;
    [_scrollView addSubview:taskOneBtn];
    [taskOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(taskLable.mas_bottom).offset(15);
        make.centerX.equalTo(_scrollView);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
    }];
    
    
    UIButton* taskleftBtn = [UIButton new];
    [taskleftBtn setTitle:@"近7天" forState:UIControlStateNormal];
    
    taskleftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [taskleftBtn setTitleColor:[UIColor colorWithHexString:@"306A9C"] forState:UIControlStateNormal];
    
    taskleftBtn.layer.masksToBounds = YES;
    taskleftBtn.layer.cornerRadius = 2;
    taskleftBtn.layer.borderColor = [UIColor colorWithHexString:@"306A9C"].CGColor;
    taskleftBtn.layer.borderWidth = 1;
    [_scrollView addSubview:taskleftBtn];
    [taskleftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(taskOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.right.equalTo(taskOneBtn.mas_left).offset(-30);
    }];
    
    
    UIButton* taskRightBtn = [UIButton new];
    [taskRightBtn setTitle:@"近30天" forState:UIControlStateNormal];
    
    taskRightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [taskRightBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    taskRightBtn.layer.masksToBounds = YES;
    taskRightBtn.layer.cornerRadius = 2;
    taskRightBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    taskRightBtn.layer.borderWidth = 1;
    [_scrollView addSubview:taskRightBtn];
    [taskRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(addLable.mas_bottom).offset(15);
        make.centerY.equalTo(taskOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.left.equalTo(taskOneBtn.mas_right).offset(30);
        
    }];
    

    [self creatTaskChartView];
    
    UILabel* followLable = [UILabel new];
    followLable.text = @"跟进客户数";
    _followLable = followLable;
    followLable.textColor = [UIColor colorWithHexString:@"333333"];
    followLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:followLable];
    [followLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_taskChartView.mas_bottom).offset(20);
    }];
    
    UIButton* followOneBtn = [UIButton new];
    [followOneBtn setTitle:@"近15天" forState:UIControlStateNormal];
    
    followOneBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [followOneBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    followOneBtn.layer.masksToBounds = YES;
    followOneBtn.layer.cornerRadius = 2;
    followOneBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    followOneBtn.layer.borderWidth = 1;
    [_scrollView addSubview:followOneBtn];
    [followOneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(followLable.mas_bottom).offset(15);
        make.centerX.equalTo(_scrollView);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
    }];
    
    
    UIButton* followleftBtn = [UIButton new];
    [followleftBtn setTitle:@"近7天" forState:UIControlStateNormal];
    
    followleftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [followleftBtn setTitleColor:[UIColor colorWithHexString:@"306A9C"] forState:UIControlStateNormal];
    
    followleftBtn.layer.masksToBounds = YES;
    followleftBtn.layer.cornerRadius = 2;
    followleftBtn.layer.borderColor = [UIColor colorWithHexString:@"306A9C"].CGColor;
    followleftBtn.layer.borderWidth = 1;
    [_scrollView addSubview:followleftBtn];
    [followleftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(followOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.right.equalTo(followOneBtn.mas_left).offset(-30);
    }];
    
    
    UIButton* followRightBtn = [UIButton new];
    [followRightBtn setTitle:@"近30天" forState:UIControlStateNormal];
    
    followRightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [followRightBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    
    followRightBtn.layer.masksToBounds = YES;
    followRightBtn.layer.cornerRadius = 2;
    followRightBtn.layer.borderColor = [UIColor colorWithHexString:@"666666"].CGColor;
    followRightBtn.layer.borderWidth = 1;
    [_scrollView addSubview:followRightBtn];
    [followRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(addLable.mas_bottom).offset(15);
        make.centerY.equalTo(followOneBtn);
        make.width.equalTo(@(60));
        make.height.equalTo(@(20));
        make.left.equalTo(followOneBtn.mas_right).offset(30);
        
    }];
    
    [self creatfollowChartView];
    
    UIView* fourLine = [UIView new];
    fourLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:fourLine];
    [fourLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_followChartView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    
    UILabel* topLable = [UILabel new];
    topLable.text = @"客户兴趣占比";
    topLable.textColor = [UIColor colorWithHexString:@"333333"];
    topLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:topLable];
    [topLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_followChartView.mas_bottom).offset(30);
    }];
    
    self.drawView = [[FzhDrawChart alloc] initWithFrame:CGRectMake(20, 50, screenW-20, 300)];
    self.drawView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:self.drawView];
    [_drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(0);
        make.top.equalTo(topLable.mas_bottom).offset(0);
        make.height.equalTo(@(300));
    }];
    //画饼状图
    [self.drawView drawBingZhuangTu:self.x_arr and:self.y_arr];
    
    
    UIView* fiveLine = [UIView new];
    fiveLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:fiveLine];
    [fiveLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_drawView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    
    UILabel* twoLable = [UILabel new];
    twoLable.text = @"客户与我的互动";
    twoLable.textColor = [UIColor colorWithHexString:@"333333"];
    twoLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:twoLable];
    [twoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.drawView.mas_bottom).offset(30);
    }];
    
    
    //柱状图
    [self creatTwoView];
    
    UIView* sixLine = [UIView new];
    sixLine.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [_scrollView addSubview:sixLine];
    [sixLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_TwoChartView.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(10));
        make.centerX.equalTo(_scrollView);
    }];
    
    UILabel* threeLable = [UILabel new];
    threeLable.text = @"近15日客户活跃度";
    threeLable.textColor = [UIColor colorWithHexString:@"333333"];
    threeLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:threeLable];
    [threeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_TwoChartView.mas_bottom).offset(35);
    }];
    

    
    
    //曲线图
    [self creatThreeView];
    
}

-(void)creatfollowChartView
{
    
    _followChartView = [LineChartView new];
    _followChartView.delegate = self;
    _followChartView.legend.enabled = NO;//不显示图例说明
    
    [_scrollView addSubview:_followChartView];
    
    _followChartView.userInteractionEnabled = NO;
    
    [_followChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_followLable.mas_bottom).offset(50);
        make.height.equalTo(@(250));
        make.centerX.equalTo(self.view);
    }];
    
    _followChartView.dragEnabled = YES;
    [_followChartView setScaleEnabled:YES];
    _followChartView.pinchZoomEnabled = YES;
    _followChartView.drawGridBackgroundEnabled = NO;
    
    
    _followChartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _followChartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _followChartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.axisMaximum = 3;
    leftAxis.axisMinimum = 0;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _followChartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = _followChartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    _followChartView.maxVisibleCount = 999;//设置能够显示的数据数量
    
    
    _followChartView.legend.form = ChartLegendFormLine;
    
    
    [_followChartView animateWithXAxisDuration:2.5];
    
    [self setFollowDataCount:13 range:100];
}

- (void)setFollowDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _linex_arr.count; i++)
    {
        
        [values addObject:[[BarChartDataEntry alloc] initWithX:i y:[_liney_arr[i] doubleValue] icon: [UIImage imageNamed:@""]]];//iconxingxing
        
    }
    
    LineChartDataSet *set1 = nil;
    
    
    if (_followChartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_followChartView.data.dataSets[0];
        set1.values = values;
        set1.mode = LineChartModeCubicBezier;
        [_followChartView.data notifyDataChanged];
        [_followChartView notifyDataSetChanged];
        [_followChartView setNeedsDisplay];
        
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@""];
        set1.drawIconsEnabled = NO;
        //曲线
        set1.mode = LineChartModeCubicBezier;
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:[UIColor colorWithHexString:@"306A9C"]];
        [set1 setCircleColor:[UIColor colorWithHexString:@"306A9C"]];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = NO;
        CGGradientRelease(gradient);
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        _followChartView.data = data;
        
    }
}


-(void)creatTaskChartView
{
    _taskChartView = [LineChartView new];
    _taskChartView.delegate = self;
    _taskChartView.legend.enabled = NO;//不显示图例说明
    
    [_scrollView addSubview:_taskChartView];
    
    _taskChartView.userInteractionEnabled = NO;
    
    [_taskChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_taskLable.mas_bottom).offset(50);
        make.height.equalTo(@(250));
        make.centerX.equalTo(self.view);
    }];
    
    _taskChartView.dragEnabled = YES;
    [_taskChartView setScaleEnabled:YES];
    _taskChartView.pinchZoomEnabled = YES;
    _taskChartView.drawGridBackgroundEnabled = NO;
    
    
    _taskChartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _taskChartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _taskChartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.axisMaximum = 3;
    leftAxis.axisMinimum = 0;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _taskChartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = _taskChartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    _taskChartView.maxVisibleCount = 999;//设置能够显示的数据数量
    
    
    _taskChartView.legend.form = ChartLegendFormLine;
    
    
    [_taskChartView animateWithXAxisDuration:2.5];
    
    [self setTaskDataCount:13 range:100];
}

- (void)setTaskDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _linex_arr.count; i++)
    {
        
        [values addObject:[[BarChartDataEntry alloc] initWithX:i y:[_liney_arr[i] doubleValue] icon: [UIImage imageNamed:@""]]];//iconxingxing
        
    }
    
    LineChartDataSet *set1 = nil;
    
    
    if (_taskChartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_taskChartView.data.dataSets[0];
        set1.values = values;
        set1.mode = LineChartModeCubicBezier;
        [_taskChartView.data notifyDataChanged];
        [_taskChartView notifyDataSetChanged];
        [_taskChartView setNeedsDisplay];
        
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@""];
        set1.drawIconsEnabled = NO;
        //曲线
        set1.mode = LineChartModeCubicBezier;
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:[UIColor colorWithHexString:@"306A9C"]];
        [set1 setCircleColor:[UIColor colorWithHexString:@"306A9C"]];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = NO;
        CGGradientRelease(gradient);
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        _taskChartView.data = data;
        
    }
}

-(void)scretNewAddChartView
{
    _addChartView = [LineChartView new];
    _addChartView.delegate = self;
    _addChartView.legend.enabled = NO;//不显示图例说明
    
    [_scrollView addSubview:_addChartView];
    
    _addChartView.userInteractionEnabled = NO;
    
    [_addChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_addLable.mas_bottom).offset(50);
        make.height.equalTo(@(250));
        make.centerX.equalTo(self.view);
    }];
    
    _addChartView.dragEnabled = YES;
    [_addChartView setScaleEnabled:YES];
    _addChartView.pinchZoomEnabled = YES;
    _addChartView.drawGridBackgroundEnabled = NO;
    
    
    _addChartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _addChartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _addChartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.axisMaximum = 3;
    leftAxis.axisMinimum = 0;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _addChartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = _addChartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    _addChartView.maxVisibleCount = 999;//设置能够显示的数据数量

    
    _addChartView.legend.form = ChartLegendFormLine;

    
    [_addChartView animateWithXAxisDuration:2.5];
    
    [self setNewAddDataCount:13 range:100];
}




- (void)setNewAddDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _linex_arr.count; i++)
    {
        
        [values addObject:[[BarChartDataEntry alloc] initWithX:i y:[_liney_arr[i] doubleValue] icon: [UIImage imageNamed:@""]]];//iconxingxing
        
    }
    
    LineChartDataSet *set1 = nil;
    
    
    if (_addChartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_addChartView.data.dataSets[0];
        set1.values = values;
        set1.mode = LineChartModeCubicBezier;
        [_addChartView.data notifyDataChanged];
        [_addChartView notifyDataSetChanged];
        [_addChartView setNeedsDisplay];
        
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@""];
        set1.drawIconsEnabled = NO;
        //曲线
        set1.mode = LineChartModeCubicBezier;
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:[UIColor colorWithHexString:@"306A9C"]];
        [set1 setCircleColor:[UIColor colorWithHexString:@"306A9C"]];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = NO;
        CGGradientRelease(gradient);
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        _addChartView.data = data;
        
    }
}


-(void)creatMoreLineView
{
    _moreChartView = [LineChartView new];
    [_scrollView addSubview:_moreChartView];
    [_moreChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView).offset(40);
        make.right.equalTo(_scrollView).offset(0);
        make.height.equalTo(@(300));
        make.top.equalTo(_mallLable.mas_bottom).offset(50);
        make.centerX.equalTo(_scrollView);
    }];
    
    _moreChartView.delegate = self;
    _moreChartView.chartDescription.enabled = NO;
    _moreChartView.userInteractionEnabled = NO;
    _moreChartView.leftAxis.enabled = YES;
    _moreChartView.rightAxis.enabled = YES;
    _moreChartView.rightAxis.drawAxisLineEnabled = YES;
    _moreChartView.rightAxis.drawGridLinesEnabled = NO;
    _moreChartView.xAxis.drawAxisLineEnabled = NO;
    _moreChartView.xAxis.drawGridLinesEnabled = NO;
    _moreChartView.xAxis.labelPosition = XAxisLabelPositionBottom;
    _moreChartView.drawGridBackgroundEnabled = NO;
    _moreChartView.drawBordersEnabled = NO;
    _moreChartView.dragEnabled = YES;
    [_moreChartView setScaleEnabled:YES];
    _moreChartView.pinchZoomEnabled = NO;
    
    
    ChartLegend *l = _moreChartView.legend;
    l.horizontalAlignment = ChartLegendVerticalAlignmentBottom;
    l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    [self setMoreDataCount:7 range:70];

}

- (void)setMoreDataCount:(int)count range:(double)range
{
    NSArray *colors = @[ChartColorTemplates.vordiplom[0], ChartColorTemplates.vordiplom[1]];
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    
    NSArray* onearr = @[@"0",@"0",@"3",@"8",@"0",@"0",@"0"];
    NSArray* twoarr = @[@"1",@"0",@"0",@"2",@"5",@"0",@"0"];

    NSMutableArray* oneArray = [NSMutableArray arrayWithArray:onearr];
    NSMutableArray* twoArray = [NSMutableArray arrayWithArray:twoarr];
    
    for (int z = 0; z < 2; z++)
    {
        NSMutableArray *values = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < count; i++)
        {
            if (z == 0) {
                double onenum = [oneArray[i] doubleValue];
                [values addObject:[[ChartDataEntry alloc] initWithX:i y:onenum]];

            }else{
                double twonum = [twoArray[i] doubleValue];
                [values addObject:[[ChartDataEntry alloc] initWithX:i y:twonum]];
            }
        }
        
        NSArray* arr = @[@"商城订单量",@"交易金额"];
        NSMutableArray* array = [NSMutableArray arrayWithArray:arr];
        
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithValues:values label:[NSString stringWithFormat:@"%@", array[z]]];
        d.lineWidth = 2.5;
        d.circleRadius = 4.0;
        d.circleHoleRadius = 2.0;
        d.mode = LineChartModeCubicBezier;

        
        UIColor *color = colors[z % colors.count];
//        NSArray* colorArr = @[@"FFA92E",@"306A9C"];
//        NSMutableArray* coclorArray = [NSMutableArray arrayWithArray:colorArr];
        [d setColor:color];
        [d setCircleColor:color];
        [dataSets addObject:d];
    }
    
//    ((LineChartDataSet *)dataSets[0]).lineDashLengths = @[@5.f, @5.f];
//    ((LineChartDataSet *)dataSets[0]).colors = ChartColorTemplates.vordiplom;
//    ((LineChartDataSet *)dataSets[0]).circleColors = ChartColorTemplates.vordiplom;
    
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12.f]];
    _moreChartView.data = data;
}


- (NSArray *)configureTheRandomColorArrayWithColorNumber:(NSInteger)colorNumber {
    NSMutableArray *colorStringArr = [[NSMutableArray alloc]init];
    
    NSArray* oneArr = @[@"253",@"255",@"15",@"208",@"62",@"62",@"183",@"135",@"48",@"205",@"157",@"184",@"208",@"206",@"240",@"129",@"121",@"116",@"29",@"232"];
    
    NSArray* twoArr = @[@"96",@"169",@"209",@"67",@"165",@"208",@"181",@"64",@"106",@"141",@"208",@"62",@"89",@"188",@"103",@"128",@"153",@"146",@"155",@"83"];
    NSArray* threeArr = @[@"25",@"46",@"93",@"62",@"208",@"199",@"20",@"130",@"156",@"56",@"62",@"208",@"62",@"22",@"100",@"186",@"210",@"52",@"228",@"101"];
    
    
    NSArray *smalloneArray = [oneArr subarrayWithRange:NSMakeRange(0, colorNumber)];
    
    NSArray *smalltwoArray = [twoArr subarrayWithRange:NSMakeRange(0, colorNumber)];
    NSArray *smallthreeArray = [threeArr subarrayWithRange:NSMakeRange(0, colorNumber)];
    
    
    NSMutableArray* onearr = [NSMutableArray arrayWithArray:smalloneArray];
    NSMutableArray* twoarr = [NSMutableArray arrayWithArray:smalltwoArray];

    NSMutableArray* threearr = [NSMutableArray arrayWithArray:smallthreeArray];

    
    for (int i=0; i < colorNumber; i++) {
        
        if (colorNumber<=20) {
            
            NSString *colorStr = [NSString stringWithFormat:@"rgba(%@,%@,%@,0.9)",onearr[i],twoarr[i],threearr[i]];
            [colorStringArr addObject:colorStr];

            
        }else{
        
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        NSString *colorStr = [NSString stringWithFormat:@"rgba(%d,%d,%d,0.9)",R,G,B];
        [colorStringArr addObject:colorStr];
            
        }
    }
    return colorStringArr;
}

-(AAChartModel *)configureTheChartModel:(NSString *)chartType
{
    AAChartModel *aaChartModel= AAChartModel.new
    .chartTypeSet(AAChartTypeFunnel)
    .colorsThemeSet([self configureTheRandomColorArrayWithColorNumber:4])
    
//    .colorsThemeSet(@[@"#0c9674",@"#7dffc0",@"#d11b5f",@"#facd32",@"#ffffa0",@"#EA007B"])
    .titleSet(@"")
    .subtitleSet(@"")
    .yAxisTitleSet(@"")
    .dataLabelEnabledSet(true)

    .seriesSet(
               @[
                 AASeriesElement.new
                 .nameSet(@"成交")
                 .dataSet(@[
                            @[@"<=50%",  @543],
                            @[@"<=80%",  @300],
                            @[@"<=99%",  @499],
                            @[@"<=100%", @166]
                            ]),
                 ]
               );
    
    return aaChartModel;
}

-(void)creatThreeView
{
    _chartView = [LineChartView new];
    _chartView.delegate = self;
    _chartView.legend.enabled = NO;//不显示图例说明
    
    [_scrollView addSubview:_chartView];
    
    _chartView.userInteractionEnabled = NO;
    
    [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_TwoChartView.mas_bottom).offset(70);
        make.bottom.equalTo(_scrollView).offset(-30);
        make.height.equalTo(@(250));
        make.centerX.equalTo(self.view);
    }];
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;

    _chartView.xAxis.gridLineDashLengths = @[@10.0, @10.0];
    _chartView.xAxis.gridLineDashPhase = 0.f;
    
    ChartYAxis *leftAxis = _chartView.leftAxis;
    [leftAxis removeAllLimitLines];
    leftAxis.axisMaximum = 3;
    leftAxis.axisMinimum = 0;
    leftAxis.gridLineDashLengths = @[@5.f, @5.f];
    leftAxis.drawZeroLineEnabled = NO;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;
    
    _chartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = _chartView.xAxis;
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition= XAxisLabelPositionBottom;//设置x轴数据在底部
    xAxis.gridColor = [UIColor clearColor];
    xAxis.labelTextColor = [UIColor blackColor];//文字颜色
    xAxis.axisLineColor = [UIColor grayColor];
    _chartView.maxVisibleCount = 999;//设置能够显示的数据数量
    
    _chartView.legend.form = ChartLegendFormLine;
    
    [_chartView animateWithXAxisDuration:2.5];
    
    [self setDataCount:13 range:100];
}

- (void)setDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _linex_arr.count; i++)
    {
        
        [values addObject:[[BarChartDataEntry alloc] initWithX:i y:[_liney_arr[i] doubleValue] icon: [UIImage imageNamed:@""]]];//iconxingxing
        
    }
    
    LineChartDataSet *set1 = nil;

    
    if (_chartView.data.dataSetCount > 0)
    {
        set1 = (LineChartDataSet *)_chartView.data.dataSets[0];
        set1.values = values;
        set1.mode = LineChartModeCubicBezier;
        [_chartView.data notifyDataChanged];
        [_chartView notifyDataSetChanged];
        [_chartView setNeedsDisplay];
        
    }
    else
    {
        set1 = [[LineChartDataSet alloc] initWithValues:values label:@""];
        set1.drawIconsEnabled = NO;
        //曲线
        set1.mode = LineChartModeCubicBezier;
        set1.lineDashLengths = @[@5.f, @2.5f];
        set1.highlightLineDashLengths = @[@5.f, @2.5f];
        [set1 setColor:[UIColor colorWithHexString:@"306A9C"]];
        [set1 setCircleColor:[UIColor colorWithHexString:@"306A9C"]];
        set1.lineWidth = 1.0;
        set1.circleRadius = 3.0;
        set1.drawCircleHoleEnabled = NO;
        set1.valueFont = [UIFont systemFontOfSize:9.f];
        set1.formLineDashLengths = @[@5.f, @2.5f];
        set1.formLineWidth = 1.0;
        set1.formSize = 15.0;
        NSArray *gradientColors = @[
                                    (id)[ChartColorTemplates colorFromString:@"#00ff0000"].CGColor,
                                    (id)[ChartColorTemplates colorFromString:@"#ffff0000"].CGColor
                                    ];
        CGGradientRef gradient = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
        set1.fillAlpha = 1.f;
        set1.fill = [ChartFill fillWithLinearGradient:gradient angle:90.f];
        set1.drawFilledEnabled = NO;
        CGGradientRelease(gradient);
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        _chartView.data = data;
 
    }
}

-(void)creatTwoView
{
    self.citys = @[@"咨询产品", @"点赞", @"评论", @"添加印象", @"拔打电话", @"保存电话"];
    
    self.datas = @[@"11.0", @"10.0", @"9.0", @"8.0", @"16.0", @"16.0"];
    
    
    _TwoChartView = [[HorizontalBarChartView alloc] init];
    _TwoChartView.chartDescription.enabled = NO;
    _TwoChartView.drawGridBackgroundEnabled = NO;
    
    
    _TwoChartView.dragEnabled = YES;
    [_TwoChartView setScaleEnabled:NO];
    _TwoChartView.pinchZoomEnabled = NO;
    _TwoChartView.legend.enabled = NO;//不显示图例说明
    
    _TwoChartView.delegate = self;
    _TwoChartView.drawBarShadowEnabled = NO;
    _TwoChartView.drawValueAboveBarEnabled = YES;
    _TwoChartView.maxVisibleCount = 60;
    _TwoChartView.userInteractionEnabled = NO;
    
    // 隐藏上下轴
    _TwoChartView.leftAxis.enabled = NO;
    _TwoChartView.rightAxis.enabled = NO;
    
    ChartXAxis *xAxis = _TwoChartView.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.labelFont = [UIFont systemFontOfSize:10.f];
    xAxis.drawAxisLineEnabled = YES;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:_citys];
    xAxis.labelCount = _citys.count;
    xAxis.labelFont = [UIFont systemFontOfSize:10];
    
    //不显示全部
    //    xAxis.granularity = 10.0;
    
    ChartYAxis *leftAxis = _TwoChartView.leftAxis;
    leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
    leftAxis.drawAxisLineEnabled = YES;
    leftAxis.drawGridLinesEnabled = NO;
    leftAxis.axisMinimum = 0.0;
    
    ChartYAxis *rightAxis = _TwoChartView.rightAxis;
    rightAxis.enabled = YES;
    rightAxis.labelFont = [UIFont systemFontOfSize:10.f];
    rightAxis.drawAxisLineEnabled = YES;
    rightAxis.drawGridLinesEnabled = NO;
    rightAxis.axisMinimum = 0.0;
    
    ChartLegend *l = _TwoChartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
    l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    l.orientation = ChartLegendOrientationHorizontal;
    l.drawInside = NO;
    
    l.form = ChartLegendFormSquare;
    l.formSize = 8.0;
    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
    l.xEntrySpace = 4.0;

    _TwoChartView.fitBars = YES;
    
    [_TwoChartView animateWithYAxisDuration:2.5];
    
    [_scrollView addSubview:_TwoChartView];
    
    [_TwoChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_drawView.mas_bottom).offset(50);
        make.height.equalTo(@(300));
        make.centerX.equalTo(self.view);
    }];
    
    [self setTwoDataCount];
    [_TwoChartView animateWithYAxisDuration:2.5];
    
}

- (void)setTwoDataCount
{
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _datas.count; i++)
    {
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:i y:[_datas[i] doubleValue] icon: [UIImage imageNamed:@""]]];//iconxingxing
    }
    
    BarChartDataSet *set1 = nil;
    set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@""];
    set1.drawIconsEnabled = YES;
    set1.drawValuesEnabled = YES;
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    
    [dataSets addObject:set1];
    
    
    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
    
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];
    //    data.barWidth = 30;
    _TwoChartView.data = data;
    
}


-(void)chooseAction:(UIButton *)sender
{
    if (self.selectBtn == sender) {
        return;
    }
    
    self.selectBtn.layer.borderColor = [UIColor colorWithHexString:@"E8E8E8"].CGColor;
    
    self.selectBtn.selected = !self.selectBtn.selected;
    
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
    
    self.selectBtn = sender;
    
    
    
}

@end

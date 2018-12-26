//
//  MyAIDataVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/29.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "MyAIDataVC.h"
#import "FzhDrawChart.h"

#import "BuildMall-Bridging-Header.h"


@interface MyAIDataVC ()<ChartViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerX;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;

@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIScrollView* scrollView;


@property(nonatomic, strong)HorizontalBarChartView *TwoChartView;
@property(nonatomic, strong)LineChartView *chartView;



/** citys */
@property (nonatomic, strong) NSArray *citys;

/** data */
@property (nonatomic, strong) NSArray *datas;

@property(nonatomic, strong)FzhDrawChart *drawView;//画图的view

@property(nonatomic, strong)NSArray *x_arr;//x轴数据数组
@property(nonatomic, strong)NSArray *y_arr;//y轴数据数组


@property(nonatomic, strong)NSArray *linex_arr;//x轴数据数组
@property(nonatomic, strong)NSArray *liney_arr;//y轴数据数组

@property(nonatomic, strong)UIImageView *last;


@end

@implementation MyAIDataVC

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
    
    self.navigationItem.title = @"我的AI";
    _selectBtn = _oneBtn;
    
//    _centerX.constant = _oneBtn.centerX;

    _scrollView = [UIScrollView new];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(40);
        
    }];
    
    [self creatimageLable];

   
    [self creatMing];
    
    //柱状图
    [self creatTwoView];
    
    
    UILabel* threeLable = [UILabel new];
    threeLable.text = @"近15日客户活跃度";
    threeLable.textColor = [UIColor colorWithHexString:@"333333"];
    threeLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:threeLable];
    [threeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_TwoChartView.mas_bottom).offset(10);
    }];
    
    _linex_arr = @[@"10-11",@"10-12", @"10-13",@"10-14",@"10-15", @"10-16",@"10.17",@"10-18",@"10-19",@"10-20",@"10-21",@"10-22", @"10.23",@"10-24",@"10-25"];
    _liney_arr = @[@"0", @"0", @"0",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"2",@"0",@"0",@"0",@"0"];
    
    
    //曲线图
    [self creatThreeView];
    
}

-(void)creatThreeView
{
    _chartView = [LineChartView new];
    _chartView.delegate = self;
    
    [_scrollView addSubview:_chartView];
    
    _chartView.userInteractionEnabled = NO;
    
    [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_TwoChartView.mas_bottom).offset(60);
        make.bottom.equalTo(_scrollView).offset(-30);
        make.height.equalTo(@(250));
        make.centerX.equalTo(self.view);
    }];
    
    _chartView.dragEnabled = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled = YES;
    _chartView.drawGridBackgroundEnabled = NO;
    
    ChartLimitLine *llXAxis = [[ChartLimitLine alloc] initWithLimit:10.0 label:@"Index 10"];
    llXAxis.lineWidth = 4.0;
    llXAxis.lineDashLengths = @[@(10.f), @(10.f), @(0.f)];
    llXAxis.labelPosition = ChartLimitLabelPositionRightBottom;
    llXAxis.valueFont = [UIFont systemFontOfSize:10.f];
    
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
    
    
    
    //    BalloonMarker *marker = [[BalloonMarker alloc]
    //                             initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
    //                             font: [UIFont systemFontOfSize:12.0]
    //                             textColor: UIColor.whiteColor
    //                             insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
    //    marker.chartView = _chartView;
    //    marker.minimumSize = CGSizeMake(80.f, 40.f);
    //    _chartView.marker = marker;
    
    _chartView.legend.form = ChartLegendFormLine;
    
    //    _sliderX.value = 45.0;
    //    _sliderY.value = 100.0;
    
    [_chartView animateWithXAxisDuration:2.5];
    
    [self setDataCount:13 range:100];
}

- (void)setDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < _linex_arr.count; i++)
    {
        //        double val = arc4random_uniform(range) + 3;
        //        [values addObject:[[ChartDataEntry alloc] initWithX:i y:val icon: [UIImage imageNamed:@"icon"]]];
        
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
        [set1 setColor:MINE_Color];
        [set1 setCircleColor:MINE_Color];
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
    //    l.direction = ChartLegendDirectionLeftToRight;
    
    l.form = ChartLegendFormSquare;
    l.formSize = 8.0;
    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
    l.xEntrySpace = 4.0;
    
    //    _chartView.extraBottomOffset = 30;
    //    _chartView.extraTopOffset = 30;
    _TwoChartView.fitBars = YES;
    
    [_TwoChartView animateWithYAxisDuration:2.5];
    
    [_scrollView addSubview:_TwoChartView];
    
    [_TwoChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(20);
        make.top.equalTo(_drawView.mas_bottom).offset(20);
        //        make.bottom.equalTo(_scrollview).offset(-30);
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

-(void)creatMing
{
    UILabel* topLable = [UILabel new];
    topLable.text = @"客户兴趣占比";
    topLable.textColor = [UIColor colorWithHexString:@"333333"];
    topLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:topLable];
    [topLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_scrollView).offset(((screenW-60-10*2)/3+20)*2+30+10);
    }];
    
    self.drawView = [[FzhDrawChart alloc] initWithFrame:CGRectMake(20, ((screenW-60-10*2)/3+20)*2+30, screenW-20, 300)];
    self.drawView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:self.drawView];
    [_drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_scrollView).offset(0);
        make.top.equalTo(_scrollView).offset(((screenW-60-10*2)/3+20)*2+30+30);
        make.height.equalTo(@(300));
    }];
    //画饼状图
    [self.drawView drawBingZhuangTu:self.x_arr and:self.y_arr];
    
    UILabel* twoLable = [UILabel new];
    twoLable.text = @"客户与我的互动";
    twoLable.textColor = [UIColor colorWithHexString:@"333333"];
    twoLable.font = [UIFont systemFontOfSize:17];
    [_scrollView addSubview:twoLable];
    [twoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.drawView.mas_bottom).offset(0);
    }];
}

-(void)creatimageLable
{
    NSArray* twoArr = @[@"客户总数",@"跟进总数",@"浏览总数",@"被转发总数",@"被保存总数",@"被点赞总数"];
    NSArray* twoNumArr = @[@"30",@"0",@"1706",@"73",@"40",@"79"];
    NSMutableArray* twoNumarray = [NSMutableArray arrayWithArray:twoNumArr];
    NSMutableArray* twoArray = [NSMutableArray arrayWithArray:twoArr];
    
    CGFloat marginX = 30;//按钮距离左边和右边的距离
    CGFloat gapX = 10; //左右按钮之间的距离
    CGFloat gapY = 10; //上下按钮之间的距离
    NSInteger col = 3;  //布局3列
    
    UIImageView *last = nil;
    _last = last;
    
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
            
            make.top.equalTo(_scrollView).offset(top);
            
            
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
}

- (IBAction)changeAction:(UIButton *)sender {
    
    if (self.selectBtn == sender) {
        return;
    }

    _centerX.constant = sender.x;

    NSLog(@"%f--%f",sender.centerX,_centerX.constant);
    
    self.selectBtn.selected = !self.selectBtn.selected;
    if (sender.selected == NO) {
        sender.selected = YES;
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

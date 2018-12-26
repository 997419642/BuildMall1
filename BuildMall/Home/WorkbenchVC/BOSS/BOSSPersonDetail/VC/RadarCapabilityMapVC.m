//
//  RadarCapabilityMapVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/28.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "RadarCapabilityMapVC.h"
#import "BuildMall-Bridging-Header.h"
@interface RadarCapabilityMapVC ()<ChartViewDelegate, IChartAxisValueFormatter>
@property(nonatomic,strong)RadarChartView* radarChartView;
@property (nonatomic, strong) NSArray<NSString *> *activities;
@property (nonatomic, strong) UIColor *originalBarBgColor;
@property (nonatomic, strong) UIColor *originalBarTintColor;
@property (nonatomic) UIBarStyle originalBarStyle;
@property (nonatomic, strong) NSArray<NSString *> *activitiesnum;
@property(nonatomic,strong)UICollectionView* collectionView;

@end

@implementation RadarCapabilityMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
        self.activities = @[ @"个人魅力值", @"客户互动值", @"产品能推广值", @"官网推广度", @"销售主动性" ,@"获客能力值"];
    
        self.activitiesnum = @[ @"50", @"24", @"35", @"66", @"67" ,@"78"];
    
        self.radarChartView = [[RadarChartView alloc] init];
    //    self.radarChartView.backgroundColor = BgColor;
        [self.view addSubview:self.radarChartView];
        [self.radarChartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(350, 350));
            make.centerX.mas_equalTo(self.view);
            make.top.equalTo(self.view).offset(-10);
        }];
    
    UIView* backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@(50));
    }];
    
    UILabel* leftLable = [UILabel new];
    leftLable.text = @"当前综合值排名：1";
    leftLable.textColor = [UIColor colorWithHexString:@"333333"];
    leftLable.font = [UIFont systemFontOfSize:17];
    [backView addSubview:leftLable];
    [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(15);
        make.left.equalTo(backView).offset(20);
    }];
    
    UILabel* rightLable = [UILabel new];
    rightLable.text = @"公司综合值排名：1";
    rightLable.textColor = [UIColor colorWithHexString:@"333333"];
    rightLable.font = [UIFont systemFontOfSize:17];
    [backView addSubview:rightLable];
    [rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(15);
        make.right.equalTo(backView).offset(-20);
    }];
    
    

    
        self.radarChartView.delegate = self;
    //    self.radarChartView.descriptionText = @"";//描述
        self.radarChartView.rotationEnabled = YES;//是否允许转动
        self.radarChartView.highlightPerTapEnabled = YES;//是否能被选中
    
    
        self.radarChartView.webLineWidth = 0.5;//主干线线宽
        self.radarChartView.webColor = [UIColor colorWithHexString:@"#c2ccd0"];//主干线线宽
        self.radarChartView.innerWebLineWidth = 0.375;//边线宽度
        self.radarChartView.innerWebColor = [UIColor colorWithHexString:@"#c2ccd0"];//边线颜色
        self.radarChartView.webAlpha = 1;//透明度
    
        ChartXAxis *xAxis = _radarChartView.xAxis;
        xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
        xAxis.xOffset = 0.0;
        xAxis.yOffset = 0.0;
        xAxis.valueFormatter = self;
        xAxis.labelTextColor = MINE_Color;
    
    
        ChartYAxis *yAxis = _radarChartView.yAxis;
        yAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
        yAxis.labelCount = 5;
        yAxis.axisMinimum = 0.0;
        yAxis.axisMaximum = 80.0;
        yAxis.drawLabelsEnabled = NO;
    
    
        ChartLegend *l = _radarChartView.legend;
        l.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
        l.verticalAlignment = ChartLegendVerticalAlignmentTop;
        l.orientation = ChartLegendOrientationHorizontal;
        l.drawInside = NO;
        l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
        l.xEntrySpace = 7.0;
        l.yEntrySpace = 5.0;
        l.textColor = MINE_Color;
        [_radarChartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    
        [self setChartData];
}
- (void)setChartData
{
    
    NSMutableArray *entries2 = [[NSMutableArray alloc] init];
    
    // NOTE: The order of the entries when being added to the entries array determines their position around the center of the chart.
    for (int i = 0; i < _activitiesnum.count; i++)
    {
        
        
        double num = [_activitiesnum[i] doubleValue];
        [entries2 addObject:[[RadarChartDataEntry alloc] initWithValue:num]];
    }
    
    
    
    RadarChartDataSet *set2 = [[RadarChartDataSet alloc] initWithValues:entries2 label:@"This Week"];
    [set2 setColor:[UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0]];
    set2.fillColor = [UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0];
    set2.drawFilledEnabled = YES;
    set2.fillAlpha = 0.7;
    set2.lineWidth = 2.0;
    set2.drawHighlightCircleEnabled = YES;
    [set2 setDrawHighlightIndicators:NO];
    
    
    RadarChartData *data = [[RadarChartData alloc] initWithDataSets:@[set2]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [data setDrawValues:YES];
    data.valueTextColor = MINE_Color;
    
    _radarChartView.data = data;
    
    
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

#pragma mark - IAxisValueFormatter

- (NSString *)stringForValue:(double)value
                        axis:(ChartAxisBase *)axis
{
    return self.activities[(int) value % self.activities.count];
}
@end

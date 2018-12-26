//
//  BossAIAnalysisCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/28.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BossAIAnalysisCell.h"

@interface BossAIAnalysisCell ()<ChartViewDelegate, IChartAxisValueFormatter>



@end

@implementation BossAIAnalysisCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    
    self.activities = @[ @"个人魅力值", @"客户互动值", @"产品能推广值", @"官网推广度", @"销售主动性" ,@"获客能力值"];
    
    self.activitiesnum = @[ @"50", @"24", @"35", @"66", @"67" ,@"78"];
    
    self.radarChartView = [[RadarChartView alloc] init];
    //    self.radarChartView.backgroundColor = BgColor;
    [self addSubview:self.radarChartView];
    [self.radarChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.equalTo(self).offset(50);
        make.bottom.equalTo(self).offset(0);
        make.width.height.equalTo(@(self.width));
    }];
    
    
    UIView* topView =[UIView new];
    
    topView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.right.equalTo(self).offset(0);
        make.height.equalTo(@(40));
    }];
    

    
    UILabel* nameLable = [UILabel new];
    nameLable.text = @"王坤";
    nameLable.textColor = [UIColor colorWithHexString:@"333333"];
    nameLable.font = [UIFont systemFontOfSize:14];
    [topView addSubview:nameLable];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView);
        make.top.equalTo(topView).offset(0);
        
    }];
    
    UILabel*positionLable = [UILabel new];
    positionLable.text = @"测试";
    positionLable.textColor = [UIColor colorWithHexString:@"666666"];
    positionLable.font = [UIFont systemFontOfSize:12];
    [topView addSubview:positionLable];
    [positionLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView);
        make.top.equalTo(nameLable.mas_bottom).offset(5);
        
    }];
    
    
    
    self.radarChartView.delegate = self;
    _radarChartView.legend.enabled  = NO;
    
    //    self.radarChartView.descriptionText = @"";//描述
    self.radarChartView.rotationEnabled = NO;//是否允许转动
    self.radarChartView.highlightPerTapEnabled = NO;//是否能被选中
    
    self.radarChartView.webLineWidth = 0.5;//主干线线宽
    self.radarChartView.webColor = [UIColor colorWithHexString:@"#c2ccd0"];//主干线线宽
    self.radarChartView.innerWebLineWidth = 0.375;//边线宽度
    self.radarChartView.innerWebColor = [UIColor colorWithHexString:@"#c2ccd0"];//边线颜色
    self.radarChartView.webAlpha = 1;//透明度
    
    _xAxis0 = _radarChartView.xAxis;
    _xAxis0.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
    _xAxis0.xOffset = 0.0;
    _xAxis0.yOffset = 0.0;
    _xAxis0.valueFormatter = self;
    _xAxis0.labelTextColor = MINE_Color;
//    xAxis.drawLabelsEnabled = NO;

    
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
    
    
    
    RadarChartDataSet *set2 = [[RadarChartDataSet alloc] initWithValues:entries2 label:@""];
    [set2 setColor:[UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0]];
    set2.fillColor = [UIColor colorWithRed:121/255.0 green:162/255.0 blue:175/255.0 alpha:1.0];
    set2.drawFilledEnabled = YES;
    set2.fillAlpha = 0.7;
    set2.lineWidth = 2.0;
    set2.drawHighlightCircleEnabled = YES;
    [set2 setDrawHighlightIndicators:NO];
    
    
    _data = [[RadarChartData alloc] initWithDataSets:@[set2]];
    [_data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [_data setDrawValues:YES];
    _data.valueTextColor = MINE_Color;
    
    _radarChartView.data = _data;
    
    
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

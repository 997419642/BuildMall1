//
//  ReportDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "ReportDetailVC.h"
#import "ReportDetailCell.h"
#import "BuildMall-Bridging-Header.h"

@interface ReportDetailVC ()<UITableViewDelegate,UITableViewDataSource,ChartViewDelegate>

@property(nonatomic,strong)UITableView* tableView;


@property(nonatomic,strong)PieChartView *chartView;

@end

@implementation ReportDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"销售报表";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [_tableView registerNib:[UINib nibWithNibName:@"ReportDetailCell" bundle:nil] forCellReuseIdentifier:@"ReportDetailCell"];
    
}

- (void)setDataCount:(int)count range:(double)range
{
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    NSArray* array = @[@"80",@"20"];
    
   NSArray* parties = @[
                @"管理部", @"销售部"];
    NSMutableArray* numArr = [NSMutableArray arrayWithArray:array];
    
    for (int i = 0; i < array.count; i++)
    {
        double num = [numArr[i] doubleValue];
        [values addObject:[[PieChartDataEntry alloc] initWithValue:num label:parties[i] icon: [UIImage imageNamed:@"icon"]]];
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:@"s"];
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 40);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [data setValueTextColor:UIColor.whiteColor];
    
    _chartView.data = data;
    [_chartView highlightValues:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 311;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView* bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(0);
        make.left.right.equalTo(view).offset(0);
        make.bottom.equalTo(view).offset(-70);
    }];
    
    UILabel* topLable = [UILabel new];
    topLable.text = @"三季度销售额";
    topLable.font = [UIFont systemFontOfSize:16];
    topLable.textColor = [UIColor colorWithHexString:@"4197D7"];
    [view addSubview:topLable];
    [topLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(20);
        make.centerX.equalTo(view);
    }];
    
    
    _chartView = [PieChartView new];
    [view addSubview:_chartView];
    [_chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(20);
        make.centerX.equalTo(view);
        make.width.height.equalTo(@(230));
    }];
    
    _chartView.userInteractionEnabled = NO;
    _chartView.usePercentValuesEnabled = NO;
    _chartView.drawSlicesUnderHoleEnabled = NO;
    _chartView.holeRadiusPercent = 0.58;
    _chartView.transparentCircleRadiusPercent = 0.61;
    _chartView.chartDescription.enabled = NO;
    [_chartView setExtraOffsetsWithLeft:5.f top:10.f right:5.f bottom:5.f];
    
    _chartView.drawCenterTextEnabled = YES;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"6.20万\n总额"];
    
    _chartView.centerAttributedText = centerText;
    
    _chartView.drawHoleEnabled = YES;
    _chartView.rotationAngle = 0.0;
    _chartView.rotationEnabled = YES;
    _chartView.highlightPerTapEnabled = YES;
    
    _chartView.legend.enabled = NO;//不显示图例说明
    
    ChartLegend *l = _chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
    l.orientation = ChartLegendOrientationVertical;
    l.drawInside = NO;
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 0.0;
    l.yOffset = 0.0;
    
    _chartView.delegate = self;
    
    _chartView.entryLabelColor = UIColor.whiteColor;
    _chartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
    [_chartView animateWithXAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    [self setDataCount:1.0 range:100.0];
    
    
    UILabel * lable = [UILabel new];
    lable.text = @"管理部";
    lable.textColor = [UIColor colorWithHexString:@"333333"];
    [view addSubview:lable];
    lable.font = [UIFont systemFontOfSize:14];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(30);
        make.top.equalTo(view).offset(265);
    }];
    
    
    UILabel* proportionLable = [UILabel new];
    proportionLable.text = @"100%";
    proportionLable.textColor = [UIColor colorWithHexString:@"333333"];
    proportionLable.font = [UIFont systemFontOfSize:12];
    [view addSubview:proportionLable];
    [proportionLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.centerY.equalTo(lable);
    }];
    
    
    UILabel* stateLable = [UILabel new];
    stateLable.text = @"165,958.00";
    stateLable.textColor = [UIColor colorWithHexString:@"333333"];
    stateLable.font = [UIFont systemFontOfSize:12];
    [view addSubview:stateLable];
    [stateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view).offset(-20);
        make.top.equalTo(view).offset(265);
    }];
    
    
    UIView* lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(view).offset(0);
        make.bottom.equalTo(view).offset(0);
        make.height.equalTo(@(10));
    }];
    
    return view;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier1 = @"ReportDetailCell";
    ReportDetailCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:identifier1];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    //    DOPJobsModel* model = _jobsArray[indexPath.row];
    //    cell1.userModel = model;
    //    cell1.delegate = self;
    
    return cell1;
}

@end

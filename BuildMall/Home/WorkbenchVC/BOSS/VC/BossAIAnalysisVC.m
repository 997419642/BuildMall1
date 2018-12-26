//
//  AIAnalysisVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/23.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BossAIAnalysisVC.h"
#import "BuildMall-Bridging-Header.h"
#import "BossAIAnalysisCell.h"
#import "BossAIAnalysisOneCell.h"
#import "PersonalInformationDetailsVC.h"


@interface BossAIAnalysisVC ()<ChartViewDelegate, IChartAxisValueFormatter,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)RadarChartView* radarChartView;
@property (nonatomic, strong) NSArray<NSString *> *activities;
@property (nonatomic, strong) UIColor *originalBarBgColor;
@property (nonatomic, strong) UIColor *originalBarTintColor;
@property (nonatomic) UIBarStyle originalBarStyle;
@property (nonatomic, strong) NSArray<NSString *> *activitiesnum;
@property(nonatomic,strong)UICollectionView* collectionView;

@end

@implementation BossAIAnalysisVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    
//    self.activities = @[ @"个人魅力值", @"客户互动值", @"产品能推广值", @"官网推广度", @"销售主动性" ,@"获客能力值"];
//
//    self.activitiesnum = @[ @"50", @"24", @"35", @"66", @"67" ,@"78"];
//
//    self.radarChartView = [[RadarChartView alloc] init];
////    self.radarChartView.backgroundColor = BgColor;
//    [self.view addSubview:self.radarChartView];
//    [self.radarChartView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(400, 400));
//        make.centerX.mas_equalTo(self.view);
//        make.top.equalTo(self.view).offset(50);
//    }];
//    self.radarChartView.delegate = self;
////    self.radarChartView.descriptionText = @"";//描述
//    self.radarChartView.rotationEnabled = YES;//是否允许转动
//    self.radarChartView.highlightPerTapEnabled = YES;//是否能被选中
//
//
//    self.radarChartView.webLineWidth = 0.5;//主干线线宽
//    self.radarChartView.webColor = [UIColor colorWithHexString:@"#c2ccd0"];//主干线线宽
//    self.radarChartView.innerWebLineWidth = 0.375;//边线宽度
//    self.radarChartView.innerWebColor = [UIColor colorWithHexString:@"#c2ccd0"];//边线颜色
//    self.radarChartView.webAlpha = 1;//透明度
//
//    ChartXAxis *xAxis = _radarChartView.xAxis;
//    xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
//    xAxis.xOffset = 0.0;
//    xAxis.yOffset = 0.0;
//    xAxis.valueFormatter = self;
//    xAxis.labelTextColor = MINE_Color;
//
//
//    ChartYAxis *yAxis = _radarChartView.yAxis;
//    yAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
//    yAxis.labelCount = 5;
//    yAxis.axisMinimum = 0.0;
//    yAxis.axisMaximum = 80.0;
//    yAxis.drawLabelsEnabled = NO;
//
//
//    ChartLegend *l = _radarChartView.legend;
//    l.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
//    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
//    l.orientation = ChartLegendOrientationHorizontal;
//    l.drawInside = NO;
//    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
//    l.xEntrySpace = 7.0;
//    l.yEntrySpace = 5.0;
//    l.textColor = MINE_Color;
//    [_radarChartView animateWithXAxisDuration:1.4 yAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];
    
//    [self setChartData];
    
    [self resetConlloctionView];


}

-(void)resetConlloctionView
{
    //相当于item
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置行间距-最小行间距
    flowLayout.minimumLineSpacing = 10;
    //设置每单元格左右间距
    flowLayout.minimumInteritemSpacing = 30;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //上 左 下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 30, 0, 30);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH-64-90) collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    //注册cell
    [_collectionView registerClass:[BossAIAnalysisCell class] forCellWithReuseIdentifier:@"BossAIAnalysisCell"];
    
        [_collectionView registerClass:[BossAIAnalysisOneCell class] forCellWithReuseIdentifier:@"BossAIAnalysisOneCell"];
    [self.view addSubview:_collectionView];
    
    
    

    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1)
    {
        return 2;
    }else
    {
    return 14;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    if (indexPath.section == 0) {
        
        BossAIAnalysisOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BossAIAnalysisOneCell" forIndexPath:indexPath];
        
       return cell;
        
    }else if (indexPath.section == 1)
    {
        
        BossAIAnalysisOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BossAIAnalysisOneCell" forIndexPath:indexPath];
        
    
        
        cell.xAxis0.drawLabelsEnabled = NO;
        [cell.data setDrawValues:NO];
        _radarChartView.yAxis.drawLabelsEnabled = NO;
        [_radarChartView.data notifyDataChanged];
        [_radarChartView notifyDataSetChanged];
        [_radarChartView setNeedsDisplay];
        
         return cell;
    }else
    {
        
        
        BossAIAnalysisCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BossAIAnalysisCell" forIndexPath:indexPath];
        
        cell.nameLable.text = @"王坤";
        cell.positionLable.text = @"测试";
        
        [cell.data setDrawValues:NO];
        cell.xAxis0.drawLabelsEnabled = NO;
        _radarChartView.yAxis.drawLabelsEnabled = NO;
        [_radarChartView.data notifyDataChanged];
        [_radarChartView notifyDataSetChanged];
        [_radarChartView setNeedsDisplay];
        
         return cell;
    }
    return nil;
   
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalInformationDetailsVC* VC  =[PersonalInformationDetailsVC new];
    
    [self.navigationController pushViewController:VC animated:YES];

}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(screenW-40,screenW-40);

        
    }else if (indexPath.section == 1)
    {
        return CGSizeMake((screenW-30*3) / 2,(screenW-30*3) / 2+70);

        
    }else if(indexPath.section == 2){
    
       return CGSizeMake((screenW-30*4) / 3,(screenW-30*4) / 3+50);
    }else
    {
        return CGSizeMake(0, 0);
    }
}





@end

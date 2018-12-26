//
//  BossAIAnalysisOneCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/28.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuildMall-Bridging-Header.h"

NS_ASSUME_NONNULL_BEGIN

@interface BossAIAnalysisOneCell : UICollectionViewCell

@property(nonatomic,strong)RadarChartView* radarChartView;
@property (nonatomic, strong) NSArray<NSString *> *activities;
@property (nonatomic, strong) UIColor *originalBarBgColor;
@property (nonatomic, strong) UIColor *originalBarTintColor;
@property (nonatomic) UIBarStyle originalBarStyle;
@property (nonatomic, strong) NSArray<NSString *> *activitiesnum;

@property (nonatomic, strong)RadarChartData *data;

@property (nonatomic, strong)ChartXAxis *xAxis0;

@end

NS_ASSUME_NONNULL_END

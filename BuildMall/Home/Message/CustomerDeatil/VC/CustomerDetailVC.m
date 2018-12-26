//
//  CustomerDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "CustomerDetailVC.h"
#import "EachOtherVC.h"
#import "DataVC.h"
#import "AIAnalysisVC.h"
#import "TapSliderScrollView.h"
#import "FollowVC.h"
#import "DOPOrderDeatilVC.h"
#import "TitleViewController.h"
#import "BuildMall-Bridging-Header.h"


@interface CustomerDetailVC ()<SliderLineViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addTitleBtn;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@property(nonatomic,strong)UIViewController *currentVC;//!<当前控制器
@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *leftbtn;
@property (weak, nonatomic) IBOutlet UIButton *medlleBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *FollowBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;

@end

@implementation CustomerDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"客户详情";

    _addTitleBtn.layer.masksToBounds = YES;
    _addTitleBtn.layer.cornerRadius = 9;
    
    _FollowBtn.layer.masksToBounds = YES;
    _FollowBtn.layer.cornerRadius = 5;
    
    _talkBtn.layer.masksToBounds = YES;
    _talkBtn.layer.cornerRadius = 5;
    
//    _contentView = [[UIView alloc] init];
//    [self.view addSubview: _contentView];
//    _contentView.sd_layout.topEqualToView(self.lineView).offset(5).rightEqualToView(self.view).leftEqualToView(self.view).bottomEqualToView(self.view).offset(0);
//    _contentView.clipsToBounds = YES;
//    [self addChildControllers];
    
//    self.selectBtn = self.leftbtn;
    
    
    EachOtherVC *vc1 = [[EachOtherVC alloc] init];
    DataVC *vc2 = [DataVC new];
    AIAnalysisVC *vc3 = [AIAnalysisVC new];
    
    TapSliderScrollView *view = [[TapSliderScrollView alloc]initWithFrame:CGRectMake(0, 160, screenW, screenH-160-90-80)];
    view.delegate = self;
    //设置滑动条的颜色
    view.sliderViewColor = [UIColor colorWithHexString:@"52C9C5"];
    view.titileColror = [UIColor colorWithHexString:@"666666"];
    view.selectedColor = [UIColor colorWithHexString:@"66B2AF"];//x
    [view createView:@[@"互动",@"资料",@"AI分析"] andViewArr:@[vc1,vc2,vc3] andRootVc:self];
    [self.view addSubview:view];
    
    //自动滑动到第二页
    [view sliderToViewIndex:0];
    
}

- (IBAction)followAction:(UIButton *)sender {
    FollowVC* VC = [FollowVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}



- (IBAction)threeBtnAction:(UIButton *)sender {
    
   
}



- (IBAction)addTitleAction:(UIButton *)sender {
    
    TitleViewController* VC =[TitleViewController new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

- (IBAction)editorAction:(id)sender {
    
    DOPOrderDeatilVC* VC = [DOPOrderDeatilVC new];
    [self.navigationController pushViewController:VC animated:YES];
}


@end

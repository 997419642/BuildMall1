//
//  PersonalInformationDetailsVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/28.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "PersonalInformationDetailsVC.h"
#import "RadarCapabilityMapVC.h"
#import "BOSSDataAnalysisVC.h"
#import "BOSSInteractiveFollowVC.h"

@interface PersonalInformationDetailsVC ()
@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIViewController *currentVC;//!<当前控制器
@property(nonatomic,strong)UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerX;

@end

@implementation PersonalInformationDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"BOSS报表";
    _contentView = [[UIView alloc] init];
    [self.view addSubview: _contentView];
//    _contentView.sd_layout.topEqualToView(self.view).offset(228).rightEqualToView(self.view).leftEqualToView(self.view).bottomEqualToView(self.view).offset(0);
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(228);
        make.left.right.bottom.equalTo(self.view).offset(0);
    }];
    
    _contentView.clipsToBounds = YES;
    [self addChildControllers];
    
    self.selectBtn = self.oneBtn;
   
    
}
- (IBAction)cardAction:(UIButton *)sender {
}
- (IBAction)changeAction:(UIButton *)sender {
    
    if (self.selectBtn == sender) {
        return;
    }
    //    _lineView.frame = CGRectMake(_leftBtn.width*sender.tag, 35, sender.width, 5);
    
    self.selectBtn.selected = !self.selectBtn.selected;
    _centerX.constant = sender.x;
    
    UIViewController* VC = self.childViewControllers[sender.tag];
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {
            //            self.center.constant = sender.centerX;
            
        }else if(sender.tag == 1){
            
            //            self.leading.constant = sender.x+5;
        }
        
    }else
    {
        sender.selected = NO;
    }
    
    self.selectBtn = sender;
    [_contentView addSubview:VC.view];
    VC.view.bounds = _contentView.bounds;
    [self replaceController:self.currentVC newController:VC];
}


- (void)addChildControllers
{
    RadarCapabilityMapVC *vc1 = [[RadarCapabilityMapVC alloc] init];
    vc1.view.tag = 0;
    [self addChildViewController:vc1];
    [_contentView addSubview:vc1.view];
    [self setVCLayout:vc1];
    self.currentVC = vc1;
    BOSSDataAnalysisVC *vc2 = [BOSSDataAnalysisVC new];
    [self addChildViewController:vc2];
    vc2.view.tag = 1;
    
    BOSSInteractiveFollowVC *vc3 = [BOSSInteractiveFollowVC new];
    [self addChildViewController:vc3];
    vc3.view.tag = 2;
    
}
-(void)setVCLayout:(UIViewController*)vc{
  vc.view.sd_layout.topEqualToView(_contentView).leftEqualToView(_contentView).rightEqualToView(_contentView).bottomEqualToView(_contentView);
    
//    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_contentView).offset(0);
//        make.left.right.bottom.equalTo(_contentView).offset(0);
//    }];
}

//切换视图View
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    __weak typeof(self)weakSelf = self;
    
    [self transitionFromViewController:oldController toViewController:newController duration:0 options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        if (finished) {
            [_contentView addSubview:newController.view];
            
            
            if (newController.view != oldController.view) {
                [oldController.view removeFromSuperview];
            }
            [weakSelf setVCLayout:newController];
            weakSelf.currentVC = newController;
        }else{
            weakSelf.currentVC = oldController;
        }
    }];
    
}

@end

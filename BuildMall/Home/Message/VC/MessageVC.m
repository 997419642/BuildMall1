//
//  MessageVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "MessageVC.h"
#import "ChatLIstVC.h"
#import "InteractiveVC.h"
#import "NTESSessionListViewController.h"

@interface MessageVC ()

@property(nonatomic,strong)UIViewController *currentVC;//!<当前控制器
@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIView *contentView;


@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView* topView = [UIView new];
//    topView.backgroundColor = [UIColor whiteColor];
    topView.frame = CGRectMake(0, 0, 120, 30);
    self.navigationItem.titleView = topView;
    
    
    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 69, 29);
    [topView addSubview:leftBtn];

    [leftBtn setTitle:@"聊天" forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;

    [leftBtn setTitleColor:MINE_Color forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"左边白色"] forState:UIControlStateNormal];
   
    
    leftBtn.tag = 0;
    leftBtn.selected = YES;
    _selectBtn = leftBtn;
    [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton* rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(69, 0, 69, 29)];
    [rightBtn setTitle:@"互动" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"右边框"] forState:UIControlStateNormal];
    [topView addSubview:rightBtn];
    rightBtn.adjustsImageWhenHighlighted = NO;

    rightBtn.tag = 1;
    [rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _contentView = [[UIView alloc] init];
    [self.view addSubview: _contentView];
//    _contentView.sd_layout.topSpaceToView(self.view,0).rightEqualToView(self.view).leftEqualToView(self.view).bottomEqualToView(self.view).offset(0);
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view).offset(0);
    }];
    
    _contentView.clipsToBounds = YES;
    [self addChildControllers];
    
}

- (void)addChildControllers
{
    NTESSessionListViewController *vc1 = [[NTESSessionListViewController alloc] init];
    vc1.view.tag = 0;
    [self addChildViewController:vc1];
    [_contentView addSubview:vc1.view];
    [self setVCLayout:vc1];
    self.currentVC = vc1;
    InteractiveVC *vc2 = [InteractiveVC new];
    [self addChildViewController:vc2];
    vc2.view.tag = 1;
    
}

-(void)setVCLayout:(UIViewController*)vc{
   
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(_contentView).offset(0);
    }];
// vc.view.sd_layout.topEqualToView(_contentView).leftEqualToView(_contentView).rightEqualToView(_contentView).bottomEqualToView(_contentView);
}


-(void)btnAction:(UIButton *)sender
{
    
    if (self.selectBtn == sender) {
        return;
    }
    
    self.selectBtn.selected = !self.selectBtn.selected;
    if (self.selectBtn.tag == 0) {
        
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"左边框"] forState:UIControlStateNormal];
        [self.selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }else
    {
        [self.selectBtn setBackgroundImage:[UIImage imageNamed:@"右边框"] forState:UIControlStateNormal];
        
        [self.selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    
    
    UIViewController* VC = self.childViewControllers[sender.tag];
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {

            [sender setTitleColor:MINE_Color forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"左边白色"] forState:UIControlStateNormal];
            
            
        }else if(sender.tag == 1){
            
            [sender setTitleColor:MINE_Color forState:UIControlStateNormal];

            [sender setBackgroundImage:[UIImage imageNamed:@"右边白色"] forState:UIControlStateNormal];
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

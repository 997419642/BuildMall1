//
//  InteractiveVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "InteractiveVC.h"
#import "RecordVC.h"
#import "CustomerVC.h"


@interface InteractiveVC ()
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property(nonatomic,strong)UIViewController *currentVC;//!<当前控制器
@property(nonatomic,strong)UIButton* selectBtn;

@property(nonatomic,strong)UIView *contentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leading;

@end

@implementation InteractiveVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _contentView = [[UIView alloc] init];
    [self.view addSubview: _contentView];
    
//    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(43);
//        make.bottom.left.right.equalTo(self.view).offset(0);
//    }];
 
    _contentView.sd_layout.topSpaceToView(self.view, 43).rightEqualToView(self.view).leftEqualToView(self.view).bottomSpaceToView(self.view, 0);
    
    _contentView.clipsToBounds = YES;
    [self addChildControllers];
    self.selectBtn = self.leftBtn;
    
}
- (void)addChildControllers
{
    RecordVC *vc1 = [[RecordVC alloc] init];
    vc1.view.tag = 0;
    [self addChildViewController:vc1];
    [_contentView addSubview:vc1.view];
    [self setVCLayout:vc1];
    self.currentVC = vc1;
    CustomerVC *vc2 = [CustomerVC new];
    [self addChildViewController:vc2];
    vc2.view.tag = 1;
    
}


-(void)setVCLayout:(UIViewController*)vc{
    vc.view.sd_layout.topEqualToView(_contentView).leftEqualToView(_contentView).rightEqualToView(_contentView).bottomEqualToView(_contentView);
    
//    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(0);
//        make.bottom.left.right.equalTo(_contentView).offset(0);
//    }];
}

- (IBAction)leftAction:(UIButton *)sender {
    
    if (self.selectBtn == sender) {
        return;
    }

//    _lineView.frame = CGRectMake(_leftBtn.width*sender.tag, 35, sender.width, 5);

    self.selectBtn.selected = !self.selectBtn.selected;
    
    
    UIViewController* VC = self.childViewControllers[sender.tag];
    if (sender.selected == NO) {
        sender.selected = YES;
        if (sender.tag == 0) {
           self.leading.constant = sender.x+30;
            
        }else if(sender.tag == 1){

            self.leading.constant = sender.x+5;
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

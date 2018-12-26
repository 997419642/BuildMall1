//
//  PersonDetailVC.m
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "PersonDetailVC.h"
#import "CustomerDetailVC.h"
#import "SetRemarkVC.h"
#import "RightDetailVC.h"
#import "MoveGroupVC.h"
#import "LookCardVC.h"

@interface PersonDetailVC ()
{
    UIView * _backWindowView;
    
}
@property (weak, nonatomic) IBOutlet UIButton *chatBtn;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;

@property(nonatomic,strong) UIView* backView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewheight;

@property (weak, nonatomic) IBOutlet UIView *groupView;

@end

@implementation PersonDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"详细信息";
    self.chatBtn.layer.cornerRadius = 5;
    
    self.videoBtn.layer.cornerRadius = 5;
    
    UIBarButtonItem *backItem =[[UIBarButtonItem alloc]init];
    self.navigationItem.backBarButtonItem = backItem;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    [button setImage:[UIImage imageNamed:@"new"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressright) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    [self creatRightView];
    
    
    
//    _viewheight.constant = 0;
//    _groupView.hidden = YES;

    
}

-(void)creatRightView
{
    
    _backWindowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _backWindowView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_backWindowView];
    
    UIView* backView = [UIView new];
    _backView = backView;
    backView.backgroundColor = [UIColor colorWithHexString:@"52C9C5"];
    [_backWindowView addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(7);
        make.width.equalTo(@(130));
        make.height.equalTo(@(95));
    }];
    
    UIImageView* imgView = [UIImageView new];
    [backView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(backView).offset(0);
    }];
    
    UIImageView* oneImg = [UIImageView new];
    oneImg.image = [UIImage imageNamed:@"转移"];
    [backView addSubview:oneImg];
    [oneImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView).offset(19);
        make.left.equalTo(backView).offset(23);
        make.width.height.equalTo(@(19));
    }];
    
    UIButton* oneBtn = [UIButton new];
    [backView addSubview:oneBtn];

    [oneBtn addTarget:self action:@selector(moveGroup) forControlEvents:UIControlEventTouchUpInside];
    [oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(backView).offset(0);
        make.top.equalTo(backView).offset(0);
        make.height.equalTo(@(40));
    }];
    
    
    UILabel* oneLable = [UILabel new];
    oneLable.text = @"转移分组";
    oneLable.font = [UIFont systemFontOfSize:12];
    oneLable.textColor = [UIColor whiteColor];
    [backView addSubview:oneLable];
    [oneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneImg.mas_right).offset(14);
        make.centerY.equalTo(oneImg);
        
    }];
    
    UIView* lineView = [UIView new];
    lineView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).offset(25);
        make.right.equalTo(backView).offset(-23);
        make.top.equalTo(oneLable.mas_bottom).offset(10);
        make.height.equalTo(@(1));
    }];
    
    UIImageView* twoImg = [UIImageView new];
    twoImg.image = [UIImage imageNamed:@"转让"];
    [backView addSubview:twoImg];
    [twoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView).offset(7);
        make.left.equalTo(backView).offset(23);
        make.width.height.equalTo(@(19));
    }];
    
    UILabel* twoLable = [UILabel new];
    twoLable.text = @"转让客户";
    twoLable.font = [UIFont systemFontOfSize:12];
    twoLable.textColor = [UIColor whiteColor];
    [backView addSubview:twoLable];
    [twoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneImg.mas_right).offset(14);
        make.centerY.equalTo(twoImg);
    }];
    
    
    UIButton* twoBtn = [UIButton new];
    [backView addSubview:twoBtn];
    [twoBtn addTarget:self action:@selector(transfeustomer) forControlEvents:UIControlEventTouchUpInside];
    [twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(backView).offset(0);
        make.top.equalTo(lineView).offset(0);
        make.height.equalTo(@(40));
    }];
    

    
    _backWindowView.hidden = YES;
    backView.hidden = YES;
    
    
    UITapGestureRecognizer *r5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange)];
    r5.numberOfTapsRequired = 1;
    [_backWindowView addGestureRecognizer:r5];
    
}

-(void)doTapChange
{
    _backView.hidden = YES;
    _backWindowView.hidden = YES;
}

-(void)moveGroup
{
    MoveGroupVC* VC = [MoveGroupVC new];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)transfeustomer
{
    
}

- (IBAction)headAction:(UIButton *)sender {
    
    RightDetailVC* VC = [RightDetailVC new];
    [self.navigationController pushViewController:VC animated:YES];
    
}
-(void)pressright
{
    if (_backView.hidden == YES) {
        _backWindowView.hidden = NO;
        _backView.hidden = NO;
    }else
    {
        _backView.hidden = YES;
        _backWindowView.hidden = YES;


    }
}

- (IBAction)setRemarkAction:(UIButton *)sender {
    SetRemarkVC* VC =[SetRemarkVC new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (IBAction)smartCardAction:(UIButton *)sender {
    
    LookCardVC* VC = [LookCardVC new];
    
    [self.navigationController pushViewController:VC animated:YES];

}
- (IBAction)AIDataAction:(UIButton *)sender {
    
    CustomerDetailVC* VC = [CustomerDetailVC new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)moreAction:(UIButton *)sender {
    
    
}
- (IBAction)groupAction:(UIButton *)sender {
    
}



@end

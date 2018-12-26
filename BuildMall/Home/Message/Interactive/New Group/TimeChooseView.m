//
//  TimeChooseView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "TimeChooseView.h"

@implementation TimeChooseView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [_leftbtn.layer setMasksToBounds:YES];
    [_leftbtn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [_leftbtn.layer setBorderWidth:1.0];

    [_leftbtn.layer setBorderColor:[UIColor groupTableViewBackgroundColor].CGColor];//边框颜色
    
    _leftbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);

    [_rightBtn.layer setMasksToBounds:YES];
    [_rightBtn.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [_rightBtn.layer setBorderWidth:1.0];
    [_rightBtn.layer setBorderColor:[UIColor groupTableViewBackgroundColor].CGColor];//边框颜色
    
    _rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);

    
    
}

- (IBAction)leftAction:(UIButton *)sender {
    
    [self.delegate didClickLeftChooseButton];
}
- (IBAction)rightAction:(UIButton *)sender {
    
    [self.delegate didClickRightChooseButton];
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [_backgroupView removeFromSuperview];
    [self removeFromSuperview];
}

- (IBAction)sureAction:(UIButton *)sender {
    
    [self.delegate didClickSureButton];
}

- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        
//        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
//        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
//        //        tapGestureRecognizer.cancelsTouchesInView = YES;
//        //将触摸事件添加到当前view
//        [_backgroupView addGestureRecognizer:tapGestureRecognizer];
    }
    return _backgroupView;
}

//-(void)keyboardHide:(UITapGestureRecognizer*)tap{
//    
//    [_backgroupView removeFromSuperview];
//    [self removeFromSuperview];
//    
//}

+ (instancetype)timeChooseView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TimeChooseView" owner:nil options:0] firstObject];
}
///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    
    [self.backgroupView addSubview:self];
    
    //(screenW-300)/2
    self.frame = CGRectMake(30, screenH * 0.35, screenW-60 ,200);
    
}

@end

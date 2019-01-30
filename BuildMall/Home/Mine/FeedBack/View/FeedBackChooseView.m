//
//  FeedBackChooseView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "FeedBackChooseView.h"

@implementation FeedBackChooseView


- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
        //    tapGestureRecognizer.cancelsTouchesInView = YES;
        //将触摸事件添加到当前view
        [_backgroupView addGestureRecognizer:tapGestureRecognizer];
    }
    return _backgroupView;
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{

    [_backgroupView removeFromSuperview];
    [self removeFromSuperview];

}

+ (instancetype)FeedBackView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FeedBackChooseView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    
    [self.backgroupView addSubview:self];
    
    self.frame = CGRectMake(0, screenH - 185, screenW ,185);
    
}

- (IBAction)btnAction:(UIButton *)sender {
    
    [_delegate didClickButton:sender];
    
}

@end

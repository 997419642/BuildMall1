//
//  ErrorMessageView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "ErrorMessageView.h"

@implementation ErrorMessageView

- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];

    }
    return _backgroupView;
}

+ (instancetype)errorMessageView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ErrorMessageView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(60, screenH * 0.35, screenW-120 ,160);
    
}

- (IBAction)cancelAction:(UIButton *)sender {
    [_backgroupView removeFromSuperview];
    [self removeFromSuperview];
}


@end

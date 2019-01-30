//
//  AudioChooseView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/22.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "AudioChooseView.h"

@implementation AudioChooseView
- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    }
    return _backgroupView;
}
+ (instancetype)audioChooseView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AudioChooseView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    
    [self.backgroupView addSubview:self];
    
    self.frame = CGRectMake(0, screenH - 140, screenW ,140);
    
}

- (IBAction)AudioAction:(UIButton *)sender {
    
     [_delegate didClickButtonAudio:sender];
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [self removeFromSuperview];
    [self.backgroupView removeFromSuperview];
}

@end

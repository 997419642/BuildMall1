//
//  SubmittedSuccessfullyView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SubmittedSuccessfullyView.h"

@implementation SubmittedSuccessfullyView


- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
    }
    return _backgroupView;
}

+ (instancetype)addSubmittedView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SubmittedSuccessfullyView" owner:nil options:0] firstObject];
}


///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(20, screenH *0.4, screenW - 40, 152);
}

- (IBAction)cancelAction:(UIButton *)sender {
    [self.backgroupView removeFromSuperview];

    
}


@end

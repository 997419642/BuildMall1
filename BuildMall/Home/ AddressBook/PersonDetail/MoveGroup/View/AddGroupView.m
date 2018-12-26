//
//  AddGroupView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/17.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "AddGroupView.h"

@interface AddGroupView ()

@property(nonatomic,strong)UIView *backgroupView;


@end

@implementation AddGroupView

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

+ (instancetype)addGroupView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"AddGroupView" owner:nil options:0] firstObject];
}


///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(20, screenH *0.3, screenW - 40, 165);
}



- (IBAction)cancel:(UIButton *)sender {
    
    [self.backgroupView removeFromSuperview];
}
- (IBAction)sureAction:(UIButton *)sender {
}

@end

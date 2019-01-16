//
//  DeleteView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "DeleteView.h"



@implementation DeleteView

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

+ (instancetype)addDeleteVView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DeleteView" owner:nil options:0] firstObject];
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

- (IBAction)sureAction:(UIButton *)sender {
    
     [_delegate sureDelete:_orderID noticeId:_noticeId];

}


@end

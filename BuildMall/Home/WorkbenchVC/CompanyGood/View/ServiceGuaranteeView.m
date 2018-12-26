//
//  ServiceGuaranteeView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "ServiceGuaranteeView.h"

@implementation ServiceGuaranteeView

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

+ (instancetype)addSureView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ServiceGuaranteeView" owner:nil options:0] firstObject];
}


///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(0, screenH, screenW, 505);
    
    [self showAnimation];

}
- (void)showAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH-505;
        self.frame = frame;
    }];
}


- (void)hideAnimation{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = screenH;
        self.frame = frame;
    } completion:^(BOOL finished) {
        
        [self.backgroupView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (IBAction)sureAction:(id)sender {
    
    [self hideAnimation];

}

@end

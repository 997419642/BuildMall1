//
//  DynamicChooseView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/19.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "DynamicChooseView.h"

@interface DynamicChooseView ()
@property(nonatomic,strong)UIView *backgroupView;
@property(nonatomic,strong)UIButton *selBtn;


@end
@implementation DynamicChooseView
- (UIView *)backgroupView
{
    if (_backgroupView == nil) {
        _backgroupView = [UIView new];
        _backgroupView.frame = CGRectMake(0, 0, screenW, screenH);
        _backgroupView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        
        _photoBtn.layer.masksToBounds = YES;
        _photoBtn.layer.cornerRadius = 5;
        _photoBtn.layer.borderWidth = 1;
        _photoBtn.layer.borderColor = [UIColor colorWithHexString:@"FFAC1A"].CGColor;
        
        _videoBtn.layer.masksToBounds = YES;
        _videoBtn.layer.cornerRadius = 5;
        _videoBtn.layer.borderWidth = 1;
        _videoBtn.layer.borderColor = MINE_Color.CGColor;
    }
    return _backgroupView;
}

- (IBAction)videoAction:(UIButton *)sender {
    self.selBtn.selected = NO;
    sender.selected = !sender.selected;
    self.selBtn = sender;
    if ([self.delegate respondsToSelector:@selector(photoView:selectBtn:)]) {
        [self.delegate photoView:self selectBtn:sender];
    }
    
}

+ (instancetype)dynamicChooseView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DynamicChooseView" owner:nil options:0] firstObject];
}

///显示
- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroupView];
    [self.backgroupView addSubview:self];
    self.frame = CGRectMake(0, screenH-140-safeBottomt, screenW, 140);
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [self.backgroupView removeFromSuperview];

}

@end

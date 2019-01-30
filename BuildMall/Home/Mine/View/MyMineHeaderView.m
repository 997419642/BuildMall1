//
//  MineHeaderView.m
//  BuildMall
//
//  Created by 51wood on 2019/1/21.
//  Copyright © 2019 51wood. All rights reserved.
//

#import "MyMineHeaderView.h"

@implementation MyMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        MyMineHeaderView *v = [[[NSBundle mainBundle] loadNibNamed:@"MyMineHeaderView" owner:self options:nil] lastObject];
        v.frame = frame;
        
        self = v;
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    CGFloat img_W = _myPickerBtn.imageView.frame.size.width;
    CGFloat tit_W = _myPickerBtn.titleLabel.frame.size.width;
    _myPickerBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + 10 / 2 - 3),
        .bottom = 0,
        .right  =   (img_W + 10 / 2),
    };
    
    _myPickerBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W + 10 / 2),
    };
}

- (IBAction)myCardAction:(UIButton *)sender {
    
    [_delegate didClickMCardButton:sender];
}
- (IBAction)leftAction:(id)sender {
    
}

- (IBAction)rightAction:(id)sender {
    
}

@end

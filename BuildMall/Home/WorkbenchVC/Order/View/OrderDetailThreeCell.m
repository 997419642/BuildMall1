//
//  OrderDetailThreeCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderDetailThreeCell.h"

@implementation OrderDetailThreeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    CGFloat img_W = _stateBtn.imageView.frame.size.width;
    CGFloat tit_W = _stateBtn.titleLabel.frame.size.width;
    _stateBtn.titleEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   = - (img_W + 10 / 2),
        .bottom = 0,
        .right  =   (img_W + 10 / 2),
    };
    
    _stateBtn.imageEdgeInsets = (UIEdgeInsets){
        .top    = 0,
        .left   =   (tit_W + 10 / 2),
        .bottom = 0,
        .right  = - (tit_W + 10 / 2),
    };
}
- (IBAction)stateAction:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

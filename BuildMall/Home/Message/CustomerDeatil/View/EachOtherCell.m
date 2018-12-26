//
//  EachOtherCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "EachOtherCell.h"

@implementation EachOtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _blueView.layer.masksToBounds = YES;
    _blueView.layer.cornerRadius = 7;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

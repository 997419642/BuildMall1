//
//  SalesReportsCell.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SalesReportsCell.h"

@implementation SalesReportsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _changView.layer.masksToBounds = YES;
    _changView.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

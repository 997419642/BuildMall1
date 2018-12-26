//
//  CloseOrderCell.m
//  BuildMall
//
//  Created by 51wood on 2018/12/21.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "CloseOrderCell.h"

@implementation CloseOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDict:(CloseOrdermodel *)dict
{
    _dict = dict;
    _nameLable.text = dict.type;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

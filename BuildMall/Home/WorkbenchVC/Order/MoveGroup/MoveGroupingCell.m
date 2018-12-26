//
//  MoveGroupingCell.m
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "MoveGroupingCell.h"

@implementation MoveGroupingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(MoveGroupingModel *)model
{
     _model = model;
     NSMutableDictionary* dict =  [model.configure mj_JSONObject];
    _countLable.text = [NSString stringWithFormat:@"账户：%@",model.code];
//    _userLable.text = [NSString stringWithFormat:@"户名：%@",dict[@"openName"]];
    _nameLable.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

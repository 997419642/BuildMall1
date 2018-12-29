//
//  AddLoadingOneCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingOneCell.h"

@implementation AddLoadingOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(OrderDetailModel *)model
{
//    _model = model;
//    if ([model.categoryId isEqualToString:@"1"]) {
//        _nameLable.text = @"原木";
//        
//    }else if([model.categoryId isEqualToString:@"2"])
//    {
//        _nameLable.text = @"实木板材";
//        
//    }
}

-(void)setDict:(NSMutableDictionary *)dict
{
     _adressLable.text = [NSString stringWithFormat:@"%@  地址:%@",dict[@"name"],dict[@"address"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

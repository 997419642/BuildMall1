//
//  CustomerTwoCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/8.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "CustomerTwoCell.h"

@implementation CustomerTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _imgView.layer.masksToBounds = YES;
    _imgView.layer.cornerRadius = 5;
    
  

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

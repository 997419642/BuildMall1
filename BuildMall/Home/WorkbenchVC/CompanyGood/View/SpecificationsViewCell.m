//
//  SpecificationsViewCell.m
//  BuildMall
//
//  Created by 51wood on 2018/12/1.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "SpecificationsViewCell.h"

@implementation SpecificationsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _titleLable.layer.masksToBounds = YES;
    _titleLable.layer.cornerRadius = 2;

}

@end

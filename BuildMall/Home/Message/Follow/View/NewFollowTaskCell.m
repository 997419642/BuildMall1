//
//  NewFollowTaskCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/14.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "NewFollowTaskCell.h"

@implementation NewFollowTaskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 52, 52)];
        self.imgView.layer.cornerRadius = 52/2;
        self.imgView.clipsToBounds = YES;
        [self.contentView addSubview:self.imgView];
        
        _nameLable = [UILabel new];
        _nameLable.textColor = [UIColor colorWithHexString:@"666666"];
        _nameLable.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_nameLable];
        [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imgView.mas_bottom).offset(7);
            make.centerX.equalTo(_imgView);
        }];
    }
    return self;
}



@end

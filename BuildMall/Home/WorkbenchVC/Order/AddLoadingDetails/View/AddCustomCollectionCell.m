//
//  AddCustomCollectionCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddCustomCollectionCell.h"

@implementation AddCustomCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.name = [[UILabel alloc] init];
        
        self.name.font = [UIFont systemFontOfSize:14];
//        self.name.backgroundColor = [UIColor colorWithHexString:@"F1F3FF"];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.textColor = [UIColor colorWithHexString:@"666666"];
        [self.contentView addSubview:self.name];
      
        
        _imgview = [UIImageView new];
        _imgview.image = [UIImage imageNamed:@"un-Check"];
        [self.contentView addSubview:_imgview];

        [_imgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.width.height.equalTo(@(16));
            make.bottom.equalTo(self.mas_bottom).offset(-5);
        }];
        
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_imgview);
            make.left.equalTo(_imgview.mas_right).offset(15);
        }];

    }
    return self;
}

@end

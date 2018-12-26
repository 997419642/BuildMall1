//
//  TitlePersonCellColleCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/16.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "TitlePersonCellColleCell.h"

@implementation TitlePersonCellColleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        self.name.font = [UIFont systemFontOfSize:11];
        self.name.backgroundColor = [UIColor colorWithHexString:@"F1F3FF"];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.textColor = [UIColor colorWithHexString:@"666666"];
        [self.contentView addSubview:self.name];
        self.layer.cornerRadius = 15;
        self.name.layer.cornerRadius = 15;
        self.name.layer.masksToBounds = YES;
    }
    return self;
}


@end

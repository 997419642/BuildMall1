//
//  InventoryQueryCell.m
//  BuildMall
//
//  Created by 51wood on 2018/12/6.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "InventoryQueryCell.h"

@implementation InventoryQueryCell

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
        self.name.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.textColor = [UIColor colorWithHexString:@"999999"];
        
        [self.contentView addSubview:self.name];
    }
    return self;
}

@end

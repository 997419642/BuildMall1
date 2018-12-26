//
//  InventoryQueryView.m
//  BuildMall
//
//  Created by 51wood on 2018/12/6.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "InventoryQueryView.h"

@implementation InventoryQueryView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView* view = [UIView new];
        view.backgroundColor = [UIColor colorWithHexString:@"A7B0FB"];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self);
            make.width.height.equalTo(@(8));
        }];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 4;
        
        
        self.title = [[UILabel alloc] init];
        self.title.font = [UIFont systemFontOfSize:16];
        self.title.textColor = [UIColor colorWithHexString:@"666666"];
        self.title.numberOfLines = 0;
        self.title.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(20);
            make.centerY.equalTo(view);
            
        }];
    }
    return self;
}


@end

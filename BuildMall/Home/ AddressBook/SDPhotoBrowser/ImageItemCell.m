//
//  ImageItemCell.m
//  YouDaSuPei
//
//  Created by 米海波 on 16/7/8.
//  Copyright © 2016年 mihb. All rights reserved.
//

#import "ImageItemCell.h"
#import "UIView+SDAutoLayout.h"

@implementation ImageItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.imageView];
        self.imageView.userInteractionEnabled =YES;
        [self.imageView.layer setCornerRadius:4];
        [self.imageView.layer setMasksToBounds:YES];
        self.imageView.layer.borderColor = SPLIT_LINE.CGColor;
        self.imageView.layer.borderWidth = 0.5;
        self.imageView.sd_layout.topEqualToView(self).rightEqualToView(self).leftEqualToView(self).bottomEqualToView(self);
        //删除按钮的实现
        self.delBtn =  [UIButton new];
        [self.delBtn setImage:[UIImage imageNamed:@"iconcancel"] forState:UIControlStateNormal];
        
        [self.imageView addSubview:self.delBtn];
        self.delBtn.sd_layout.topEqualToView(_imageView).rightEqualToView(_imageView).heightIs(20).widthIs(20);
    }
    return self;
}

@end

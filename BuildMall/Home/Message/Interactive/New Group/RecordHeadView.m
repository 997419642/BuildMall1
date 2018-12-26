//
//  RecordHeadView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/7.
//  Copyright © 2018年 51wood. All rights reserved.
//

#import "RecordHeadView.h"

@implementation RecordHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        RecordHeadView *v = [[[NSBundle mainBundle] loadNibNamed:@"RecordHeadView" owner:self options:nil] lastObject];
        v.frame = frame;
        
        self = v;
        
    }
    return self;
}

@end

//
//  OrderDetailOneCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderDetailOneCell.h"

@implementation OrderDetailOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(OrderLogModel *)model
{
    _model = model;
    _statelable.text = _model.logType;
//    _timeLable.text = model.createTime;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *startDate =[formatter dateFromString:model.createTime];
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:start];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    _timeLable.text = dateString;
    if ([model.isOne isEqualToString:@"YES"]) {
        _topView.hidden = YES;
    }else
    {
        _topView.hidden = NO;
    }
  
    
}



@end

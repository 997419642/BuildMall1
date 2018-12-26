//
//  OrderHeaderView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderHeaderView.h"

@implementation OrderHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        OrderHeaderView *v = [[[NSBundle mainBundle] loadNibNamed:@"OrderHeaderView" owner:self options:nil] lastObject];
        v.frame = frame;
        
        self = v;
        _stateDetail.hidden = YES;
        
        _secondsLable.hidden = YES;
        _miniteLable.hidden = YES;
        
    }
    return self;
}
- (IBAction)gotoStoreAction:(UIButton *)sender {
    [_delegate goStoreAction:_model.storeId];
}

-(void)setModel:(OrderManageModel *)model
{
    _model = model;
    
    if ([model.orderStatus isEqualToString:@"2"]) {
        
        if (model.actualMoney) {
            
            NSMutableArray* arr = (NSMutableArray *)model.actualMoney;
            
            if (arr.count) {
                NSMutableDictionary* actualDict = arr[0];
                if (![actualDict[@"createTime"] isEqual:[NSNull null]]) {
                    
                    
                    _secondsLable.hidden = NO;
                    _miniteLable.hidden = NO;
                    
                    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                    
                    NSDate *now = [NSDate date];
                    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
                    NSDate *startDate =[formatter dateFromString:actualDict[@"createTime"]];
                    
                    NSString *nowstr = [formatter stringFromDate:now];
                    NSDate *nowDate = [formatter dateFromString:nowstr];
                    
                    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
                    NSTimeInterval end = [nowDate timeIntervalSince1970]*1;
                    NSTimeInterval value = end - start;
                    NSTimeInterval endTime = 1800 - value;
                    
                    if (_timer==nil) {
                        __block int timeout = endTime; //倒计时时间
                        
                        if (timeout!=0) {
                            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                            _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
                            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
                            dispatch_source_set_event_handler(_timer, ^{
                                if(timeout<=0){ //倒计时结束，关闭
                                    dispatch_source_cancel(_timer);
                                    _timer = nil;
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        
                                        _miniteLable.text = @"00:";
                                        _secondsLable.text = @"00";
                                        
                                        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
                                        [dict setObject:model.orderId forKey:@"Idd"];
                                        [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteOrder" object:model.orderId userInfo:dict];
                                        
                                    });
                                    
                                }else{
                                    int days = (int)(timeout/(3600*24));
                                    if (days==0) {
                                        //                        detailCell.dayLabel.text = @"";
                                    }
                                    int hours = (int)((timeout-days*24*3600)/3600);
                                    int minute = (int)(timeout-days*24*3600-hours*3600)/60;
                                    int second = timeout-days*24*3600-hours*3600-minute*60;
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        if (days==0) {
                              
                                        }else{
                           
                                        }
                                        if (hours<10) {
                            
                                        }else{
                          
                                        }
                                        if (minute<10) {
                                            _miniteLable.text = [NSString stringWithFormat:@"0%d:",minute];
                                        }else{
                                            _miniteLable.text = [NSString stringWithFormat:@"%d:",minute];
                                        }
                                        if (second<10) {
                                            _secondsLable.text = [NSString stringWithFormat:@"0%d",second];
                                        }else{
                                            _secondsLable.text = [NSString stringWithFormat:@"%d",second];
                                        }
                                        
                                    });
                                    timeout--;
                                }
                            });
                            dispatch_resume(_timer);
                        }
                    }
                }
            }
            
        }
        
    }
    

    _nameLable.text = model.storeName;
    _orderNum.text = [NSString stringWithFormat:@"订单号：%@",model.orderSn];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDate *startDate =[formatter dateFromString:model.createTime];
    NSTimeInterval start = [startDate timeIntervalSince1970]*1;
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:start];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    NSLog(@"服务器返回的时间戳对应的时间是:%@",dateString);
    
    _timeLable.text = dateString;
    
    if ([model.orderStatus isEqualToString:@"0"]) {
        
        _stateLable.text = @"订单失败";
        _stateDetail.hidden = NO;


    }else if ([model.orderStatus isEqualToString:@"1"])
    {
        _stateLable.text = @"待审核";
    }else if ([model.orderStatus isEqualToString:@"2"])
    {
        _stateLable.text = @"待付款";
        
    }else if ([model.orderStatus isEqualToString:@"3"])
    {
        _stateLable.text = @"待收款";
        
    }else if ([model.orderStatus isEqualToString:@"4"])
    {
        _stateLable.text = @"待装货";
        
    }else if ([model.orderStatus isEqualToString:@"5"])
    {
        _stateLable.text = @"待装货确认";
        
    }else if([model.orderStatus isEqualToString:@"6"])
    {
        _stateLable.text = @"待结算";
        
    }else if([model.orderStatus isEqualToString:@"7"])
    {
        _stateLable.text = @"待确认结算";
        
    }else if ([model.orderStatus isEqualToString:@"8"])
    {
        _stateLable.text = @"待发货";
        
    }else if ([model.orderStatus isEqualToString:@"9"])
    {
        _stateLable.text = @"待收货";
        
    }
}

@end

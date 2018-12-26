//
//  OrderFooterView.m
//  BuildMall
//
//  Created by 51wood on 2018/11/24.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderFooterView.h"

@implementation OrderFooterView


-(void)awakeFromNib
{
    [super awakeFromNib];
    
    _deleteBtn.layer.masksToBounds = YES;
    _deleteBtn.layer.cornerRadius = 15;
    _deleteBtn.layer.borderWidth = 1;
    _deleteBtn.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
}

-(void)setModel:(OrderManageModel *)model
{
    _model = model;
    self.tag = [model.orderId integerValue];
    _priceLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
    
    NSMutableArray* numArray = [NSMutableArray array];
    
    for (OrderDetailModel* model0 in model.orderDetailList) {
        [numArray addObject:model0.buyNumber];
        
    }
    
    int sum = [[numArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    _numLable.text = [NSString stringWithFormat:@"共%d件",sum];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        OrderFooterView *v = [[[NSBundle mainBundle] loadNibNamed:@"OrderFooterView" owner:self options:nil] lastObject];
        v.frame = frame;
        
        self = v;
        
    }
    return self;
}

- (IBAction)deleteAction:(UIButton *)sender {
    
    [_delegate deleteAction:_model.orderId];
}

@end

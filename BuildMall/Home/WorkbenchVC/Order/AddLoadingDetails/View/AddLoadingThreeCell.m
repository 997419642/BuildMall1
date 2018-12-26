//
//  AddLoadingThreeCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingThreeCell.h"

@implementation AddLoadingThreeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(OrderManageModel *)model
{
    NSMutableArray* numArray = [NSMutableArray array];
    NSMutableArray* unitArray = [NSMutableArray array];
    
    for (OrderDetailModel* model0 in model.orderDetailList) {
        [numArray addObject:model0.buyNumber];
        
        int num = [model0.unitNum intValue] * [model0.buyNumber intValue];
        [unitArray addObject:@(num)];
    }
    
    OrderDetailModel* detailModel = model.orderDetailList[0];
    
    int sum = [[numArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    float unit = [[unitArray valueForKeyPath:@"@sum.floatValue"] floatValue];
    
    _allVolumeLable.text = [NSString stringWithFormat:@"共%d件 %.2f%@",sum,unit,detailModel.goodsNuit];
    _allPriceLable.text = [NSString stringWithFormat:@"￥%@",model.totalPrice];
    
}



@end

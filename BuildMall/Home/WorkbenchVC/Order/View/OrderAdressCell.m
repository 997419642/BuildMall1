//
//  OrderAdressCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "OrderAdressCell.h"

@implementation OrderAdressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(OrderDetailModel *)model
{
    _model = model;
    
    NSMutableArray* productTableList = (NSMutableArray *)model.productTableList;
    NSMutableDictionary* tableDic = productTableList[0];
    _namelable.text = tableDic[@"title"];
    
}

-(void)setDict:(NSDictionary *)dict
{
    _adresslable.text = [NSString stringWithFormat:@"%@  地址:%@",dict[@"name"],dict[@"address"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

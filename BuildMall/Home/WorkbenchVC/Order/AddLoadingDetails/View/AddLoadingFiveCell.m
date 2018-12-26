//
//  AddLoadingFiveCell.m
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "AddLoadingFiveCell.h"

@implementation AddLoadingFiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _addCustomBtn.layer.masksToBounds = YES;
    _addCustomBtn.layer.cornerRadius =5;
    _addCustomBtn.layer.borderWidth = 1;
    _addCustomBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    
    _addGoodsBtn.layer.masksToBounds = YES;
    _addGoodsBtn.layer.cornerRadius = 5;
    _addGoodsBtn.layer.borderColor = [UIColor colorWithHexString:@"52C9C5"].CGColor;
    _addGoodsBtn.layer.borderWidth  = 1;
    
    _submitBtn.layer.masksToBounds = YES;
    _submitBtn.layer.cornerRadius = 5;
}
-(void)setDict:(NSMutableDictionary *)dict
{
    _dict = dict;
    
}


- (IBAction)customAddAction:(UIButton *)sender {
    
    [_delegate addCustomAction:self];
}
- (IBAction)addGoodAction:(UIButton *)sender {
    
    [_delegate addGoodsAction:self];
}
- (IBAction)submitAction:(UIButton *)sender {
    [_delegate subMitAction:self];
}

@end

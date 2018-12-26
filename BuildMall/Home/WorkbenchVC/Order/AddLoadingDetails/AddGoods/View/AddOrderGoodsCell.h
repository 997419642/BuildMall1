//
//  AddOrderGoodsCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/26.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsBeansListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddOrderGoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;
@property (weak, nonatomic) IBOutlet UILabel *lenthLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *parcksLable;


@property(nonatomic,strong)GoodsBeansListModel* model;

@property(nonatomic,strong)NSMutableDictionary* dict;

@property(nonatomic,strong)GoodsBeansListModel* parksModel;

@property(nonatomic,strong)NSMutableDictionary* parksDict;
@property(nonatomic,strong)NSMutableDictionary* detailParkDict;


@end

NS_ASSUME_NONNULL_END

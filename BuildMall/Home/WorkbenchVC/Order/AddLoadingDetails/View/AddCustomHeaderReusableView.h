//
//  AddCustomHeaderReusableView.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"
#import "OrderDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddCustomHeaderReusableView : UICollectionReusableView

//@property(nonatomic,strong)UILabel* title;
//@property(nonatomic,strong)UILabel* adressLable;
//@property(nonatomic,strong)UILabel* nameLable;
//@property(nonatomic,strong)UILabel* volumeLable;
//@property(nonatomic,strong)UILabel* numLable;
//@property(nonatomic,strong)UILabel* mentionLable;
//@property(nonatomic,strong)UILabel* munitPriceLable;

@property(nonatomic,strong)OrderManageModel* model;
@property(nonatomic,strong)OrderDetailModel* detailmodel;
@property(nonatomic,strong)NSMutableDictionary* dict;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;
@property (weak, nonatomic) IBOutlet UILabel *pinnameLable;
@property (weak, nonatomic) IBOutlet UILabel *spacelLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *unitPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *yitiLable;

@end

NS_ASSUME_NONNULL_END

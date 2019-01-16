//
//  AddLoadingTwoCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddLoadingTwoCell : UITableViewCell

@property(nonatomic,strong)OrderDetailModel* detailModel;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *spactilLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UILabel *yitiLable;
@property (weak, nonatomic) IBOutlet UILabel *unitPriceLable;

@property(nonatomic,copy)NSString* hasTiStr;

@end

NS_ASSUME_NONNULL_END

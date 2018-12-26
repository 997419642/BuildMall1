//
//  AddLoadingOneCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface AddLoadingOneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *adressLable;
@property(nonatomic,strong)OrderDetailModel* model;
@property(nonatomic,strong)NSMutableDictionary* dict;
@end

NS_ASSUME_NONNULL_END

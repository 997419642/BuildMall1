//
//  LoadingListCell.h
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoadingListCell : UITableViewCell

@property(nonatomic,strong)NSMutableDictionary* dict;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *detailLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *volumeLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;

@end

NS_ASSUME_NONNULL_END

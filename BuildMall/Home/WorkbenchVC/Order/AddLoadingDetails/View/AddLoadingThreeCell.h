//
//  AddLoadingThreeCell.h
//  BuildMall
//
//  Created by 51wood on 2018/11/27.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface AddLoadingThreeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *allVolumeLable;
@property (weak, nonatomic) IBOutlet UILabel *allPriceLable;

@property(nonatomic,strong)OrderManageModel* model;

@end

NS_ASSUME_NONNULL_END

//
//  MoveGroupingCell.h
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoveGroupingModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MoveGroupingCell : UITableViewCell

@property(nonatomic,strong)MoveGroupingModel* model;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *userLable;
@property (weak, nonatomic) IBOutlet UILabel *countLable;
@property (weak, nonatomic) IBOutlet UILabel *hanghaoLable;

@end

NS_ASSUME_NONNULL_END

//
//  MoveGroupingVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/3.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"
#import "MoveGroupingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoveGroupingVC : BasicVC

@property(nonatomic,copy)void(^slectAccountIdBlock)(MoveGroupingModel* model);


@end

NS_ASSUME_NONNULL_END

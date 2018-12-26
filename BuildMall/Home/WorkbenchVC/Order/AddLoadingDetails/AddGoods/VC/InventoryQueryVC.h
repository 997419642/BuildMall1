//
//  InventoryQueryVC.h
//  BuildMall
//
//  Created by 51wood on 2018/12/6.
//  Copyright © 2018 51wood. All rights reserved.
//

#import "BasicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface InventoryQueryVC : BasicVC

@property(nonatomic,copy)NSString *categoryId;

@property(nonatomic,copy)void(^slectInventoryBlock)(NSMutableArray* arr);


@end

NS_ASSUME_NONNULL_END
